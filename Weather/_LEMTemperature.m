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

	return keyPaths;
}

@dynamic geolocation;

@end

