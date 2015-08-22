//  Created by Phillipus on 19/09/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "CustomSegue.h"
#import "AppDelegate.h"

#define APP (AppDelegate*)[[UIApplication sharedApplication]delegate]
#define SCREEN [APP window]

@implementation CustomSegue

- (void)perform
{
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    // Add the destination view as a subview, temporarily
    [sourceViewController.view addSubview:destinationViewController.view];
    
    CGRect sourceFrame = sourceViewController.view.frame;
    CGFloat width = sourceFrame.size.width;
    CGFloat height = sourceFrame.size.height;
    
    CGFloat inertionBonus = SCREEN.frame.size.width * 0.1;
    
    // Transformation start
    __block CGPoint startPoint =  CGPointMake(SCREEN.center.x + width + inertionBonus, SCREEN.center.y);
    __block CGPoint endPoint = CGPointMake(SCREEN.center.x - width - inertionBonus, SCREEN.center.y);
    
//    __block CGPoint startPoint =  CGPointMake(SCREEN.center.x, SCREEN.center.y - height);
//    __block CGPoint endPoint = CGPointMake(SCREEN.center.x, SCREEN.center.y + height);
    
//    destinationViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
    destinationViewController.view.center = startPoint;
    sourceViewController.view.center = SCREEN.center;
    
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
//                         destinationViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         destinationViewController.view.center = startPoint;
                         sourceViewController.view.center = endPoint;
                         
                     }
                     completion:^(BOOL finished){
                         [sourceViewController presentViewController:destinationViewController animated:NO completion:nil];
                     }];
}

@end
