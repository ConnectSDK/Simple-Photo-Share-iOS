//
//  ViewController.h
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

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *shareImageButton;
@property (weak, nonatomic) IBOutlet UITextView *statusTextView;

- (IBAction)hShareImage:(id)sender;

@end
