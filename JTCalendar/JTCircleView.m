//
//  JTCircleView.h
//  JTCalendar
//
//  Created by Jonathan Tribouharet
//

#import "JTCircleView.h"

// http://stackoverflow.com/questions/17038017/ios-draw-filled-circles

@implementation JTCircleView

- (instancetype)init
{
    self = [super init];
    if(!self){
        return nil;
    }
    
    self.backgroundColor = [UIColor clearColor];
    self.color = [UIColor whiteColor];
    self.circleBorderWidth = 0;
    self.circleBorderColor = [UIColor clearColor];
    
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(ctx, [self.backgroundColor CGColor]);
    CGContextFillRect(ctx, rect);

    rect = CGRectInset(rect, .5, .5);
    
    CGContextSetStrokeColorWithColor(ctx, [self.color CGColor]);
    CGContextSetFillColorWithColor(ctx, [self.color CGColor]);

    CGContextAddEllipseInRect(ctx, rect);
    CGContextFillEllipseInRect(ctx, rect);

    float radius = rect.size.width/2.;
    float startAngle = 0;
    float endAngle = M_PI*2;

    if (self.circleBorderWidth > 0) {
        CGContextSetLineWidth(ctx, self.circleBorderWidth);
        CGContextSetStrokeColorWithColor(ctx, self.circleBorderColor.CGColor);
        CGContextSetFillColorWithColor(ctx, self.color.CGColor);
        CGContextBeginPath(ctx);
        CGContextAddArc(ctx, rect.origin.x + radius, rect.origin.y + radius, radius, startAngle, endAngle, 1);
        CGContextDrawPath(ctx, kCGPathFillStroke); // Or kCGPathFill
    }

    CGContextFillPath(ctx);
}

- (void)setColor:(UIColor *)color
{
    self->_color = color;
    
    [self setNeedsDisplay];
}

- (void)setCircleBorderWidth:(float)circleBorderWidth {
    self->_circleBorderWidth = circleBorderWidth;

    [self setNeedsDisplay];
}

- (void)setCircleBorderColor:(UIColor *)circleBorderColor {
    self->_circleBorderColor = circleBorderColor;

    [self setNeedsDisplay];
}

@end
