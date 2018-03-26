// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

struct BcvlObj: Codable {
    let success: Bool
    let bcvlrInfo: [BcvlrInfo]
}

struct BcvlrInfo: Codable {
    let nam, thang, mucquyen, istrungtam: Int
    let quy, thangTruoc, namTruoc: Int
    let tenNhom, loaibc: String
    let isSum: Int
    let soLieuTongHopLuc: String
    let stt: Int
    let donVi: String
    let dvt: String
    let groupName: String
    let keHoachThang, thucHienThang, phanTramThucHienThang, keHoachQuy: String
    let thucHienQuy, phanTramThucHienQuy: String
    let keHoachNam: String
    let thucHienNam: String
    let phanTramThucHienNam: String
    let ssBqThangHienTai: String
    let ssBqThangTruoc, ssBqTocDoTangThangHienTai, ssBqThangNamHienTai, ssBqThangNamTruoc: String
    let ssBqTocDoTangThangNamTruoc, ssBqLuykeNamHienTai, ssBqLuykeNamTruoc, ssBqLuykeTocDoTangTruong: String
    let ssBqNamHienTai, ssBqNamTruoc, ssBqTocDoTangTruong, idx: String
    let ngaylk: Int
    let ngaytao: String
    let chitieu, thThangVebieudo, tenvebieudo, strThang: String
    let maxdata, d1, d2, d3: String
    let d4, d5, d6, d7: String
    let d8, d9, d10, d11: String
    let d12, d13, d14, d15: String
    let d16, d17, d18, d19: String
    let d20, d21, d22, d23: String
    let d24, d25, d26, d27: String
    let d28, d29, d30, d31: String
    let tbLktTruocCungky, ssTBLktTruocCungky: String
    
    enum CodingKeys: String, CodingKey {
        case nam, thang, mucquyen, istrungtam, quy
        case thangTruoc = "thang_truoc"
        case namTruoc = "nam_truoc"
        case tenNhom = "ten_nhom"
        case loaibc
        case isSum = "is_sum"
        case soLieuTongHopLuc = "so_lieu_tong_hop_luc"
        case stt
        case donVi = "don_vi"
        case dvt
        case groupName = "group_name"
        case keHoachThang = "ke_hoach_thang"
        case thucHienThang = "thuc_hien_thang"
        case phanTramThucHienThang = "phan_tram_thuc_hien_thang"
        case keHoachQuy = "ke_hoach_quy"
        case thucHienQuy = "thuc_hien_quy"
        case phanTramThucHienQuy = "phan_tram_thuc_hien_quy"
        case keHoachNam = "ke_hoach_nam"
        case thucHienNam = "thuc_hien_nam"
        case phanTramThucHienNam = "phan_tram_thuc_hien_nam"
        case ssBqThangHienTai = "ss_bq_thang_hien_tai"
        case ssBqThangTruoc = "ss_bq_thang_truoc"
        case ssBqTocDoTangThangHienTai = "ss_bq_toc_do_tang_thang_hien_tai"
        case ssBqThangNamHienTai = "ss_bq_thang_nam_hien_tai"
        case ssBqThangNamTruoc = "ss_bq_thang_nam_truoc"
        case ssBqTocDoTangThangNamTruoc = "ss_bq_toc_do_tang_thang_nam_truoc"
        case ssBqLuykeNamHienTai = "ss_bq_luyke_nam_hien_tai"
        case ssBqLuykeNamTruoc = "ss_bq_luyke_nam_truoc"
        case ssBqLuykeTocDoTangTruong = "ss_bq_luyke_toc_do_tang_truong"
        case ssBqNamHienTai = "ss_bq_nam_hien_tai"
        case ssBqNamTruoc = "ss_bq_nam_truoc"
        case ssBqTocDoTangTruong = "ss_bq_toc_do_tang_truong"
        case idx, ngaylk, ngaytao, chitieu
        case thThangVebieudo = "th_thang_vebieudo"
        case tenvebieudo
        case strThang = "str_thang"
        case maxdata, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31
        case tbLktTruocCungky = "tb_lkt_truoc_cungky"
        case ssTBLktTruocCungky = "ss_tb_lkt_truoc_cungky"
    }
}

enum D24: String, Codable {
    case empty = "-"
}



enum GroupName: String, Codable {
    case empty = ""
}

enum KeHoachNam: String, Codable {
    case the0 = "0"
}



enum PhanTramThucHienNam: String, Codable {
    case the000 = "0.00%"
}

// MARK: Convenience initializers

extension BcvlObj {
    init(data: Data) throws {
        self = try JSONDecoder().decode(BcvlObj.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension BcvlrInfo {
    init(data: Data) throws {
        self = try JSONDecoder().decode(BcvlrInfo.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

