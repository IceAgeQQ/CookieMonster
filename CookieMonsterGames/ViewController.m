//
//  ViewController.m
//  CookieMonsterGames
//
//  Created by Chao Xu on 13-7-30.
//  Copyright (c) 2013年 Chao Xu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize score;
@synthesize timer1;
@synthesize cookieArray;
@synthesize image;
@synthesize gameLoop;
@synthesize counter;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    counter = 0;
	// Do any additional setup after loading the view, typically from a nib.
    
    cookieArray = [[NSMutableArray alloc]init];
    NSString *string_counter =[NSString stringWithFormat:@"x %d",counter];
    score.text = string_counter;
    image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"monster.jpg"]];
    image.frame = CGRectMake(0, 400, 100, 100);
    [self.view addSubview:image];
    
    //initiate timer1
    timer1 = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(dropCookies) userInfo:nil repeats:YES];
    gameLoop = [NSTimer scheduledTimerWithTimeInterval:1/30 target:self selector:@selector(checkCollision) userInfo:nil repeats:YES];
    
    [gameLoop fire];
    [timer1 fire];
}
-(void)checkCollision{
    
    NSMutableArray *discardItem = [[NSMutableArray alloc]init];
    for(UIImageView *cookie in cookieArray){
        CGRect movingFrame = [[cookie.layer presentationLayer]frame];
        
        if (CGRectIntersectsRect(image.frame, movingFrame)) {
            counter ++;
            NSString *string_counter = [NSString stringWithFormat:@"x  %d",counter];
            score.text = string_counter;
            [cookie removeFromSuperview];
            [discardItem addObject:cookie];
            [cookieArray removeObjectsInArray:discardItem];
        }
    }
    
}
-(void)dropCookies{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UIImageView *cookieImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cookie.jpg"]];
    
    int result = (int)round(screenWidth);
    int randomNumber = 0 + rand()% (result - 0);
    
    
    [cookieArray addObject:cookieImage];
    cookieImage.frame = CGRectMake(50, 10, 50, 50);
    cookieImage.center = CGPointMake(randomNumber, 50);//drop straitdown
    [self.view addSubview:cookieImage];
    
    [UIView beginAnimations:@"cookieMove" context:nil];
    [UIView setAnimationDuration:1];
    
    cookieImage.center = CGPointMake(randomNumber, 550);
    [UIView commitAnimations];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //make the monster move
    UITouch *myTouch = [touches anyObject];
    [UIView beginAnimations:@"monsterMove" context:nil];
    [UIView setAnimationDuration:1];
    image.center = [myTouch locationInView:self.view];
    [UIView commitAnimations];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //drag the monster
    UITouch *myTouch = [touches anyObject];
    CGPoint startPoint = [myTouch locationInView:self.view];
    image.center = CGPointMake(startPoint.x, startPoint.y);
}
@end
