#import "_LEMGeolocation.h"


@interface LEMGeolocation : _LEMGeolocation {}

+(instancetype) geolocationWithGeoId:(int) geoId
                                name:(NSString*) name
                                desc:(NSString*) desc
                            latitude:(double) latitude
                           longitude:(double) longitude
                               south:(double) south
                               north:(double) north
                                east:(double) east
                                west:(double) west
                             context:(NSManagedObjectContext*) context;

@end
