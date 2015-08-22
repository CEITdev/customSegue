//  Created by Phillipus on 20/09/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "CustomUnwindSegue.h"
#import "AppDelegate.h"

#define APP (AppDelegate*)[[UIApplication sharedApplication]delegate]
#define SCREEN [APP window]


@implementation CustomUnwindSegue

- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;

    [sourceViewController.view.superview insertSubview:destinationViewController.view atIndex:0];
    
    CGRect sourceFrame = sourceViewController.view.frame;
    CGFloat width = sourceFrame.size.width;
    CGFloat height = sourceFrame.size.height;
    
    //up
    if (self.verticalDirection ) { // down
        height = 0;
    }else{                         // up
        
    }
    if (self.horisontalDirection) { // left
        
    }else{                          // rigth
        
    }
    
    __block CGPoint startPoint =  CGPointMake(SCREEN.center.x + width, SCREEN.center.y);
    __block CGPoint endPoint = CGPointMake(SCREEN.center.x - width, SCREEN.center.y);
    
//    __block CGPoint startPoint =  CGPointMake(SCREEN.center.x - width, SCREEN.center.y);
//    __block CGPoint endPoint = CGPointMake(SCREEN.center.x + width, SCREEN.center.y);
    
    destinationViewController.view.center = endPoint;
    sourceViewController.view.center = SCREEN.center;
    
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         destinationViewController.view.center = SCREEN.center;
                         sourceViewController.view.center = startPoint;
                     }
                     completion:^(BOOL finished){
                         [sourceViewController dismissViewControllerAnimated:NO completion:nil];
                     }];
}

@end
