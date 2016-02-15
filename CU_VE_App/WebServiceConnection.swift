//
//  WebServiceConnection.swift
//  CU_VE_App
//
//  Created by Daniel Puga on 13/1/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import Foundation

class WebServicesConnection {

    var URI: String
    var enviromentServer: [String:String]
    var justServicesKeys: [String]
    var singleServiceObjects: [String:AnyObject]
    var groupServicesType: [String:Int]
    var webServicesPref: [String:String]
    var iOSbellowNine: Bool
    var goToEnviroment: String
    var clientID: String
    var JSONparsed: [String:AnyObject]

    init(){
        self.clientID = "111.111.111.120"
        self.goToEnviroment = "Dev"
        self.webServicesPref = ["theater" : "/Theater.svc/",
            "movie" : "/Movie.svc/",
            "security" : "/Security.svc/",
            "premier" : "/Premier.svc/",
            "contact" : "/Contact.svc/",
            "usersession" : "/UserSessionServices.svc/"]
        self.enviromentServer = ["Dev" : "http://cu-dev-wcf-services.cloudapp.net", "Prod" : "http://23.102.188.6"]
        self.groupServicesType = ["theater" : 0,
            "movie" : 1,
            "security" : 2,
            "premier" : 3,
            "contact" : 4,
            "usersession" : 5]
        
        self.justServicesKeys = Array(self.groupServicesType.keys)
        self.URI = self.enviromentServer[self.goToEnviroment]!
        
        
        
        var i: Int = 0
        
        self.singleServiceObjects = [String:AnyObject]()
        for serviceObjectName in self.justServicesKeys {
            switch serviceObjectName {
            case "theater":
                let theaterObj: TheaterServices = TheaterServices()
                self.singleServiceObjects[serviceObjectName] = theaterObj
            case "movie":
                let movieObj: MovieServices = MovieServices()
                self.singleServiceObjects[serviceObjectName] = movieObj
            case "usersession":
                let usersessionObj: UsersessionServices = UsersessionServices()
                self.singleServiceObjects[serviceObjectName] = usersessionObj
            case "security":
                let securityObj: SecurityServices = SecurityServices()
                self.singleServiceObjects[serviceObjectName] = securityObj
            case "premier":
                let premierObj: PremierServices = PremierServices()
                self.singleServiceObjects[serviceObjectName] = premierObj
            case "contact":
                let contactObj: ContactServices = ContactServices()
                self.singleServiceObjects[serviceObjectName] = contactObj
            default: print("no service object created")
            }
            i++;
        }
        print("WebService Objects: \(self.singleServiceObjects)");
        
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_3) {
            self.iOSbellowNine = false;
        } else {
            self.iOSbellowNine = true;
        }
        JSONparsed = [String:AnyObject]()
    }

