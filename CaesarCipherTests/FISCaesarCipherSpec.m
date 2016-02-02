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
#import <Expecta/Expecta.h>

SpecBegin(FISCaesarCipher)

describe(@"FISCaesarCipher", ^{
    __block FISCaesarCipher *caesar;
    
    beforeAll(^{
        caesar = [[FISCaesarCipher alloc] init];
    });
   
    describe(@"encodeMessage: withOffset:", ^{
        it(@"encodes one character",^{
            expect([caesar encodeMessage:@"a" withOffset:3]).to.equal(@"d");
            expect([caesar encodeMessage:@"a" withOffset:1]).to.equal(@"b");
            expect([caesar encodeMessage:@"p" withOffset:3]).to.equal(@"s");
            expect([caesar encodeMessage:@"z" withOffset:3]).to.equal(@"c");
        });
        
        it(@"returns the same value if the number is divisible by 26",^{
            expect([caesar encodeMessage:@"a" withOffset:26]).to.equal(@"a");
            expect([caesar encodeMessage:@"a" withOffset:52]).to.equal(@"a");
        });
        
        it(@"preserves uppercase",^{
            expect([caesar encodeMessage:@"P" withOffset:3]).to.equal(@"S");
            expect([caesar encodeMessage:@"Z" withOffset:3]).to.equal(@"C");
        });
        
        it(@"does not convert spaces",^{
            expect([caesar encodeMessage:@"P   P" withOffset:3]).to.equal(@"S   S");
        });
        
        it(@"does not convert punctuation",^{
            expect([caesar encodeMessage:@"*&^." withOffset:3]).to.equal(@"*&^.");
        });
        
        it(@"converts sentences",^{
            expect([caesar encodeMessage:@"I'm a tiger" withOffset:5]).to.equal(@"N'r f ynljw");
        });
        
        it(@"works with crazy high offsets",^{
            expect([caesar encodeMessage:@"a" withOffset:27]).to.equal(@"b");
            expect([caesar encodeMessage:@"I'm a tiger" withOffset:9500]).to.equal(@"S'w k dsqob");
        });
    });
    
   describe(@"decodeMessage: withOffset:", ^{
       it(@"decodes one character",^{
           expect([caesar decodeMessage:@"d" withOffset:3]).to.equal(@"a");
           expect([caesar decodeMessage:@"b" withOffset:1]).to.equal(@"a");
           expect([caesar decodeMessage:@"s" withOffset:3]).to.equal(@"p");
           expect([caesar decodeMessage:@"c" withOffset:3]).to.equal(@"z");
       });
       
       it(@"returns the same value if the number is divisible by 26",^{
           expect([caesar decodeMessage:@"a" withOffset:26]).to.equal(@"a");
           expect([caesar decodeMessage:@"a" withOffset:52]).to.equal(@"a");
       });
       
       it(@"preserves uppercase",^{
           expect([caesar decodeMessage:@"S" withOffset:3]).to.equal(@"P");
           expect([caesar decodeMessage:@"C" withOffset:3]).to.equal(@"Z");
       });
       
       it(@"does not convert spaces",^{
           expect([caesar decodeMessage:@"S   S" withOffset:3]).to.equal(@"P   P");
       });
       
       it(@"does not convert punctuation",^{
           expect([caesar decodeMessage:@"*&^." withOffset:3]).to.equal(@"*&^.");
       });
       
       it(@"converts sentences",^{
           expect([caesar decodeMessage:@"N'r f ynljw" withOffset:5]).to.equal(@"I'm a tiger");
       });
       
       it(@"works with crazy high offsets",^{
           expect([caesar decodeMessage:@"a" withOffset:27]).to.equal(@"z");
           expect([caesar decodeMessage:@"S'w k dsqob" withOffset:9500]).to.equal(@"I'm a tiger");
       });
   });
    
});

SpecEnd
