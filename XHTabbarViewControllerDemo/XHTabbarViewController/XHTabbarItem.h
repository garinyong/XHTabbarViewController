//
//  XHTabbarItem.h
//  XHTabbarViewControllerDemo
//
//  Created by GaoYong on 15/11/24.
//  Copyright © 2015年 GaoYong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XHTabbarItem : NSObject

@property (nonatomic,copy) NSString *selectedImageUrl;
@property (nonatomic,copy) NSString *normalImageUrl;

-(instancetype) initWithSelectedImageUrl:(NSString *) selectedImageUrl normalImageUrl:(NSString *) normalImageUrl;

@end
