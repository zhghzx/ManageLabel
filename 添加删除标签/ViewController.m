//
//  ViewController.m
//  添加删除标签
//
//  Created by zhangxing on 2017/5/18.
//  Copyright © 2017年 zhangxing. All rights reserved.
//

#import "ViewController.h"
#import "ZXManageLabelView.h"
#import "UIView+ZXExt.h"

@interface ViewController ()

@property (nonatomic, strong) ZXManageLabelView *manageLabelView;
@property (weak, nonatomic) IBOutlet UITextField *tf;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tf becomeFirstResponder];
    [self.view addSubview:self.manageLabelView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender {
    [self.manageLabelView addLabelWithTitle:self.tf.text];
    self.tf.text = @"";
}

- (ZXManageLabelView *)manageLabelView {
    if (_manageLabelView == nil) {
        _manageLabelView = [[ZXManageLabelView alloc] initWithFrame:CGRectMake(15, 50, self.view.w-30, 32)];
    }
    return _manageLabelView;
}

@end
