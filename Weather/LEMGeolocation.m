#import "LEMGeolocation.h"
#import <AFNetworking/AFHTTPRequestOperation.h>
#import <AFNetworking/AFNetworking.h>
#import "LEMSettings.h"

@interface LEMGeolocation ()

@end

@implementation LEMGeolocation

+(instancetype) geolocationWithName:(NSString*) name
                               desc:(NSString*) desc
                           latitude:(double) latitude
                          longitude:(double) longitude
                              south:(double) south
                              north:(double) north
                               east:(double) east
                               west:(double) west
                            context:(NSManagedObjectContext*) context{

    LEMGeolocation *geo = [LEMGeolocation checkWithLatitude:latitude
                                                  Longitude:longitude
                                                     context:context];
    
    if (geo == nil) {
        
        geo = [LEMGeolocation insertInManagedObjectContext:context];
        
        geo.name = name;
        geo.desc = desc;
        geo.latitudeValue = latitude;
        geo.longitudeValue = longitude;
        geo.southValue = south;
        geo.northValue = north;
        geo.eastValue = east;
        geo.westValue = west;
    }
    
    return geo;
    
}

+(LEMGeolocation*) checkWithLatitude:(double) latitude
                           Longitude:(double) longitude
                              context:(NSManagedObjectContext*) context{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[LEMGeolocation entityName]];

    NSPredicate *predLatitude = [NSPredicate predicateWithFormat:@"latitude == %lf", latitude];
    NSPredicate *predLongitude = [NSPredicate predicateWithFormat:@"longitude == %lf", longitude];
    
    req.predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[predLatitude, predLongitude]];
    
    NSError *err;
    
    LEMGeolocation *loc = [[context executeFetchRequest:req
                                                  error:&err] lastObject];
    
    if (err) {
        NSLog(@"Error: geolocation %@", err.localizedDescription);
    }
    
    return loc;
    
}

@end
