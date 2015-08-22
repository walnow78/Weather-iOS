// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LEMTemperature.m instead.

#import "_LEMTemperature.h"

const struct LEMTemperatureAttributes LEMTemperatureAttributes = {
	.temperature = @"temperature",
};

const struct LEMTemperatureRelationships LEMTemperatureRelationships = {
	.geolocation = @"geolocation",
};

@implementation LEMTemperatureID
@end

@implementation _LEMTemperature

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Temperature" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Temperature";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Temperature" inManagedObjectContext:moc_];
}

- (LEMTemperatureID*)objectID {
	return (LEMTemperatureID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"temperatureValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"temperature"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic temperature;

- (double)temperatureValue {
	NSNumber *result = [self temperature];
	return [result doubleValue];
}

- (void)setTemperatureValue:(double)value_ {
	[self setTemperature:@(value_)];
}

- (double)primitiveTemperatureValue {
	NSNumber *result = [self primitiveTemperature];
	return [result doubleValue];
}

- (void)setPrimitiveTemperatureValue:(double)value_ {
	[self setPrimitiveTemperature:@(value_)];
}

@dynamic geolocation;

@end

