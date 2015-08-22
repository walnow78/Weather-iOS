#import "_LEMGeolocation.h"


@interface LEMGeolocation : _LEMGeolocation {}

+(instancetype) geolocationWithName:(NSString*) name
                           latitude:(double) latitude
                          longitude:(double) longitude
                              south:(double) south
                              north:(double) north
                               east:(double) east
                               west:(double) west
                            context:(NSManagedObjectContext*) context;

@end
