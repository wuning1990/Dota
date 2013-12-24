//
//  CustomTarBar.m
//  skillForDota
//
//  Created by Ning on 13-12-23.
//  Copyright (c) 2013年 Ning. All rights reserved.
//

#import "CustomTarBar.h"


@implementation CustomTarBar

@synthesize delegate = _delegate;
@synthesize m_arrButtons;

-(id)init
{
    self = [super init];
    if (self) {
        m_arrButtons = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}
-(void)dealloc
{
    self.delegate = nil;
}
-(UIView*) customTabBarViewWithItems:(NSArray *) arrayViewControllers selectedInede:(NSInteger)indexSelected andDelegate:(id<CustomTabBarDelegate>) theDelegate
{
    UIView *viewTabBar = [[UIView alloc]initWithFrame:CGRectMake(0, -2, 320,51)];
    self.delegate = theDelegate;
    int iItemCount = [arrayViewControllers count];
    NSInteger width = viewTabBar.frame.size.width/iItemCount;
    
    CGFloat horizontalOffset = 0;
    
    m_arrViewControllers = arrayViewControllers;
    for (NSInteger i = 0; i < iItemCount; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0, 0.0, width, viewTabBar.frame.size.height);
        
        UIViewController *viewController = (UIViewController *)[arrayViewControllers objectAtIndex:i];
        UIImage *imgButton = viewController.tabBarItem.image;
        UIImage *imgSelected = [m_arrImageSelected objectAtIndex:i];
        [button setImage: imgButton forState: UIControlStateNormal];
        [button setImage: imgSelected forState: UIControlStateHighlighted];
        [button setImage: imgSelected forState: UIControlStateSelected];
        [button setImage: imgSelected forState: UIControlStateHighlighted | UIControlStateSelected];
        
        button.accessibilityLabel = viewController.tabBarItem.title;
        button.frame = CGRectMake(horizontalOffset, 0.0, button.frame.size.width, button.frame.size.height);
        button.tag = i + 1;
        [button addTarget:self action:@selector(buttonDown:) forControlEvents:UIControlEventTouchDown];
        
        if (i == indexSelected) {
            button.selected = YES;
        }
        
        [viewTabBar addSubview:button];
        [m_arrButtons addObject:button];
        
        horizontalOffset = horizontalOffset + width;
    }
    return viewTabBar;
}
-(void)setImageSelectedArray:(NSArray *)imageArray
{
    m_arrImageSelected = imageArray;
}
- (void) selectTabBarItem: (int) index
{
    if ( m_arrButtons.count ) {
        for (UIButton *buttonItem in m_arrButtons) {
            buttonItem.selected = NO;
        }
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        
        UIButton *buttonBarItem = (UIButton *)[m_arrButtons objectAtIndex: index];
        buttonBarItem.selected = YES;
        [UIView commitAnimations];
    }
}
- (UIButton*)buttonAtIndex:(NSInteger)index
{
	if (index<m_arrButtons.count) {
		return (UIButton*)[m_arrButtons objectAtIndex:index];
	}
	return nil;
}
-(void)buttonDown:(id) sender
{
    UIButton *button = (UIButton *)sender;
    int index = button.tag - 1;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(touchDownAtItemAtIndex:)])
    {
        [self.delegate touchDownAtItemAtIndex:index];
    }
}
@end
