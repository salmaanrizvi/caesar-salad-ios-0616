//
//  FISCaesarCipherSpec.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISCaesarCipher.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#import "Swizzlean.h"

SpecBegin(FISCaesarCipher)

describe(@"FISCaesarCipher", ^{
    __block FISCaesarCipher *caesar;
    
    beforeAll(^{
        caesar = [[FISCaesarCipher alloc] init];
    });
   
    describe(@"encodeWithMessage: andOffset:", ^{
        it(@"encodes one character",^{
            expect([caesar encodeWithMessage:@"a" andOffset:3]).to.equal(@"d");
            expect([caesar encodeWithMessage:@"a" andOffset:1]).to.equal(@"b");
            expect([caesar encodeWithMessage:@"p" andOffset:3]).to.equal(@"s");
            expect([caesar encodeWithMessage:@"z" andOffset:3]).to.equal(@"c");
        });
        
        it(@"returns the same value if the number is divisible by 26",^{
            expect([caesar encodeWithMessage:@"a" andOffset:26]).to.equal(@"a");
            expect([caesar encodeWithMessage:@"a" andOffset:52]).to.equal(@"a");
        });
        
        it(@"preserves uppercase",^{
            expect([caesar encodeWithMessage:@"P" andOffset:3]).to.equal(@"S");
            expect([caesar encodeWithMessage:@"Z" andOffset:3]).to.equal(@"C");
        });
        
        it(@"does not convert spaces",^{
            expect([caesar encodeWithMessage:@"P   P" andOffset:3]).to.equal(@"S   S");
        });
        
        it(@"does not convert punctuation",^{
            expect([caesar encodeWithMessage:@"*&^." andOffset:3]).to.equal(@"*&^.");
        });
        
        it(@"converts sentences",^{
            expect([caesar encodeWithMessage:@"I'm a tiger" andOffset:5]).to.equal(@"N'r f ynljw");
        });
        
        it(@"works with crazy high offsets",^{
            expect([caesar encodeWithMessage:@"a" andOffset:27]).to.equal(@"b");
            expect([caesar encodeWithMessage:@"I'm a tiger" andOffset:9500]).to.equal(@"S'w k dsqob");
        });
    });
    
   describe(@"decodeWithMessage: andOffset:", ^{
       it(@"decodes one character",^{
           expect([caesar decodeWithMessage:@"d" andOffset:3]).to.equal(@"a");
           expect([caesar decodeWithMessage:@"b" andOffset:1]).to.equal(@"a");
           expect([caesar decodeWithMessage:@"s" andOffset:3]).to.equal(@"p");
           expect([caesar decodeWithMessage:@"c" andOffset:3]).to.equal(@"z");
       });
       
       it(@"returns the same value if the number is divisible by 26",^{
           expect([caesar decodeWithMessage:@"a" andOffset:26]).to.equal(@"a");
           expect([caesar decodeWithMessage:@"a" andOffset:52]).to.equal(@"a");
       });
       
       it(@"preserves uppercase",^{
           expect([caesar decodeWithMessage:@"S" andOffset:3]).to.equal(@"P");
           expect([caesar decodeWithMessage:@"C" andOffset:3]).to.equal(@"Z");
       });
       
       it(@"does not convert spaces",^{
           expect([caesar decodeWithMessage:@"S   S" andOffset:3]).to.equal(@"P   P");
       });
       
       it(@"does not convert punctuation",^{
           expect([caesar decodeWithMessage:@"*&^." andOffset:3]).to.equal(@"*&^.");
       });
       
       it(@"converts sentences",^{
           expect([caesar decodeWithMessage:@"N'r f ynljw" andOffset:5]).to.equal(@"I'm a tiger");
       });
       
       it(@"works with crazy high offsets",^{
           expect([caesar decodeWithMessage:@"a" andOffset:27]).to.equal(@"z");
           expect([caesar decodeWithMessage:@"S'w k dsqob" andOffset:9500]).to.equal(@"I'm a tiger");
       });
   });
    
});

SpecEnd
