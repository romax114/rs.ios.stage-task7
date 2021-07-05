//
//  RSSchoolLabel.m
//  rs.ios.stage-task7
//
//  Created by Нехай Роман on 7/4/21.
//

#import "RSSchoolLabel.h"

@implementation RSSchoolLabel

-(void) awakeFromNib {
    [super awakeFromNib];
    
    self.font = [UIFont fontWithName: @"SF Pro Text" size: 36];
    self.textColor = [UIColor colorNamed:@"black"];
    self.font = [UIFont boldSystemFontOfSize:36];
    self.text = @"RSSchool";
    self.textAlignment = NSTextAlignmentRight;
    self.numberOfLines = 1;
}

@end
