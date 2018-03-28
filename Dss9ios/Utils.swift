

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
    
    static func   getlech(d1:String,d2:String) ->String
    {
        var kq=""
        //print("d2 \(d2)")
        if let tmp2 = Int(d2.replacingOccurrences(of: ",", with: ""))
        {
              // print("tmp2 \(tmp2)")
            if let tmp1 = Int(d1.replacingOccurrences(of: ",", with: ""))
            {
                kq = String(tmp2-tmp1)
            }
        }
        return kq
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
            
        case 1: myobj.thuchien = items.d1 ; myobj.phantram = Utils.getlech(d1: "0", d2: "0")
        case 2: myobj.thuchien = items.d2 ; myobj.phantram = Utils.getlech(d1: items.d1, d2: items.d2)
        case 3: myobj.thuchien = items.d3 ; myobj.phantram = Utils.getlech(d1: items.d2, d2: items.d3)
        case 4: myobj.thuchien = items.d4 ; myobj.phantram = Utils.getlech(d1: items.d3, d2: items.d4)
        case 5: myobj.thuchien = items.d5 ; myobj.phantram = Utils.getlech(d1: items.d4, d2: items.d5)
        case 6: myobj.thuchien = items.d6 ; myobj.phantram = Utils.getlech(d1: items.d5, d2: items.d6)
        case 7: myobj.thuchien = items.d7 ; myobj.phantram = Utils.getlech(d1: items.d6, d2: items.d7)
        case 8: myobj.thuchien = items.d8 ; myobj.phantram = Utils.getlech(d1: items.d7, d2: items.d8)
        case 9: myobj.thuchien = items.d9 ; myobj.phantram = Utils.getlech(d1: items.d8, d2: items.d9)
        case 10: myobj.thuchien = items.d10 ; myobj.phantram = Utils.getlech(d1: items.d9, d2: items.d10)
        case 11: myobj.thuchien = items.d11 ; myobj.phantram = Utils.getlech(d1: items.d10, d2: items.d11)
        case 12: myobj.thuchien = items.d12 ; myobj.phantram = Utils.getlech(d1: items.d11, d2: items.d12)
        case 13: myobj.thuchien = items.d13 ; myobj.phantram = Utils.getlech(d1: items.d12, d2: items.d13)
        case 14: myobj.thuchien = items.d14 ; myobj.phantram = Utils.getlech(d1: items.d13, d2: items.d14)
        case 15: myobj.thuchien = items.d15 ; myobj.phantram = Utils.getlech(d1: items.d14, d2: items.d15)
        case 16: myobj.thuchien = items.d16 ; myobj.phantram = Utils.getlech(d1: items.d15, d2: items.d16)
        case 17: myobj.thuchien = items.d17 ; myobj.phantram = Utils.getlech(d1: items.d16, d2: items.d17)
        case 18: myobj.thuchien = items.d18 ; myobj.phantram = Utils.getlech(d1: items.d17, d2: items.d18)
        case 19: myobj.thuchien = items.d19 ; myobj.phantram = Utils.getlech(d1: items.d18, d2: items.d19)
        case 20: myobj.thuchien = items.d20 ; myobj.phantram = Utils.getlech(d1: items.d19, d2: items.d20)
        case 21: myobj.thuchien = items.d21 ; myobj.phantram = Utils.getlech(d1: items.d20, d2: items.d21)
        case 22: myobj.thuchien = items.d22 ; myobj.phantram = Utils.getlech(d1: items.d21, d2: items.d22)
        case 23: myobj.thuchien = items.d23 ; myobj.phantram = Utils.getlech(d1: items.d22, d2: items.d23)
        case 24: myobj.thuchien = items.d24 ; myobj.phantram = Utils.getlech(d1: items.d23, d2: items.d24)
        case 25: myobj.thuchien = items.d25 ; myobj.phantram = Utils.getlech(d1: items.d24, d2: items.d25)
        case 26: myobj.thuchien = items.d26 ; myobj.phantram = Utils.getlech(d1: items.d25, d2: items.d26)
        case 27: myobj.thuchien = items.d27 ; myobj.phantram = Utils.getlech(d1: items.d26, d2: items.d27)
        case 28: myobj.thuchien = items.d28 ; myobj.phantram = Utils.getlech(d1: items.d27, d2: items.d28)
        case 29: myobj.thuchien = items.d29 ; myobj.phantram = Utils.getlech(d1: items.d28, d2: items.d29)
        case 30: myobj.thuchien = items.d30 ; myobj.phantram = Utils.getlech(d1: items.d29, d2: items.d30)
        case 31: myobj.thuchien = items.d31 ; myobj.phantram = Utils.getlech(d1: items.d30, d2: items.d31)
            
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
    static func   Myobj2Simple4Linechart( listsource: [MyObj], position:Int) -> [SimpleObj] {
        var listmysimple = [SimpleObj] ()
        
        let obj = listsource[position]
        
      
        if let i1 = Int(obj.d1.replacingOccurrences(of: ",", with: ""))
    {
    listmysimple.append(SimpleObj(t: "1",gt: obj.d1,gti: i1))
        
        }

                if let i2 = Int(obj.d2.replacingOccurrences(of: ",", with: ""))
                {
                    listmysimple.append(SimpleObj(t: "2",gt: obj.d1,gti: i2))
                }
                        if let i3 = Int(obj.d3.replacingOccurrences(of: ",", with: "")) {
                listmysimple.append(SimpleObj(t: "3",gt: obj.d1,gti: i3)) }
                        if let i4 = Int(obj.d4.replacingOccurrences(of: ",", with: "")) {
                listmysimple.append(SimpleObj(t: "4",gt: obj.d1,gti: i4)) }
                        if let i5 = Int(obj.d5.replacingOccurrences(of: ",", with: "")) {
                listmysimple.append(SimpleObj(t: "5",gt: obj.d1,gti: i5)) }
                        if let i6 = Int(obj.d6.replacingOccurrences(of: ",", with: "")) {
                listmysimple.append(SimpleObj(t: "6",gt: obj.d1,gti: i6)) }
                        if let i7 = Int(obj.d7.replacingOccurrences(of: ",", with: "")) {
                listmysimple.append(SimpleObj(t: "7",gt: obj.d1,gti: i7)) }
                        if let i8 = Int(obj.d8.replacingOccurrences(of: ",", with: "")) {
                listmysimple.append(SimpleObj(t: "8",gt: obj.d1,gti: i8)) }
                        if let i9 = Int(obj.d9.replacingOccurrences(of: ",", with: "")) {
                listmysimple.append(SimpleObj(t: "9",gt: obj.d1,gti: i9)) }
                        if let i10 = Int(obj.d10.replacingOccurrences(of: ",", with: "")) {
                listmysimple.append(SimpleObj(t: "10",gt: obj.d1,gti: i10)) }
                        if let i11 = Int(obj.d11.replacingOccurrences(of: ",", with: "")) {
                listmysimple.append(SimpleObj(t: "11",gt: obj.d1,gti: i11)) }
                if let i12 = Int(obj.d12.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "12",gt: obj.d1,gti: i12)) }
                if let i13 = Int(obj.d13.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "13",gt: obj.d1,gti: i13)) }
                if let i14 = Int(obj.d14.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "14",gt: obj.d1,gti: i14)) }
                if let i15 = Int(obj.d15.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "15",gt: obj.d1,gti: i15)) }
                if let i16 = Int(obj.d16.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "16",gt: obj.d1,gti: i16)) }
                if let i17 = Int(obj.d17.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "17",gt: obj.d1,gti: i17)) }
                if let i18 = Int(obj.d18.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "18",gt: obj.d1,gti: i18)) }
                if let i19 = Int(obj.d19.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "19",gt: obj.d1,gti: i19)) }
                if let i20 = Int(obj.d20.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "20",gt: obj.d1,gti: i20)) }
                if let i21 = Int(obj.d21.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "21",gt: obj.d1,gti: i21)) }
                if let i22 = Int(obj.d22.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "22",gt: obj.d1,gti: i22)) }
                if let i23 = Int(obj.d23.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "23",gt: obj.d1,gti: i23)) }
                if let i24 = Int(obj.d24.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "24",gt: obj.d1,gti: i24)) }
                if let i25 = Int(obj.d25.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "25",gt: obj.d1,gti: i25)) }
                if let i26 = Int(obj.d26.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "26",gt: obj.d1,gti: i26)) }
                if let i27 = Int(obj.d27.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "27",gt: obj.d1,gti: i27)) }
                if let i28 = Int(obj.d28.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "28",gt: obj.d1,gti: i28)) }
                if let i29 = Int(obj.d29.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "29",gt: obj.d1,gti: i29)) }
                if let i30 = Int(obj.d30.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "30",gt: obj.d1,gti: i30)) }
                if let i31 = Int(obj.d31.replacingOccurrences(of: ",", with: "")) {
                    listmysimple.append(SimpleObj(t: "31",gt: obj.d1,gti: i31)) }

        
        return listmysimple
    }
}
