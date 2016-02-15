//
//  TheaterServices.swift
//  CU_VE_App
//
//  Created by Leonardo Puga De Biase on 1/15/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import Foundation

class TheaterServices {
    
    var URIstring : String
    var WSC : WebServicesConnection?
    
    init(){
        self.URIstring = ""
    }
    
    func setURIstringAndWSC(URIstring: String, WSC: WebServicesConnection){
        self.URIstring = URIstring;
        self.WSC = WSC;
    }
    
    
    //  Theater.svc/
    func getAllTheaters(params: [String:AnyObject]){
        let withParams : Bool = !params.isEmpty ? true : false
        let requestType : String = "GET"
        let timeout : Double = 80.0
        self.WSC!.requestWithPossibleNestedCall(requestType, ifParams: withParams, params: params, withTimeout: timeout, inURL: self.URIstring, nestedCallExist: false, nestedCallType: 0, URLforNestedCall: "", nestedCallRequestType: "", nestedCallWithTimeout: 0, nestedCallIfParams: false, paramsForNestedCall: ["":""])
    }
    
    //  Theater.svc/theaterId
    func getTheaterById(theaterId : Int){
        //  Boolean withParams = params ? YES : NO;
        let withDictionaryParams : Bool = MeaningAndFormValidation.theaterInBetweenPropperValues(theaterId, enviroment: self.WSC!.goToEnviroment, className: String(self))
        let requestType : String = "GET"
        let timeout : Double = 80.0
        let auxURI : String = "\(self.URIstring)\(theaterId)"
        if withDictionaryParams {
            self.WSC!.requestWithPossibleNestedCall(requestType, ifParams: false, params: ["":""], withTimeout: timeout, inURL: auxURI, nestedCallExist: false, nestedCallType: 0, URLforNestedCall: "", nestedCallRequestType: "", nestedCallWithTimeout: 0, nestedCallIfParams: false, paramsForNestedCall: ["":""])
        }else{
            MeaningAndFormValidation.printErrorWithText("No params or bad 'theaterId" , className: String(self))
        }
    }
    
    //  Theater.svc/theaterId/day/month
    func getAllByIdDateAndMonth(theaterId: Int, date: Int, month: Int){
        if theaterId>0 && date>0 && month>0 {
            let validTheaterId : Bool = MeaningAndFormValidation.theaterInBetweenPropperValues(theaterId, enviroment: self.WSC!.goToEnviroment, className: String(self))
            let validDate : Bool = MeaningAndFormValidation.dateInBetweenPropperValues(date, className: String(self))
            let validMonth : Bool = MeaningAndFormValidation.monthInBetweenPropperValues(month, className: String(self))
            if (validDate && validMonth && validTheaterId) {
                let requestType : String = "GET"
                let timeout : Double = 80.0
                let auxURI : String = "\(self.URIstring)\(theaterId)/\(date)/\(month)"
                self.WSC!.requestWithPossibleNestedCall(requestType, ifParams: false, params: ["":""], withTimeout: timeout, inURL: auxURI, nestedCallExist: false, nestedCallType: 0, URLforNestedCall: "", nestedCallRequestType: "", nestedCallWithTimeout: 0, nestedCallIfParams: false, paramsForNestedCall: ["":""])
            }
        }else{
            MeaningAndFormValidation.printErrorWithText("Wrong params passed through.!" , className: String(self))
        }
    }
    
    //  Theater.svc/City/
    func getAllAvailableCities(params: [String:AnyObject]){
        //_ : Bool = params.isEmpty ? false : true
        let requestType : String = "GET";
        let timeout : Double = 80.0
        let auxURI : String = "\(self.URIstring)City/"
        self.WSC!.requestWithPossibleNestedCall(requestType, ifParams: false, params: ["":""], withTimeout: timeout, inURL: auxURI, nestedCallExist: false, nestedCallType: 0, URLforNestedCall: "", nestedCallRequestType: "", nestedCallWithTimeout: 0, nestedCallIfParams: false, paramsForNestedCall: ["":""])
    }
    
    //  Theater.svc/City/cityName
    func getAllByThisCity(city: String) {
        if MeaningAndFormValidation.checkCityExistance(city, className: String(self)){
            let requestType : String = "GET"
            let timeout : Double = 80.0
            let auxURI : String = "\(self.URIstring)City/\(city)"
            self.WSC!.requestWithPossibleNestedCall(requestType, ifParams: false, params: ["":""], withTimeout: timeout, inURL: auxURI, nestedCallExist: false, nestedCallType: 0, URLforNestedCall: "", nestedCallRequestType: "", nestedCallWithTimeout: 0, nestedCallIfParams: false, paramsForNestedCall: ["":""])
        } else {
            MeaningAndFormValidation.printErrorWithText("City name not valid" , className: String(self))
        }
    }
    
    //  Theater.svc/City/cityName/day/month
    func getAllByThisCityThisDateThisMonth(city: String,  date: Int, month: Int){
        if !city.isEmpty && date>0 && month>0 {
            let validCity : Bool = MeaningAndFormValidation.checkCityExistance(city,  className: String(self))
            let validDate : Bool = MeaningAndFormValidation.dateInBetweenPropperValues(date, className: String(self))
            let validMonth : Bool = MeaningAndFormValidation.monthInBetweenPropperValues(month, className: String(self))
            if validDate && validMonth && validCity {
                let requestType: String = "GET"
                let timeout: Double = 80.0
                let auxURI: String = "\(self.URIstring)City/\(city)/\(date)/\(month)"
                self.WSC!.requestWithPossibleNestedCall(requestType, ifParams: false, params: ["":""], withTimeout: timeout, inURL: auxURI, nestedCallExist: false, nestedCallType: 0, URLforNestedCall: "", nestedCallRequestType: "", nestedCallWithTimeout: 0, nestedCallIfParams: false, paramsForNestedCall: ["":""])
            }
        }else{
            MeaningAndFormValidation.printErrorWithText("Wrong params passed through.!", className: String(self))
        }
    }
    
    //  Theater.svc/Session/theaterId/sessionId
    func getSessionByTheaterIdAndSessionId(theaterId: Int, sessionId: Int){
        if theaterId>999 && sessionId>2000{
            let validTheaterId: Bool = MeaningAndFormValidation.theaterInBetweenPropperValues(theaterId, enviroment: self.WSC!.goToEnviroment, className: String(self))
            if validTheaterId {
                let requestType: String = "GET"
                let timeout: Double = 80.0
                let auxURI: String = "\(self.URIstring)Session/\(theaterId)/\(sessionId)"
                 self.WSC!.requestWithPossibleNestedCall(requestType, ifParams: false, params: ["":""], withTimeout: timeout, inURL: auxURI, nestedCallExist: false, nestedCallType: 0, URLforNestedCall: "", nestedCallRequestType: "", nestedCallWithTimeout: 0, nestedCallIfParams: false, paramsForNestedCall: ["":""])
            }
        }else{
            MeaningAndFormValidation.printErrorWithText("Wrong params passed through.!", className: String(self))
        }
    }

}