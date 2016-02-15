//
//  MeaningAndFormValidation.swift
//  CU_VE_App
//
//  Created by Leonardo Puga De Biase on 1/14/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

public class MeaningAndFormValidation {
    
    // MARK: - Parse NSDictionary to JSONString
    class func stringFromDictionary(params: [String:AnyObject], className: String) -> String{
        /*
        var error: NSError? = nil
        let dictionary = NSData()
        do {
            let anyObj = try NSJSONSerialization.JSONObjectWithData(NSData(params), options: NSJSONReadingOptions(rawValue: 0)) as! [String:AnyObject]
            // use anyObj here
        } catch let error as NSError {
            print("json error: \(error.localizedDescription)")
        }
        */
        return "Nothing, method is empty"
    }
    
    // MARK: - Print error and TheaterId validations
    
    class func printErrorWithText(error: String, className: String ){
        print("\(error) : \(className)")
    }
    
    class func printMessageWithText(message: String, className: String ){
        print("\(className.uppercaseString) : \(message)")
    }
    
    class func theaterInBetweenPropperValues(theaterId: Int, enviroment: String, className: String) -> Bool{
        if (theaterId>1000)&&(theaterId<1029) {
            if theaterId==1028 {
                if enviroment == "Dev" {
                    return true
                }else{
                    self.printErrorWithText("'theaterId' not valid in this enviroment", className:  className)
                    return false
                }
            }
            return true;
        }else{
            self.printErrorWithText("Wrong 'theaterId' value", className: className)
            return false;
        }
    }
    
    class func dateInBetweenPropperValues(date: Int, className: String) -> Bool{
        if (date>0)&&(date<32) {
            return true;
        }else{
            self.printErrorWithText("Wrong 'date' value", className: className)
            return false;
        }
    }
    
    class func monthInBetweenPropperValues( month: Int, className: String) -> Bool{
        if (month>0)&&(month<13) {
            return true
        }else{
            self.printErrorWithText("Wrong 'month' value", className: className)
            return false
        }
    }
    
    class func checkAllMandatoryInDictionary(params: [String:String]) -> Bool{
        var itsOk : Bool = true
        var insideValue : String = ""
        for (key, _) in params{
            insideValue = params[key]!
            if (insideValue == "") || (insideValue.isEmpty) {
                itsOk = false
            }
        }
        return itsOk;
    }
    
    class func checkCityExistance( city: String, className: String) -> Bool {
        let cityArray : [String] = ["Barquisimeto",
            "Caracas",
            "Guatire",
            "Maracaibo",
            "Maracay",
            "Margarita",
            "Maturin",
            "Puerto La Cruz",
            "Puerto Ordaz",
            "San Cristobal",
            "Valencia"]
        if !cityArray.contains(city) {
            self.printErrorWithText("City not valid. City most be one of the listed.", className: className)
        }
        return cityArray.contains(city)
    }
    
    class func checkMovieId(movieId: String, className: String) -> Bool{
        let movieIdLength: Int = movieId.characters.count
        var movieIdRightFormat: Bool = false
        if movieIdLength==10 {
            let indexFour = movieId.endIndex.advancedBy(-4)
            let prefToCheckFourO: String = movieId.substringToIndex(indexFour)
            let indexThree = movieId.endIndex.advancedBy(-5)
            let prefToCheckThreeO: String = movieId.substringToIndex(indexThree)
            if (prefToCheckFourO == "HO0000") || (prefToCheckThreeO == "HO000") {
                movieIdRightFormat = true;
            } else {
                self.printErrorWithText("MovieId has bad format ('HO0000' format), please check the 'HO' movie code.", className: className)
            }
        } else {
            self.printErrorWithText("MovieId has bad format (Id length), please check the 'HO' movie code.", className: className)
        }
        return movieIdRightFormat;
    }
    
    class func NSStringIsValidEmail(testStr: String, className: String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if (!emailTest.evaluateWithObject(testStr)) {
            self.printErrorWithText("Bad eMail format, please all eMail string and domain.", className: className)
        }
        return emailTest.evaluateWithObject(testStr)
    }

    
    class func validatePlatform(platform: String, className: String) -> Bool {
        var validPlatform : Bool = false
        let platforms : [String] = ["Web", "Mobile"]
        validPlatform = platforms.contains(platform)
        if (!validPlatform) {
            self.printErrorWithText("Invalid platform....Values most be one of the listed ones (Web/Mobile).", className: className)
        }
        return validPlatform;
    }
    
    class func yearInBetweenPropperValues(year: Int, className: String) -> Bool{
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        let actualYear = components.year
        if (year>(actualYear - 90))&&(year<(actualYear - 18)) {
            return true
        }else{
            self.printErrorWithText("Wrong 'year' value", className: className)
            return false
        }
    }
    
    
    class func validateIdCardFormat(idCard: String,  className: String) -> Bool{
        let trimmedidCard : String = idCard.stringByReplacingOccurrencesOfString(" ", withString: "")
        if !idCard.isEmpty && !(trimmedidCard == "") {
            let indexV = idCard.startIndex.advancedBy(1)
            let prefV : String = idCard.substringToIndex(indexV)
            let IdNumber : String = idCard.substringFromIndex(indexV)
            let idCardIntValue : Int64 = Int64(IdNumber)!
            let testBack : String = String(idCardIntValue)
            if (prefV == "V") && (IdNumber == testBack) {
                return true
            }else{
                self.printErrorWithText("Wrong 'IdCard' value. Must has 'V' as prefix and then the id number ('V234122').", className: className)
                return true
            }
        } else {
            self.printErrorWithText("'IdCard' value is null or empty. Must has 'V' as prefix and then the id number ('V234122').", className: className)
            return false
        }
    }

    // MARK: - iPhone or iPad validation
    class func getProportionsDependingOnDeviceType() -> [CGFloat]{
        let modelName = UIDevice.currentDevice().modelName
        if modelName.containsString("iPhone"){
            switch modelName{
                case "iPhone 4", "iPhone 4s", "iPhone 5", "iPhone 5s", "iPhone 6", "iPhone 6s":
                    return [2.1,1.99999]
                case "iPhone 6s Plus":
                    return [2.1,2.1]
                default:    return[9,9]
            }
        }else if modelName.containsString("iPad"){
            switch modelName{
                case "iPad 2", "iPad 3", "iPad 4", "iPad Air", "iPad Air 2", "iPad Pro":
                    return [2.06,2]
                case "iPad Mini", "iPad Mini 2", "iPad Mini 3", "iPad Mini 4":
                    return [2,2]
                default:    return[9,9]
            }
        }else if modelName.containsString("Simulator"){
            //MeaningAndFormValidation.printMessageWithText("getProportionsDependingOnDeviceType()--> Device name to compare: \(UIDevice.currentDevice().model)", className: String(self))
            switch UIDevice.currentDevice().model{
                case "iPad":
                    return [2.06,2]
                case "iPhone", "iPhone 4", "iPhone 4s", "iPhone 5", "iPhone 5s", "iPhone 6", "iPhone 6s":
                    return [2.12,2]
                case "iPhone Simulator":
                    return [2.12,2]
                default:    return[9,9]
            }
        }else{
            MeaningAndFormValidation.printMessageWithText("getProportionsDependingOnDeviceType()--> No device matched!", className: String(self))
            return [9,9]
        }
    }

}
