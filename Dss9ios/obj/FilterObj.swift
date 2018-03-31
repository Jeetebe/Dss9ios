

import Foundation


class FilterObj
{
    var nam:String
    var thang:String
    var tinh:String
    var loai:String
    
    var ngay:String

    public init(nam: String, thang: String, tinh: String, loai: String, ngay: String) {
        self.nam = nam
        self.thang = thang
        self.tinh = tinh
        self.loai = loai
        self.ngay = ngay
    }
    public init() {
        self.nam = ""
        self.thang = ""
        self.tinh = ""
        self.loai = "-1"
        self.ngay = "40"
    }
    
    
    
}
