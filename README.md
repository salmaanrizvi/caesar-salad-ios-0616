

# Caesar Cipher
In computer-land, all characters actually have a corresponding number associated with them, known as their ASCII number. For a chart of the ASCII -> character transition take a look [here](http://www.asciitable.com/). In cryptography, a Caesar cipher, also known as the shift cipher, is one of the simplest and most widely known encryption techniques. [Wikipedia](http://en.wikipedia.org/wiki/Caesar_cipher)

## Exercise

You'll be writing a Caesar encoder and decoder. Each method takes a string and an offset. For example, given the string "a" with an offset of 3, the encoder would produce "d", which is 3 letters after "a". A capital letter is always converted to a capital letter -- i.e "Z" with an offset of 2 is "B". Spaces and punctuation are ignored. The decoder works in reverse; it shifts in the opposite direction.

Define and implement 2 methods in `FISCaesarCipher`:

```objc
-(NSString *)encodeMessage:(NSString *)message withOffset:(NSInteger)key
```
```objc
-(NSString *)decodeMessage:(NSString *)encodedMessage withOffset:(NSInteger)key
```

Your job is to write implement the methods!

## Hint

To translate from an ASCII integer to a string and back, you can use something like the below:

```objc
// NSString to ASCII
NSString *string = @"A";
unichar asciiCode = [string characterAtIndex:0]; // 65

// ASCII to NSString
unichar asciiCode = 65;
NSString *string = [NSString stringWithFormat:@"%C", asciiCode]; // A
```

`unichar` is another primitive type, specifically used for representing the characters of a string.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/caesar-salad' title='Caeser Cipher'>Caeser Cipher</a> on Learn.co and start learning to code for free.</p>
