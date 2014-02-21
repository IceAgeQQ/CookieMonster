//
//  ViewController.h
//  CookieMonsterGames
//
//  Created by Chao Xu on 13-7-30.
//  Copyright (c) 2013年 Chao Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface ViewController : UIViewController{
    UIImageView *image;
    NSMutableArray *cookieArray;
    NSTimer *timer1;
    int counter;
    NSTimer *gameLoop;

    __weak IBOutlet UILabel *score;
    
}
@property(nonatomic,retain)UIImageView *image;
@property(nonatomic,retain)NSMutableArray *cookieArray;
@property(nonatomic,retain)NSTimer *timer1;
@property int counter;
@property (nonatomic,retain)NSTimer *gameLoop;
@property (weak,nonatomic)UILabel *score;
-(void)dropCookies;
-(void)checkCollision;
@end
