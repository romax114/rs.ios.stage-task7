//
//  LoginTextField.m
//  rs.ios.stage-task7
//
//  Created by Нехай Роман on 7/4/21.
//

#import "LoginTextField.h"

@implementation LoginTextField

-(void) awakeFromNib {
    [super awakeFromNib];
    self.text = @"";
    self.placeholder = [NSString stringWithFormat:@"Login"];
    self.layer.borderWidth = 1.5;
    self.layer.borderColor = [UIColor colorNamed:@"blackCoral"].CGColor;
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 5.0;
    self.leftView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 30)];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    self.returnKeyType = UIReturnKeyDone;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

@end
