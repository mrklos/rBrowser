//  HTMLTextNode.m
//
//  Public domain. https://github.com/nolanw/HTMLReader

#import "HTMLTextNode.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HTMLTextNode
{
    NSMutableString *_data;
}

- (instancetype)initWithData:(NSString *)data
{
    NSParameterAssert(data);
    
    if ((self = [super init])) {
        _data = [NSMutableString stringWithString:data];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithData:@""];
}

- (void)appendString:(NSString *)string
{
    NSParameterAssert(string);
    
    [_data appendString:string];
}

- (NSString *)data
{
    return [_data copy];
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone * __nullable)zone
{
    HTMLTextNode *copy = [super copyWithZone:zone];
    [copy->_data setString:_data];
    return copy;
}

- (void)replaceString:(NSString *)string
{
    NSParameterAssert(string);
    NSMutableString *tmp = [NSMutableString stringWithCapacity:[string length]];
    [tmp setString:string];
    _data = tmp;
}

- (void)revString2
{
    NSString *myString = _data;
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[myString length]];
    [myString enumerateSubstringsInRange:NSMakeRange(0,[myString length])
                                 options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                              usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                  [reversedString appendString:substring];
                              }];
    NSString *strtest = @"test";
    _data = [NSMutableString stringWithCapacity:[strtest length]];
}

@end

NS_ASSUME_NONNULL_END
