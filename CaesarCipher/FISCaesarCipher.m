//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here

-(NSString *)encodeMessage:(NSString *)message withOffset:(NSInteger)key {
    
    NSInteger alphabetSize = 26;

    NSArray *punctuation = @[@" ", @"*", @"&", @"^", @".", @"'", @"!"]; // 32-47 & 58-64 & 91-96
    
    NSInteger minUppercaseValue = 65;
    NSInteger maxUppercaseValue = 90;
    NSInteger minLowercaseValue = 97;
    NSInteger maxLowercaseValue = 122;
    NSString *encodedMessage = @"";

    
    for (NSUInteger j = 0; j < [message length]; j++) {
        
        unichar originalValue = [message characterAtIndex:j];
        unichar encodedValue;
        
        // Check to see if letter is lowercase
        if (originalValue >= minLowercaseValue && originalValue <= maxLowercaseValue) {
            
            // If key causes wrap around
            if (originalValue + key > maxLowercaseValue) {
                
                encodedValue = originalValue + key - (key/alphabetSize) * alphabetSize;
                
                // If encodedValue is still outside range, subtract 26
                if (encodedValue >= maxLowercaseValue) {
                    encodedValue -= alphabetSize;
                }
                
                encodedMessage = [encodedMessage stringByAppendingFormat:@"%C", encodedValue];
            }
            // Else just add key to original value
            else {
                encodedValue = originalValue + key;
                encodedMessage = [encodedMessage stringByAppendingFormat:@"%C", encodedValue];
            }
        }
        
        // Check if value is uppercase
        else if (originalValue >= minUppercaseValue && originalValue <= maxUppercaseValue) {
            
            // If key causes wrap around
            if (originalValue + key > maxUppercaseValue) {
                
                encodedValue = originalValue + key - (key/alphabetSize) * alphabetSize;
                
                // If encodedValue is still outside range, subtract 26
                if (encodedValue >= maxUppercaseValue) {
                    encodedValue -= alphabetSize;
                }

                encodedMessage = [encodedMessage stringByAppendingFormat:@"%C", encodedValue];
            }
            
            // Else just add key to original value
            else {
                encodedValue = originalValue + key;
                encodedMessage = [encodedMessage stringByAppendingFormat:@"%C", encodedValue];
            }
        
        }
        
        // check if value is some form of puctuation
        else if ((originalValue >= 32 && originalValue <= 47) || (originalValue >= 58 && originalValue <= 64) || (originalValue >= 91 && originalValue <= 96)) {
            encodedMessage = [encodedMessage stringByAppendingFormat:@"%C", originalValue];
        }
    }
    
    return encodedMessage;
}

-(NSString *)decodeMessage:(NSString *)encodedMessage withOffset:(NSInteger)key {
    
    NSInteger alphabetSize = 26;
    
    NSArray *punctuation = @[@" ", @"*", @"&", @"^", @".", @"'", @"!"]; // 32-47 & 58-64 & 91-96
    
    NSInteger minUppercaseValue = 65;
    NSInteger maxUppercaseValue = 90;
    NSInteger minLowercaseValue = 97;
    NSInteger maxLowercaseValue = 122;
    NSString *decodedMessage = @"";
    
    for (NSUInteger j = 0; j < [encodedMessage length]; j++) {
        
        unichar originalValue = [encodedMessage characterAtIndex:j];
        unichar decodedValue;
        
        // Check to see if letter is lowercase
        if (originalValue >= minLowercaseValue && originalValue <= maxLowercaseValue) {
            
            // If key causes wrap around
            if (originalValue - key < minLowercaseValue) {
                
                decodedValue = originalValue - key + (key/alphabetSize) * alphabetSize;
                
                // If encodedValue is still outside range, add 26
                if (decodedValue < minLowercaseValue) {
                    decodedValue += alphabetSize;
                }
                
                decodedMessage = [decodedMessage stringByAppendingFormat:@"%C", decodedValue];
            }
            // Else just add key to original value
            else {
                decodedValue = originalValue - key;
                decodedMessage = [decodedMessage stringByAppendingFormat:@"%C", decodedValue];
            }
        }
        
        // Check if value is uppercase
        else if (originalValue >= minUppercaseValue && originalValue <= maxUppercaseValue) {
            
            // If key causes wrap around
            if (originalValue - key < minUppercaseValue) {
                
                decodedValue = originalValue - key + (key/alphabetSize) * alphabetSize;
                
                // If encodedValue is still outside range, subtract 26
                if (decodedValue < minUppercaseValue) {
                    decodedValue += alphabetSize;
                }
                
                decodedMessage = [decodedMessage stringByAppendingFormat:@"%C", decodedValue];
            }
            
            // Else just add key to original value
            else {
                decodedValue = originalValue - key;
                decodedMessage = [decodedMessage stringByAppendingFormat:@"%C", decodedValue];
            }
            
        }
        
        // check if value is some form of puctuation
        else if ((originalValue >= 32 && originalValue <= 47) || (originalValue >= 58 && originalValue <= 64) || (originalValue >= 91 && originalValue <= 96)) {
            decodedMessage = [decodedMessage stringByAppendingFormat:@"%C", originalValue];
        }

    }
    
    return decodedMessage;
}

@end
