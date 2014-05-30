//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher

//nsstring constant variable
static NSString * const alphabet = @"abcdefghijklmnopqrstuvwxyz";
static NSString * const ALPHABET = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";

-(NSString *)encodeWithMessage:(NSString *)message andOffset:(NSInteger)key
{
    if (key%26 == 0) return message;
    
    NSCharacterSet *lowercaseAlphabet = [NSCharacterSet characterSetWithCharactersInString:alphabet];
    NSCharacterSet *uppercaseAlphabet = [NSCharacterSet characterSetWithCharactersInString:ALPHABET];
    
    NSMutableString *encodedMessage = [[NSMutableString alloc] init];
    
    for (int x = 0; x < message.length; x++) {
        char character = [message characterAtIndex:x];
        if ([lowercaseAlphabet characterIsMember:character]) {
            character = [self encodeCharacterWithAlphabetString:alphabet andCharacter:character andKey:key];
        } else if ([uppercaseAlphabet characterIsMember:character]) {
            character = [self encodeCharacterWithAlphabetString:ALPHABET andCharacter:character andKey:key];
        }
        [encodedMessage appendFormat:@"%c", character];
    }
    return encodedMessage;
}

-(NSString *)decodeWithMessage:(NSString *)encodedMessage andOffset:(NSInteger)key
{
    if (key%26 == 0) return encodedMessage;
    
    NSCharacterSet *lowercaseAlphabet = [NSCharacterSet characterSetWithCharactersInString:alphabet];
    NSCharacterSet *uppercaseAlphabet = [NSCharacterSet characterSetWithCharactersInString:ALPHABET];
    
    NSMutableString *decodedMessage = [[NSMutableString alloc] init];
    
    for (int x = 0; x < encodedMessage.length; x++) {
        char character = [encodedMessage characterAtIndex:x];
        if ([lowercaseAlphabet characterIsMember:character]) {
            character = [self decodeCharacterWithAlphabetString:alphabet andCharacter:character andKey:key];
        } else if ([uppercaseAlphabet characterIsMember:character]) {
            character = [self decodeCharacterWithAlphabetString:ALPHABET andCharacter:character andKey:key];
        }
        NSLog(@"append %c to decode", character);
        [decodedMessage appendFormat:@"%c", character];
    }
    return decodedMessage;
}

//helper method(s)
-(char)encodeCharacterWithAlphabetString:(NSString *)alphabetString andCharacter:(char)character andKey:(NSInteger)keyInt
{
    NSRange rangeOfCharacterInAlphabet = [alphabetString rangeOfString:[NSString stringWithFormat:@"%c", character]];
    NSInteger translatedKey = rangeOfCharacterInAlphabet.location + (keyInt%26);
    if (translatedKey > 26) {
        translatedKey = translatedKey - 26;
    }
    return [alphabetString characterAtIndex:translatedKey];
}

-(char)decodeCharacterWithAlphabetString:(NSString *)alphabetString andCharacter:(char)character andKey:(NSInteger)keyInt
{
    NSRange rangeOfCharacterInAlphabet = [alphabetString rangeOfString:[NSString stringWithFormat:@"%c", character]];
    NSInteger translatedKey = rangeOfCharacterInAlphabet.location - (keyInt%26);
    if (translatedKey < 0) {
        translatedKey = translatedKey + 26;
    }
    return [alphabetString characterAtIndex:translatedKey];
}

@end
