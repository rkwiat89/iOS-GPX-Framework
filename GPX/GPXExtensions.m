//
//  GPXExtensions.m
//  GPX Framework
//
//  Created by NextBusinessSystem on 12/04/06.
//  Copyright (c) 2012 NextBusinessSystem Co., Ltd. All rights reserved.
//

#import "GPXExtensions.h"
#import "GPXElementSubclass.h"

@interface GPXExtensions ()

@property (nonatomic, assign) NSString *pitchString;
@property (nonatomic, assign) NSString *rollString;

@end

@implementation GPXExtensions

#pragma mark - Instance

- (id)initWithXMLElement:(GPXXMLElement *)element parent:(GPXElement *)parent
{
    self = [super initWithXMLElement:element parent:parent];
    if (self) {
        _pitchString = [self textForSingleChildElementNamed:@"gpxdata:pitch" xmlElement:element];
        _rollString = [self textForSingleChildElementNamed:@"gpxdata:roll" xmlElement:element];
    }
    return self;
}


#pragma mark - Getters & Setters

- (NSNumber *)pitch
{
    return [NSNumber numberWithFloat:[GPXType decimal:_pitchString]];
}

- (void)setPitch:(NSNumber *)pitch
{
    _pitchString = [NSString stringWithFormat:@"%d", [pitch integerValue]];
}

- (NSNumber *)roll
{
    return [NSNumber numberWithFloat:[GPXType decimal:_rollString]];
}

- (void)setRoll:(NSNumber *)roll
{
    _rollString = [NSString stringWithFormat:@"%d", [roll integerValue]];
}

#pragma mark - tag

+ (NSString *)tagName
{
    return @"extensions";
}


#pragma mark - GPX

- (void)addChildTagToGpx:(NSMutableString *)gpx indentationLevel:(NSInteger)indentationLevel
{
    [super addChildTagToGpx:gpx indentationLevel:indentationLevel];
    
    [self gpx:gpx addPropertyForValue:_pitchString tagName:@"gpxdata:pitch" indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_rollString tagName:@"gpxdata:roll" indentationLevel:indentationLevel];
}



@end
