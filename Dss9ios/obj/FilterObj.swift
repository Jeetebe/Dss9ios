

import Foundation


class FilterObj
{
    var nam:String
    var thang:String
    var tinh:String
    var tentinh:String
    var loai:String
    
    var ngay:String
    
    var tab: Int

    public init(nam: String, thang: String, tinh: String, tentinh: String, loai: String, ngay: String, tab: Int) {
        self.nam = nam
        self.thang = thang
        self.tinh = tinh
        self.tentinh = tentinh
        self.loai = loai
        self.ngay = ngay
        self.tab = tab
    }


   
    public init() {
        self.nam = ""
        self.thang = ""
        self.tinh = ""
        self.tentinh = ""
        self.loai = "-1"
        self.ngay = "40"
        self.tab = -1
    }
    
    
    
}
