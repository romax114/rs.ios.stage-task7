//
//  RegistrationVC.h
//  rs.ios.stage-task7
//
//  Created by Нехай Роман on 7/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegistrationVC : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSMutableArray<NSString *> *titleButtons;

@end

NS_ASSUME_NONNULL_END
