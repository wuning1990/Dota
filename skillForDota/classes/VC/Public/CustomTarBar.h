//
//  CustomTarBar.h
//  skillForDota
//
//  Created by Ning on 13-12-23.
//  Copyright (c) 2013年 Ning. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CustomTabBarDelegate <NSObject>

@required
-(void) touchDownAtItemAtIndex:(NSInteger) itemIndex;

@end




@interface CustomTarBar : NSObject{
    NSArray *m_arrImageSelected;
    NSArray *m_arrViewControllers;
    
    
}

@property (nonatomic,strong) NSMutableArray *m_arrButtons;
@property (nonatomic,unsafe_unretained) id<CustomTabBarDelegate> delegate;

-(void) selectTabBarItem:(int) index;
-(void) setImageSelectedArray:(NSArray*)imageArray;

-(UIView*) customTabBarViewWithItems:(NSArray *) arrayViewControllers selectedInede:(NSInteger)indexSelected andDelegate:(id<CustomTabBarDelegate>) theDelegate;

-(UIButton *) buttonAtIndex:(NSInteger)index;


@end
