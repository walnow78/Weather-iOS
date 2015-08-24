// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LEMGeolocation.m instead.

#import "_LEMGeolocation.h"

const struct LEMGeolocationAttributes LEMGeolocationAttributes = {
	.east = @"east",
	.latitude = @"latitude",
	.longitude = @"longitude",
	.name = @"name",
	.north = @"north",
	.south = @"south",
	.west = @"west",
};

@implementation LEMGeolocationID
@end

@implementation _LEMGeolocation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Geolocation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Geolocation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Geolocation" inManagedObjectContext:moc_];
}

- (LEMGeolocationID*)objectID {
	return (LEMGeolocationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"eastValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"east"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"northValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"north"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"southValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"south"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"westValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"west"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic east;

- (double)eastValue {
	NSNumber *result = [self east];
	return [result doubleValue];
}

- (void)setEastValue:(double)value_ {
	[self setEast:@(value_)];
}

- (double)primitiveEastValue {
	NSNumber *result = [self primitiveEast];
	return [result doubleValue];
}

- (void)setPrimitiveEastValue:(double)value_ {
	[self setPrimitiveEast:@(value_)];
}

@dynamic latitude;

- (double)latitudeValue {
	NSNumber *result = [self latitude];
	return [result doubleValue];
}

- (void)setLatitudeValue:(double)value_ {
	[self setLatitude:@(value_)];
}

- (double)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudeValue:(double)value_ {
	[self setPrimitiveLatitude:@(value_)];
}

@dynamic longitude;

- (double)longitudeValue {
	NSNumber *result = [self longitude];
	return [result doubleValue];
}

- (void)setLongitudeValue:(double)value_ {
	[self setLongitude:@(value_)];
}

- (double)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result doubleValue];
}

- (void)setPrimitiveLongitudeValue:(double)value_ {
	[self setPrimitiveLongitude:@(value_)];
}

@dynamic name;

@dynamic north;

- (double)northValue {
	NSNumber *result = [self north];
	return [result doubleValue];
}

- (void)setNorthValue:(double)value_ {
	[self setNorth:@(value_)];
}

- (double)primitiveNorthValue {
	NSNumber *result = [self primitiveNorth];
	return [result doubleValue];
}

- (void)setPrimitiveNorthValue:(double)value_ {
	[self setPrimitiveNorth:@(value_)];
}

@dynamic south;

- (double)southValue {
	NSNumber *result = [self south];
	return [result doubleValue];
}

- (void)setSouthValue:(double)value_ {
	[self setSouth:@(value_)];
}

- (double)primitiveSouthValue {
	NSNumber *result = [self primitiveSouth];
	return [result doubleValue];
}

- (void)setPrimitiveSouthValue:(double)value_ {
	[self setPrimitiveSouth:@(value_)];
}

@dynamic west;

- (double)westValue {
	NSNumber *result = [self west];
	return [result doubleValue];
}

- (void)setWestValue:(double)value_ {
	[self setWest:@(value_)];
}

- (double)primitiveWestValue {
	NSNumber *result = [self primitiveWest];
	return [result doubleValue];
}

- (void)setPrimitiveWestValue:(double)value_ {
	[self setPrimitiveWest:@(value_)];
}

@end

