

import Foundation


class Utils {
   static func   getbyloai( items: BcthInfo, loai:Int) -> MyObj {
        var myobj = MyObj ()
        switch loai {
            
        case 40:
            myobj.thuchien = items.thucHienThang
            myobj.kehoach = items.keHoachThang
            myobj.phantram = items.phanTramThucHienThang
        case 41:
            myobj.thuchien = items.thucHienQuy
            myobj.kehoach = items.keHoachQuy
            myobj.phantram = items.phanTramThucHienQuy
        case 42:
            myobj.thuchien = items.thucHienNam
            myobj.kehoach = items.keHoachNam
            myobj.phantram = items.phanTramThucHienNam
        default:
            myobj.thuchien = items.thucHienThang
            myobj.kehoach = items.keHoachThang
            myobj.phantram = items.phanTramThucHienThang
        }
        
        return myobj
    }
    
    static func   getbyloai_vlr( items: BcvlrInfo, loai:Int) -> MyObj {
        var myobj = MyObj ()
        switch loai {
            
        case 40:
            myobj.thuchien = items.thucHienThang
            myobj.kehoach = items.keHoachThang
            myobj.phantram = items.phanTramThucHienThang
        case 41:
            myobj.thuchien = items.thucHienQuy
            myobj.kehoach = items.keHoachQuy
            myobj.phantram = items.phanTramThucHienQuy
        case 42:
            myobj.thuchien = items.thucHienNam
            myobj.kehoach = items.keHoachNam
            myobj.phantram = items.phanTramThucHienNam
        default:
            myobj.thuchien = items.thucHienThang
            myobj.kehoach = items.keHoachThang
            myobj.phantram = items.phanTramThucHienThang
        }
        
        return myobj
    }
    static func   listVLR2myObj( listsource: [BcvlrInfo]) -> [MyObj] {
        var listmyobj = [MyObj] ()
       for obj in listsource
        {
            listmyobj.append(MyObj(d1: obj.d1, d2: obj.d2, d3: obj.d3, d4: obj.d4, d5: obj.d5, d6: obj.d6, d7: obj.d7, d8: obj.d8, d9: obj.d9, d10: obj.d10, d11: obj.d11, d12: obj.d12, d13: obj.d13, d14: obj.d14, d15: obj.d15, d16: obj.d16, d17: obj.d17, d18: obj.d18, d19: obj.d19, d20: obj.d20, d21: obj.d21, d22: obj.d22, d23: obj.d23, d24: obj.d24, d25: obj.d25, d26: obj.d26, d27: obj.d27, d28: obj.d28, d29: obj.d29, d30: obj.d30, d31: obj.d31,th: obj.thucHienThang,kh: obj.keHoachThang,ptram: obj.phanTramThucHienThang))
        }
        return listmyobj
    }
    
    static func   listVLR2simple( listsource: [BcvlrInfo]) -> [SimpleObj] {
        var listmysimple = [SimpleObj] ()
        for obj in listsource
        {
            var i=0
            do {
                try i = Int(obj.thucHienThang.replacingOccurrences(of: ",", with: ""))!
            }
            catch{
                i = 0
            }
            //let i = 10
            if !obj.donVi.contains("Công ty")
            {
                 listmysimple.append(SimpleObj(t: obj.donVi,gt: obj.thucHienThang,gti: i))
            }
           
        }
        return listmysimple
    }
    static func   Myobj2Simple4Linechart( listsource: [MyObj]) -> [SimpleObj] {
        var listmysimple = [SimpleObj] ()
        
        let obj = listsource[12]
        
          //  var i1 = Int(obj.d1.replacingOccurrences(of: ",", with: ""))! $listmysimple.append(SimpleObj(t: "1",gt: obj.d1,gti: i1))
        
        var i1 = Int(obj.d1.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "1",gt: obj.d1,gti: i1))
        var i2 = Int(obj.d2.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "2",gt: obj.d1,gti: i2))
        var i3 = Int(obj.d3.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "3",gt: obj.d1,gti: i3))
        var i4 = Int(obj.d4.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "4",gt: obj.d1,gti: i4))
        var i5 = Int(obj.d5.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "5",gt: obj.d1,gti: i5))
        var i6 = Int(obj.d6.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "6",gt: obj.d1,gti: i6))
        var i7 = Int(obj.d7.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "7",gt: obj.d1,gti: i7))
        var i8 = Int(obj.d8.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "8",gt: obj.d1,gti: i8))
        var i9 = Int(obj.d9.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "9",gt: obj.d1,gti: i9))
        var i10 = Int(obj.d10.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "10",gt: obj.d1,gti: i10))
        var i11 = Int(obj.d11.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "11",gt: obj.d1,gti: i11))
        var i12 = Int(obj.d12.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "12",gt: obj.d1,gti: i12))
        var i13 = Int(obj.d13.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "13",gt: obj.d1,gti: i13))
        var i14 = Int(obj.d14.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "14",gt: obj.d1,gti: i14))
        var i15 = Int(obj.d15.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "15",gt: obj.d1,gti: i15))
        var i16 = Int(obj.d16.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "16",gt: obj.d1,gti: i16))
        var i17 = Int(obj.d17.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "17",gt: obj.d1,gti: i17))
        var i18 = Int(obj.d18.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "18",gt: obj.d1,gti: i18))
        var i19 = Int(obj.d19.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "19",gt: obj.d1,gti: i19))
        var i20 = Int(obj.d20.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "20",gt: obj.d1,gti: i20))
        var i21 = Int(obj.d21.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "21",gt: obj.d1,gti: i21))
        var i22 = Int(obj.d22.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "22",gt: obj.d1,gti: i22))
        var i23 = Int(obj.d23.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "23",gt: obj.d1,gti: i23))
        var i24 = Int(obj.d24.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "24",gt: obj.d1,gti: i24))
        var i25 = Int(obj.d25.replacingOccurrences(of: ",", with: ""))!
        listmysimple.append(SimpleObj(t: "25",gt: obj.d1,gti: i25))
//        var i26 = Int(obj.d26.replacingOccurrences(of: ",", with: ""))!
//        listmysimple.append(SimpleObj(t: "26",gt: obj.d1,gti: i26))
//        var i27 = Int(obj.d27.replacingOccurrences(of: ",", with: ""))!
//        listmysimple.append(SimpleObj(t: "27",gt: obj.d1,gti: i27))
//        var i28 = Int(obj.d28.replacingOccurrences(of: ",", with: ""))!
//        listmysimple.append(SimpleObj(t: "28",gt: obj.d1,gti: i28))
//        var i29 = Int(obj.d29.replacingOccurrences(of: ",", with: ""))!
//        listmysimple.append(SimpleObj(t: "29",gt: obj.d1,gti: i29))
//        var i30 = Int(obj.d30.replacingOccurrences(of: ",", with: ""))!
//        listmysimple.append(SimpleObj(t: "30",gt: obj.d1,gti: i30))
//        var i31 = Int(obj.d31.replacingOccurrences(of: ",", with: ""))!
//        listmysimple.append(SimpleObj(t: "31",gt: obj.d1,gti: i31))

        
        return listmysimple
    }
}
