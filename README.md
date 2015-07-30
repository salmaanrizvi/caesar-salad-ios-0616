

# Caeser Cipher
All Characters actually have a number corresponding with them. This is known as their ASCII number. For a chart of the ASCII -> character transition take a look [here](http://www.asciitable.com/). In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift cipher, Caesar's code or Caesar shift, is one of the simplest and most widely known encryption techniques. [Wikipedia](http://en.wikipedia.org/wiki/Caesar_cipher)

## Exercise

You'll be writing a caeser encoder and decoder. Each method takes a string and the offset. The encoder converts the letter a with an offset of 3 to the letter d. A capital letter is always converted to a capital letter i.e Z with an offset of 2 is B. Spaces and punctuation are ignored. The decoder works in reverse.

Define and implement 2 methods in `FISCaesarCipher`:

```objc
-(NSString *)encodeWithMessage:(NSString *)message andOffset:(NSInteger)key
```
```objc
-(NSString *)decodeWithMessage:(NSString *)encodedMessage
andOffset:(NSInteger)key
```

Now code how to encode and decode :)

## Hint

To translate from integer version to String version of a character and reverse it's pretty straight forward:

```objc
// NSString to ASCII
NSString *string = @"A";
NSInteger asciiCode = [string characterAtIndex:0]; // 65

// ASCII to NSString
NSInteger asciiCode = 65;
NSString *string = [NSString stringWithFormat:@"%c", asciiCode]; // A
```
