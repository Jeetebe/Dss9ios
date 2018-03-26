//
//  MyObj.swift
//  Dss9ios
//
//  Created by MacBook on 3/25/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import Foundation

class  MyObj
{
    var thuchien:String = ""
    var kehoach:String = ""
    var phantram:String = ""
    
   
    init() {
        self.thuchien=""
        self.kehoach=""
        self.phantram=""
    }
}

class SimpleObj
{
    var ten:String = ""
    var giatri:String = ""
    var giatriInt:Int = 0
    init() {
        self.ten=""
        self.giatri=""
        self.giatriInt=0
    }
    init(t:String,gt:String,gti:Int) {
        self.ten=t
        self.giatri=gt
        self.giatriInt=gti
    }
}


