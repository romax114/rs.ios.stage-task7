//
//  AuthorizeButton.m
//  rs.ios.stage-task7
//
//  Created by Нехай Роман on 7/4/21.
//

#import "AuthorizeButton.h"

@implementation AuthorizeButton

-(void) awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 10.0;
    self.layer.borderWidth = 2.0;
    [self setTitleColor: [UIColor colorNamed:@"littleBoyBlue"] forState: UIControlStateNormal];
    [self setTitleColor: [[UIColor colorNamed:@"littleBoyBlue"] colorWithAlphaComponent:0.4] forState:UIControlStateHighlighted];
    [self setTitleColor: [[UIColor colorNamed:@"littleBoyBlue"] colorWithAlphaComponent:0.5] forState: UIControlStateDisabled];
    self.layer.borderColor = [UIColor colorNamed:@"littleBoyBlue"].CGColor;
    self.clipsToBounds = YES;
    
    UIImage *buttonImageNormal = [UIImage imageNamed:@"person2x.png"];
    [self setImage:buttonImageNormal forState:UIControlStateNormal];
    
    UIImage *buttonImageHighLighted = [UIImage imageNamed:@"person-fill2x.png"];
    [self setImage:buttonImageHighLighted forState:UIControlStateHighlighted];
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    self.contentEdgeInsets = UIEdgeInsetsMake(10.0, 20.0, 10.0, 20.0);
    self.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
    [self setTitle: @"Authorize" forState:UIControlStateNormal];
}

@end
