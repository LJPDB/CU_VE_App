//
//  SecurityServices.swift
//  CU_VE_App
//
//  Created by Leonardo Puga De Biase on 1/17/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import Foundation

class SecurityServices {

    var URIstring : String
    var WSC : WebServicesConnection?
    
    init(){
        self.URIstring = ""
    }
    
    func setURIstringAndWSC(URIstring: String, WSC: WebServicesConnection){
        self.URIstring = URIstring;
        self.WSC = WSC;
    }
    
}