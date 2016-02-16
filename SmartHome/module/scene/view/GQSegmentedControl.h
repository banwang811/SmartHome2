//
//  GQSegmentedControl.h
//  Investment
//
//  Created by mac on 15/7/31.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    GQSegmentedSelect_right,
    GQSegmentedSelect_left,
}GQSegmentedSelect_Type;

@protocol GQSegmentedControlDelegate <NSObject>

- (void)didSelect:(GQSegmentedSelect_Type)type;

@end

@interface GQSegmentedControl : UIView

@property (nonatomic, assign) id <GQSegmentedControlDelegate>   delegate;

- (void)setleftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle;

@end
