//
//  FeedBackViewController.h
//  事儿妈
//
//  Created by B505 on 14/7/8.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedBackViewController : UIViewController<UITextViewDelegate>
{
    UITextView *FdtextView;
}
-(void)btnClick:(UIButton *)sender;
@end
