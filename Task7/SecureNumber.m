//
//  SecureNumber.m
//  rs.ios.stage-task7
//
//  Created by Нехай Роман on 7/4/21.
//

#import "SecureNumber.h"

@implementation SecureNumber

-(void) awakeFromNib {
    [super awakeFromNib];
    
    [self.layer setCornerRadius: 25];
    [self.layer setBorderWidth: 1.5];
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:24]];
    [self.layer setBorderColor: [UIColor colorNamed:@"littleBoyBlue"].CGColor];
    [self setTitleColor: [UIColor colorNamed:@"littleBoyBlue"] forState: UIControlStateNormal];
    [self setTitleColor: [UIColor colorNamed:@"littleBoyBlue"] forState: UIControlStateHighlighted];
}

@end
