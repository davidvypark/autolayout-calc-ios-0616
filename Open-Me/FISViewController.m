//
//  FISViewController.m
//  Open-Me
//
//  Created by Joe Burgess on 3/4/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

@property (strong, nonatomic)NSMutableString *firstStoredNumber;
@property (strong, nonatomic)NSMutableString *secondStoredNumber;
@property (strong, nonatomic)NSMutableString *currentNumber;
@property (nonatomic)BOOL isFirstNumber;
@property (strong, nonatomic)NSString *operation;

@end


@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.firstStoredNumber = [@"" mutableCopy];
    self.secondStoredNumber = [@"" mutableCopy];
    self.isFirstNumber = TRUE;
}

- (IBAction)key1Pressed:(id)sender {
    [self processNumberPressedwithNumber:1];
}
- (IBAction)key2Pressed:(id)sender {
    [self processNumberPressedwithNumber:2];
}
- (IBAction)key3Pressed:(id)sender {
    [self processNumberPressedwithNumber:3];
}
- (IBAction)key4Pressed:(id)sender {
    [self processNumberPressedwithNumber:4];
}
- (IBAction)key5Pressed:(id)sender {
    [self processNumberPressedwithNumber:5];
}
- (IBAction)key6Pressed:(id)sender {
    [self processNumberPressedwithNumber:6];
}
- (IBAction)key7Pressed:(id)sender {
    [self processNumberPressedwithNumber:7];
}
- (IBAction)key8Pressed:(id)sender {
    [self processNumberPressedwithNumber:8];
}
- (IBAction)key9Pressed:(id)sender {
    [self processNumberPressedwithNumber:9];
}
- (IBAction)key0Pressed:(id)sender {
    [self processNumberPressedwithNumber:0];
}


- (IBAction)keyDotPressed:(id)sender {
    if(self.isFirstNumber) {
        if (self.firstStoredNumber.length == 0 || [self.firstStoredNumber containsString:@"."]) {
            return;
        } else {
            [self.firstStoredNumber appendString:@"."];
            self.displayField.text = self.firstStoredNumber;
        }
    } else {
        if(self.secondStoredNumber.length == 0 || [self.firstStoredNumber containsString:@"."]) {
            return;
        } else {
            [self.secondStoredNumber appendString:@"."];
            self.displayField.text = self.secondStoredNumber;
        }
    }
}


- (IBAction)keyDividePressed:(id)sender {
    self.isFirstNumber = false;
    self.operation = @"div";
}
- (IBAction)keyMultiplyPressed:(id)sender {
    self.isFirstNumber = false;
    self.operation = @"mul";
}
- (IBAction)keySubtractPressed:(id)sender {
    self.isFirstNumber = false;
    self.operation = @"sub";
}
- (IBAction)keyAdditionPressed:(id)sender {
    self.isFirstNumber = false;
    self.operation = @"add";
}


- (IBAction)keyEqualsPressed:(id)sender {
    
    CGFloat firstNumber = [self.firstStoredNumber floatValue];
    CGFloat secondNumber = [self.secondStoredNumber floatValue];
    CGFloat result = 0;
    
    if (self.firstStoredNumber.length == 0 || self.secondStoredNumber.length == 0) {
        return;
    } else {
        if ([self.operation isEqualToString:@"add"]) {
            result = firstNumber + secondNumber;
            
        } else if ([self.operation isEqualToString:@"sub"]) {
            result = firstNumber - secondNumber;
            
        } else if ([self.operation isEqualToString:@"mul"]) {
            result = firstNumber * secondNumber;
            
        } else if ([self.operation isEqualToString:@"div"]) {
            result = firstNumber / secondNumber;
        }
    }
    self.displayField.text = [NSString stringWithFormat:@"%f", result];
    self.isFirstNumber = true;
    self.firstStoredNumber = [@"" mutableCopy];
    self.secondStoredNumber = [@"" mutableCopy];
    
}

-(void)processNumberPressedwithNumber:(NSUInteger)number {
    if (self.isFirstNumber) {
        [self.firstStoredNumber appendFormat:@"%lu",number];
        self.displayField.text = self.firstStoredNumber;
    } else {
        [self.secondStoredNumber appendFormat:@"%lu",number];
        self.displayField.text = self.secondStoredNumber;
    }
}


@end
