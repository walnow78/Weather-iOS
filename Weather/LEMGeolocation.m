#import "LEMGeolocation.h"
#import "LEMTemperature.h"

@interface LEMGeolocation ()

@end

@implementation LEMGeolocation

+(instancetype) geolocationWithName:(NSString*) name
                           latitude:(double) latitude
                          longitude:(double) longitude
                              south:(double) south
                              north:(double) north
                               east:(double) east
                               west:(double) west
                            context:(NSManagedObjectContext*) context{
    
    LEMGeolocation *geo = [LEMGeolocation insertInManagedObjectContext:context];
    
    geo.name = name;
    geo.latitudeValue = latitude;
    geo.longitudeValue = longitude;
    geo.southValue = south;
    geo.northValue = north;
    geo.eastValue = east;
    geo.westValue = west;
    
    [geo addTemperatureObject:[LEMTemperature insertInManagedObjectContext:context]];
    
    return geo;
    
}

@end
