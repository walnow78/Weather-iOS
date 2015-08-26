// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LEMGeolocation.h instead.

@import CoreData;

extern const struct LEMGeolocationAttributes {
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *east;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *north;
	__unsafe_unretained NSString *south;
	__unsafe_unretained NSString *west;
} LEMGeolocationAttributes;

@interface LEMGeolocationID : NSManagedObjectID {}
@end

@interface _LEMGeolocation : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LEMGeolocationID* objectID;

@property (nonatomic, strong) NSString* desc;

//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* east;

@property (atomic) double eastValue;
- (double)eastValue;
- (void)setEastValue:(double)value_;

//- (BOOL)validateEast:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* latitude;

@property (atomic) double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* longitude;

@property (atomic) double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* north;

@property (atomic) double northValue;
- (double)northValue;
- (void)setNorthValue:(double)value_;

//- (BOOL)validateNorth:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* south;

@property (atomic) double southValue;
- (double)southValue;
- (void)setSouthValue:(double)value_;

//- (BOOL)validateSouth:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* west;

@property (atomic) double westValue;
- (double)westValue;
- (void)setWestValue:(double)value_;

//- (BOOL)validateWest:(id*)value_ error:(NSError**)error_;

@end

@interface _LEMGeolocation (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;

- (NSNumber*)primitiveEast;
- (void)setPrimitiveEast:(NSNumber*)value;

- (double)primitiveEastValue;
- (void)setPrimitiveEastValue:(double)value_;

- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;

- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitiveNorth;
- (void)setPrimitiveNorth:(NSNumber*)value;

- (double)primitiveNorthValue;
- (void)setPrimitiveNorthValue:(double)value_;

- (NSNumber*)primitiveSouth;
- (void)setPrimitiveSouth:(NSNumber*)value;

- (double)primitiveSouthValue;
- (void)setPrimitiveSouthValue:(double)value_;

- (NSNumber*)primitiveWest;
- (void)setPrimitiveWest:(NSNumber*)value;

- (double)primitiveWestValue;
- (void)setPrimitiveWestValue:(double)value_;

@end
