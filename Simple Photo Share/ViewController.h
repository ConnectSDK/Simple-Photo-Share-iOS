//
//  ViewController.h
//  Simple Photo Share
//
//  Created by Jeremy White on 2/4/14.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *shareImageButton;
@property (weak, nonatomic) IBOutlet UITextView *statusTextView;

- (IBAction)hShareImage:(id)sender;

@end
