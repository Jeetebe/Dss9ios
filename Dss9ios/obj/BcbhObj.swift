// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

struct BcbhObj: Codable {
    let success: Bool
    let bcbhInfo: [BcbhInfo]
}

struct BcbhInfo: Codable {
    let nam, thang, mucquyen, istrungtam: Int
    let quy, thangTruoc, namTruoc: Int
    let tenNhom, loaibc: String
    let isSum: Int
    let soLieuTongHopLuc: String
    let stt: Int
    let donVi, dvt, groupName, keHoachThang: String
    let thucHienThang, phanTramThucHienThang, keHoachQuy, thucHienQuy: String
    let phanTramThucHienQuy, keHoachNam, thucHienNam, phanTramThucHienNam: String
    let ssBqThangHienTai, ssBqThangTruoc, ssBqTocDoTangThangHienTai, ssBqThangNamHienTai: String
    let ssBqThangNamTruoc, ssBqTocDoTangThangNamTruoc, ssBqLuykeNamHienTai, ssBqLuykeNamTruoc: String
    let ssBqLuykeTocDoTangTruong, ssBqNamHienTai, ssBqNamTruoc, ssBqTocDoTangTruong: String
    let idx: String
    let ngaylk: Int
    let ngaytao, chitieu, thThangVebieudo, tenvebieudo: String
    let strThang, maxdata, d1, d2: String
    let d3, d4, d5, d6: String
    let d7, d8, d9, d10: String
    let d11, d12, d13, d14: String
    let d15, d16, d17, d18: String
    let d19, d20, d21, d22: String
    let d23, d24, d25, d26: String
    let d27, d28, d29, d30: String
    let d31, tbLktTruocCungky, ssTBLktTruocCungky: String
    
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

// MARK: Convenience initializers

extension BcbhObj {
    init(data: Data) throws {
        self = try JSONDecoder().decode(BcbhObj.self, from: data)
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

extension BcbhInfo {
    init(data: Data) throws {
        self = try JSONDecoder().decode(BcbhInfo.self, from: data)
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

