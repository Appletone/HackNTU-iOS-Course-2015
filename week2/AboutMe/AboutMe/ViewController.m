//
//  ViewController.m
//  AboutMe
//
//  Created by 張 景隆 on 2015/6/13.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.avatorImageView.layer.masksToBounds = YES;
    self.avatorImageView.layer.cornerRadius = self.avatorImageView.frame.size.height/2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
