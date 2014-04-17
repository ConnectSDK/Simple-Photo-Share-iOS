//
//  ViewController.m
//  Simple Photo Share
//
//  Created by Jeremy White on 2/4/14.
//  Connect SDK Sample App by LG Electronics
//
//  To the extent possible under law, the person who associated CC0 with
//  this sample app has waived all copyright and related or neighboring rights
//  to the sample app.
//
//  You should have received a copy of the CC0 legalcode along with this
//  work. If not, see http://creativecommons.org/publicdomain/zero/1.0/.
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
	
    CapabilityFilter *imageFilter = [CapabilityFilter filterWithCapabilities:@[kMediaPlayerDisplayImage]];
    
    _discoveryManager = [DiscoveryManager sharedManager];
    [_discoveryManager setCapabilityFilters:@[imageFilter]];
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
    NSURL *imageURL = [NSURL URLWithString:@"http://ec2-54-201-108-205.us-west-2.compute.amazonaws.com/samples/media/photo.jpg"];
    NSURL *iconURL = [NSURL URLWithString:@"http://ec2-54-201-108-205.us-west-2.compute.amazonaws.com/samples/media/photoIcon.jpg"];
    
    [_device.mediaPlayer displayImage:imageURL
                              iconURL:iconURL
                                title:@"Sintel Character Design"
                          description:@"Blender Open Movie Project"
                             mimeType:@"image/jpeg"
                              success:^(LaunchSession *launchSession, id<MediaControl> mediaControl) {
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
