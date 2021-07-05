//
//  PasswordTextField.m
//  rs.ios.stage-task7
//
//  Created by Нехай Роман on 7/4/21.
//

#import "PasswordTextField.h"

@implementation PasswordTextField
-(void) awakeFromNib {
    [super awakeFromNib];
    self.text = @"";
    self.placeholder = [NSString stringWithFormat: @"Password"];
    self.layer.borderWidth = 1.5;
    self.layer.borderColor = [UIColor colorNamed:@"blackCoral"].CGColor;
    self.layer.cornerRadius = 5.0;
    self.leftView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 30)];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.secureTextEntry = YES;
    self.keyboardType = UIKeyboardTypeDefault;
    self.returnKeyType = UIReturnKeyDone;
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

@end
