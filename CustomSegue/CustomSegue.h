//  Created by Phillipus on 19/09/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSegue : UIStoryboardSegue

// Originating point for animation
@property CGPoint originatingPoint;

@property BOOL horisontalDirection;// 0-right 1-left
@property BOOL verticalDirection;// 0-up 1-down

@end