// MARK: - Get back a specific web service kind of an object (Theater, Premier, Movie......etc)
    func getServiceObjectFromGroup(group: String) -> AnyObject{
        let valueForGroupSwitch = self.groupServicesType[group.lowercaseString];
        if valueForGroupSwitch == nil{
            MeaningAndFormValidation.printErrorWithText(" getServiceObjectFromGroup: Wrong name for ServiceGroup, please check your 'getServiceObjectFromGroup' argument.", className: String(self))
            return ""
        } else {
            let objectType: String = group.lowercaseString
            switch objectType {
            case "theater":
                let tempObj = self.singleServiceObjects[String(valueForGroupSwitch)] as! TheaterServices
                tempObj.setURIstringAndWSC(self.URI, WSC: self)
                return tempObj
            case "movie":
                print(self.singleServiceObjects[group])
                let movieObj = self.singleServiceObjects[group] as! MovieServices
                movieObj.setURIstringAndWSC(self.URI, WSC: self)
                return movieObj
            case "usersession":
                let usersessionObj = self.singleServiceObjects[String(valueForGroupSwitch)] as! UsersessionServices
                usersessionObj.setURIstringAndWSC(self.URI, WSC: self)
                return usersessionObj
            case "premier":
                let premierObj = self.singleServiceObjects[String(valueForGroupSwitch)] as! PremierServices
                premierObj.setURIstringAndWSC(self.URI, WSC: self)
                return premierObj
            case "contact":
                let contactObj = self.singleServiceObjects[String(valueForGroupSwitch)] as! ContactServices
                contactObj.setURIstringAndWSC(self.URI, WSC: self)
                return contactObj
            case "security":
                let securityObj = self.singleServiceObjects[String(valueForGroupSwitch)] as! SecurityServices
                securityObj.setURIstringAndWSC(self.URI, WSC: self)
                return securityObj
            default:
                MeaningAndFormValidation.printErrorWithText(" getServiceObjectFromGroup: Something went wrong.", className: String(self))
                return ""
            }
        }
    }


    func requestWithPossibleNestedCall (requestType: NSString, ifParams: Bool, params: [String:AnyObject], withTimeout:Double, inURL: String, nestedCallExist: Bool, nestedCallType: Int, URLforNestedCall: String, nestedCallRequestType:String, nestedCallWithTimeout: Double, nestedCallIfParams: Bool, paramsForNestedCall: [String:AnyObject]){
        
        dispatch_async(dispatch_get_main_queue(), {
        /*
        //NSString *URLwithCharacters = [URLstring stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: URLstring] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:timeout];
        [request    setHTTPMethod:requestType];
        //for sending data
        if (ifParams) {
        NSError *error;
        [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        NSData *postData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
        //[request setHTTPBody:[NSData dataWithBytes:[params UTF8String] length:strlen([params UTF8String])]];
        [request setHTTPBody:postData];
        }
        //to accept data
        [request  setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Accept"];
        [request  setValue:_clientID forHTTPHeaderField:@"ClientID"];
        
        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        //__block NSMutableDictionary * JSONparsed = [[NSMutableDictionary alloc] init];
        
        if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_8_3) {
        [NSURLConnection sendAsynchronousRequest: request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError){
        if ([data length] > 0 && connectionError == nil) {
        NSLog(@"Response from service: %@", response);
        NSError *JSONerror = nil;
        //id responseParsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        NSDictionary *JSONinDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        
        if (!nestedCall) {
        if (!JSONerror) {
        _JSONparsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        [self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        NSLog(@"Response parsed to JSON: %@", JSONinDictionary);
        }else{
        NSString *auxReceiver = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        _JSONparsed = [NSMutableDictionary dictionaryWithDictionary:@{ @"Response" : [auxReceiver stringByReplacingOccurrencesOfString:@"\"" withString:@""] }];
        NSLog(@"JSON bad formed and transformed to somenthing meaningful for the app: %@", _JSONparsed);
        [self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        }
        } else {
        if (!JSONerror) {
        NSMutableDictionary *auxDictionaryToSend = [[NSMutableDictionary alloc] init];
        switch (nestedCallType) {
        case 0:
        // UpdateUser
        //aqui hacer el seteo de los nuevos valores
        [auxDictionaryToSend setDictionary:JSONinDictionary];
        for (NSString *key in paramsForNestedCall) {
        [auxDictionaryToSend setValue:[paramsForNestedCall valueForKey:key] forKey:key];
        }
        [self OLDmakeNestedCallWithURL:URLforNestedCall andWithParams:auxDictionaryToSend nestedCallWithTimeout:nestedTimeout nestedCallIfParams:nestedIfParams nestedCallRequestType:nestedRequestType];
        break;
        
        default:
        NSLog(@"Bad parameter to request a nestedCall");
        break;
        }
        //[self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        NSLog(@"Response parsed to JSON: %@", JSONinDictionary);
        }else{
        //NSString *auxReceiver = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        //_JSONparsed = [NSMutableDictionary dictionaryWithDictionary:@{ @"Response" : auxReceiver }];
        NSLog(@"JSON bad formed and transformed to somenthing meaningful for the app:");
        //[self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        }
        }
        
        
        } else if ([data length] == 0 && connectionError ==nil) {
        NSLog(@"Nothing back in Response from service");
        }else if ( connectionError != nil && connectionError.code == ECONNABORTED) {
        NSLog(@"Fail to connect before Timeout!");
        }else if (connectionError != nil){
        NSLog(@"Error: %@", connectionError);
        }
        }];
        }else{
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithRequest:(NSURLRequest *) request completionHandler:^(NSData *data, NSURLResponse *response, NSError *connectionError){
        if ([data length] > 0 && connectionError == nil) {
        NSLog(@"Response from service: %@", response);
        NSError *JSONerror = nil;
        //id responseParsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        NSDictionary *JSONinDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        if (!nestedCall) {
        if (!JSONerror) {
        _JSONparsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        [self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        NSLog(@"Response parsed to JSON: %@", JSONinDictionary);
        }else{
        NSString *auxReceiver = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        _JSONparsed = [NSMutableDictionary dictionaryWithDictionary:@{ @"Response" : [auxReceiver stringByReplacingOccurrencesOfString:@"\"" withString:@""] }];
        NSLog(@"JSON bad formed and transformed to somenthing meaningful for the app: %@", _JSONparsed);
        [self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        }
        } else {
        if (!JSONerror) {
        NSMutableDictionary *auxDictionaryToSend = [[NSMutableDictionary alloc] init];
        switch (nestedCallType) {
        case 0:
        // UpdateUser
        //aqui hacer el seteo de los nuevos valores
        [auxDictionaryToSend setDictionary:JSONinDictionary];
        for (NSString *key in paramsForNestedCall) {
        [auxDictionaryToSend setValue:[paramsForNestedCall valueForKey:key] forKey:key];
        }
        [self makeNestedCallWithURL:URLforNestedCall andWithParams:auxDictionaryToSend nestedCallWithTimeout:nestedTimeout nestedCallIfParams:nestedIfParams nestedCallRequestType:nestedRequestType];
        break;
        
        default:
        NSLog(@"Bad parameter to request a NestedCall");
        break;
        }
        //[self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        NSLog(@"Response parsed to JSON: %@", JSONinDictionary);
        }else{
        //NSString *auxReceiver = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        //_JSONparsed = [NSMutableDictionary dictionaryWithDictionary:@{ @"Response" : auxReceiver }];
        NSLog(@"JSON bad formed and transformed to somenthing meaningful for the app:");
        //[self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        }
        }
        } else if ([data length] == 0 && connectionError ==nil) {
        NSLog(@"Nothing back in Response from service");
        }else if ( connectionError != nil && connectionError.code == ECONNABORTED) {
        NSLog(@"Fail to connect before Timeout!");
        }else if (connectionError != nil){
        NSLog(@"Error: %@", connectionError);
        }
        }]resume];
        }
        //return _JSONparsed;
*/
        })
    }

    func makeNestedCallWithURL(NestedURL: String, nestedParams: NSDictionary, nestedCallWithTimeout:Double, nestedCallIfParams: Bool, nestedCallRequestType: String) {  //iOS version > 8.3
        /*NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: NestedURL] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:timeout];
        [request    setHTTPMethod:requestType];
        //for sending data
        if (ifParams) {
        NSError *error;
        [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        NSData *postData = [NSJSONSerialization dataWithJSONObject:nestedParams options:0 error:&error];
        //[request setHTTPBody:[NSData dataWithBytes:[params UTF8String] length:strlen([params UTF8String])]];
        [request setHTTPBody:postData];
        }
        //to accept data
        [request  setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Accept"];
        NSURLSession *NestedSession = [NSURLSession sharedSession];
        [[NestedSession dataTaskWithRequest:(NSURLRequest *) request completionHandler:^(NSData *data, NSURLResponse *response, NSError *connectionError){
        if ([data length] > 0 && connectionError == nil) {
        NSLog(@"Response from NESTED service: %@", response);
        NSError *JSONerror = nil;
        //id responseParsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        NSDictionary *JSONinDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        if (!JSONerror) {
        _JSONparsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        [self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        NSLog(@"NESTED Response parsed to JSON: %@", JSONinDictionary);
        }else{
        NSString *auxReceiver = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        _JSONparsed = [NSMutableDictionary dictionaryWithDictionary:@{ @"NESTED Response" : auxReceiver }];
        NSLog(@"NESTED JSON bad formed and transformed to somenthing meaningful for the app: %@", _JSONparsed);
        [self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        }
        
        } else if ([data length] == 0 && connectionError ==nil) {
        NSLog(@"Nothing back in Response from NESTED service");
        }else if ( connectionError != nil && connectionError.code == ECONNABORTED) {
        NSLog(@"Fail to NESTED connect before Timeout!");
        }else if (connectionError != nil){
        NSLog(@"NESTED Error: %@", connectionError);
        }
        }]resume];
        */
    }

    func OLDFormatMakeNestedCall(NestedURL: NSString, nestedParams: NSDictionary, nestedCallWithTimeout: Double, nestedCallIfParams: Bool, nestedCallRequestType: NSString) {  //iOS version < 8.3
    
        /*request: NSMutableURLRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: NestedURL] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:timeout];
        [request    setHTTPMethod:requestType];
        //for sending data
        if (ifParams) {
        NSError *error;
        [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        NSData *postData = [NSJSONSerialization dataWithJSONObject:nestedParams options:0 error:&error];
        //[request setHTTPBody:[NSData dataWithBytes:[params UTF8String] length:strlen([params UTF8String])]];
        [request setHTTPBody:postData];
        }
        //to accept data
        [request  setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Accept"];
        [NSURLConnection sendAsynchronousRequest: request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError){
        if ([data length] > 0 && connectionError == nil) {
        NSLog(@"Response from NESTED service: %@", response);
        NSError *JSONerror = nil;
        //id responseParsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        NSDictionary *JSONinDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        if (!JSONerror) {
        _JSONparsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONerror];
        [self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        NSLog(@"NESTED Response parsed to JSON: %@", JSONinDictionary);
        }else{
        NSString *auxReceiver = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        _JSONparsed = [NSMutableDictionary dictionaryWithDictionary:@{ @"NESTED Response" : auxReceiver }];
        NSLog(@"NESTED JSON bad formed and transformed to somenthing meaningful for the app: %@", _JSONparsed);
        [self.webServiceReceivedResponseDelegate webServiceReceivedResponse:_JSONparsed];
        }
        } else if ([data length] == 0 && connectionError ==nil) {
        NSLog(@"Nothing back in Response from NESTED service");
        }else if ( connectionError != nil && connectionError.code == ECONNABORTED) {
        NSLog(@"Fail to NESTED connect before Timeout!");
        }else if (connectionError != nil){
        NSLog(@"NESTED Error: %@", connectionError);
        }
        }]; 
        */
    }

}

