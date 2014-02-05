//
//  ViewController.m
//  Simple Photo Share
//
//  Created by Jeremy White on 2/4/14.
//
//

#import "ViewController.h"
#import <ConnectSDK/ConnectSDK.h>

@interface ViewController () <DevicePickerDelegate, ConnectableDeviceDelegate>

@end

@implementation ViewController
{
    DiscoveryManager *_discoveryManager;
    ConnectableDevice *_device;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _discoveryManager = [DiscoveryManager sharedManager];
    [_discoveryManager startDiscovery];
}

- (IBAction)hShareImage:(id)sender
{
    _discoveryManager.devicePicker.delegate = self;
    [_discoveryManager.devicePicker showPicker:self];
}

#pragma mark - DevicePickerDelegate

- (void)devicePicker:(DevicePicker *)picker didSelectDevice:(ConnectableDevice *)device
{
    _device = device;
    _device.delegate = self;
    [_device connect];
}

#pragma mark - ConnectableDeviceDelegate

- (void)connectableDeviceReady:(ConnectableDevice *)device
{
    NSURL *imageURL = [NSURL URLWithString:@"http://www.freesoftwaremagazine.com/files/nodes/3466/fig_sintel_style_study.jpg"];
    
    [_device.mediaPlayer displayImage:imageURL
                              iconURL:nil
                                title:@"Sintel"
                          description:@"Blender Open Movie Project"
                             mimeType:@"image/jpeg"
                              success:^(LaunchSession *launchSession) {
                                  [self.statusTextView setText:@"Successfully displayed image!"];
                              }
                              failure:^(NSError *error) {
                                  [self.statusTextView setText:[NSString stringWithFormat:@"An error occured while displaying image: %@", error.localizedDescription]];
                              }];
}

- (void)connectableDeviceDisconnected:(ConnectableDevice *)device withError:(NSError *)error
{
    
}

@end
