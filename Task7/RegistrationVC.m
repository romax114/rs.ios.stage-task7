//
//  RegistrationVC.m
//  rs.ios.stage-task7
//
//  Created by Нехай Роман on 7/4/21.
//

#import "RegistrationVC.h"
#import "RSSchoolLabel.h"
#import "LoginTextField.h"
#import "PasswordTextField.h"
#import "AuthorizeButton.h"

@interface RegistrationVC ()
@property (weak, nonatomic) IBOutlet RSSchoolLabel *logotip;
@property (weak, nonatomic) IBOutlet LoginTextField *usernameTextField;
@property (weak, nonatomic) IBOutlet PasswordTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet AuthorizeButton *authorize;
@property (weak, nonatomic) IBOutlet UIView *secureVC;
@property (weak, nonatomic) IBOutlet UILabel *result;

@property (weak, nonatomic) NSLayoutConstraint *topContraint;
@property (weak, nonatomic) NSLayoutConstraint *bottomContraint;
@end

@interface RegistrationVC (KeyboardHandling)
- (void)subscribeOnKeyboardEvents;
- (void)updateTopContraintWith:(CGFloat) constant andBottom:(CGFloat) bottomConstant;
- (void)hideWhenTappedAround;
@end


@implementation RegistrationVC

-(void) viewDidLoad {
    [super viewDidLoad];
    [self defaultState];
}

-(void) defaultState {
    [self setUpTextFields];
    [self setUpSecureVC];
    [self subscribeOnKeyboardEvents];
    [self hideWhenTappedAround];
}

-(void) setUpTextFields {
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    [self.usernameTextField.layer setBorderColor:[UIColor colorNamed:@"blackCoral"].CGColor];
    [self.usernameTextField setTextColor:[UIColor blackColor]];
    [self.usernameTextField setEnabled:YES];
    [self.usernameTextField setAlpha:1];
    
    [self.passwordTextField.layer setBorderColor:[UIColor colorNamed:@"blackCoral"].CGColor];
    [self.passwordTextField setTextColor:[UIColor blackColor]];
    [self.passwordTextField setEnabled:YES];
    [self.passwordTextField setAlpha:1];
    
    [self.passwordTextField setSecureTextEntry:YES];
    [self.passwordTextField setEnabled:YES];
}

-(void) setUpSecureVC {
    [self.secureVC.layer setCornerRadius:10];
    [self.secureVC.layer setBorderWidth:2];
    [self.secureVC.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.secureVC setBackgroundColor:[UIColor whiteColor]];
    [self.secureVC setHidden:YES];
    
    self.result.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];
    self.titleButtons = [[NSMutableArray alloc] init];
}

- (IBAction)highLightedButton:(UIButton *)sender {
    self.authorize.backgroundColor = [[UIColor colorNamed:@"littleBoyBlue"] colorWithAlphaComponent:0.2];
}

- (IBAction) autorizeButtonTapped:(UIButton *)sender {
    self.authorize.backgroundColor = [UIColor whiteColor];
    
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    BOOL loginCorrect = [username isEqualToString: @"username"];
    BOOL passwordCorrect = [password isEqualToString:@"password"];
    
    if (loginCorrect && passwordCorrect) {
        self.usernameTextField.enabled = NO;
        self.passwordTextField.enabled = NO;
        self.authorize.enabled = NO;
        self.usernameTextField.layer.borderColor = [UIColor colorNamed: @"turquoiseGreen"].CGColor;
        self.passwordTextField.layer.borderColor = [UIColor colorNamed: @"turquoiseGreen"].CGColor;
        self.usernameTextField.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.passwordTextField.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.authorize.layer.borderColor = [UIColor colorNamed:@"littleBoyBlue05"].CGColor;
        [self.secureVC setHidden: NO];
        
    } else {
        if (!loginCorrect) {
            self.usernameTextField.layer.borderColor = [UIColor colorNamed: @"venetianRed"].CGColor;
        }
        if (!passwordCorrect) {
            self.passwordTextField.layer.borderColor = [UIColor colorNamed: @"venetianRed"].CGColor;
        }
    }
    
}

- (IBAction) secureButtonTapped:(UIButton *)sender {
    NSString *str = sender.titleLabel.text;
    [self.titleButtons addObject: str];
    
    if (self.titleButtons.count == 1) {
        [self.result setText:@" "];
    }
    [self.result setText:[self.result.text stringByAppendingFormat: @"%@ ", str]];
    
    if (self.titleButtons.count == 3) {
        if ([self.titleButtons isEqualToArray:@[@"1", @"3", @"2"]]) {
            [self.secureVC.layer setBorderColor:[UIColor colorNamed:@"turquoiseGreen"].CGColor];
            [self showAlertController];
        } else {
            [self.result setText:@"-"];
            [self.secureVC.layer setBorderColor:[UIColor colorNamed:@"venetianRed"].CGColor];
            [self.titleButtons removeAllObjects];
        }
    }
 
}

-(void) showAlertController {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle: @"Welcome"
                                                                     message:@"You are successfuly authorized!" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *refreshAction = [UIAlertAction actionWithTitle: @"Refresh" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [self.passwordTextField setText:@""];
        [self.usernameTextField setText:@""];
        [self.authorize setEnabled:YES];
        [self.authorize setAlpha:1];
        [self.titleButtons removeAllObjects];
        
        [self.usernameTextField awakeFromNib];
        [self.passwordTextField awakeFromNib];
        [self.authorize awakeFromNib];
        [self defaultState];
    }];
    [alertVC addAction: refreshAction];
    [self presentViewController: alertVC animated:YES completion:nil];
}

// MARK: - UITextField Delegate

- (BOOL) textFieldShouldBeginEditing:(UITextField *) textField {
    
    if (self.passwordTextField.isFirstResponder) {
        self.usernameTextField.layer.borderWidth = 1.5;
        self.usernameTextField.layer.borderColor = [UIColor colorNamed:@"blackCoral"].CGColor;
    }
    
    if (self.usernameTextField.isFirstResponder) {
        self.passwordTextField.layer.borderWidth = 1.5;
        self.passwordTextField.layer.borderColor = [UIColor colorNamed:@"blackCoral"].CGColor;
    }
    return YES;
}

@end

// MARK: - Keyboard management implementation
@implementation RegistrationVC (KeyboardHandling)

- (void) subscribeOnKeyboardEvents {
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}


// MARK: - Hide keyboard when tapped outside
-(void) hideWhenTappedAround {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(hide)];
    [self.view addGestureRecognizer:gesture];
}

-(void) hide {
    [self.view endEditing:true];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hide];
    return YES;
}


-(void) keybaordWillShow:(NSNotification *)notification {
    CGRect rect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [self updateTopContraintWith:15.0 andBottom:rect.size.height - self.view.safeAreaInsets.bottom + 15.0];
}

-(void) keybaordWillHide:(NSNotification *)notification {
    [self updateTopContraintWith:200.0 andBottom:0.0];
}

-(void) updateTopContraintWith:(CGFloat) constant andBottom:(CGFloat) bottomConstant {
    self.topContraint.constant = constant;
    self.bottomContraint.constant = bottomConstant;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
