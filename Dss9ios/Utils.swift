

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
}
