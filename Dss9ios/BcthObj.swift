// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

struct BcthObj: Codable {
    let success: Bool
    let bcthInfo: [BcthInfo]
}

struct BcthInfo: Codable {
    let nam, thang, mucquyen, istrungtam: Int
    let quy, thangTruoc, namTruoc: Int
    let tenNhom: String
    let loaibc, isSum: Int
    let uocTinhCkn, uocTinhGiamTru: String
    let soLieuTongHopLuc: String
    let stt: Int
    let donVi: String
    let dvt: String
    let groupName, keHoachThang, thucHienThang, phanTramThucHienThang: String
    let keHoachQuy, thucHienQuy, phanTramThucHienQuy, keHoachNam: String
    let thucHienNam, phanTramThucHienNam: String
    let ssBqThangHienTai: String
    let ssBqThangTruoc, ssBqTocDoTangThangHienTai, ssBqThangNamHienTai, ssBqThangNamTruoc: String
    let ssBqTocDoTangThangNamTruoc, ssBqLuykeNamHienTai, ssBqLuykeNamTruoc, ssBqLuykeTocDoTangTruong: String
    let ssBqNamHienTai, ssBqNamTruoc, ssBqTocDoTangTruong, idx: String
    let ngaylk: Int
    let tbLktTruocCungky, ssTBLktTruocCungky: String
    let ngaytao: String
    let chitieu: String
    
    enum CodingKeys: String, CodingKey {
        case nam, thang, mucquyen, istrungtam, quy
        case thangTruoc = "thang_truoc"
        case namTruoc = "nam_truoc"
        case tenNhom = "ten_nhom"
        case loaibc
        case isSum = "is_sum"
        case uocTinhCkn = "uoc_tinh_ckn"
        case uocTinhGiamTru = "uoc_tinh_giam_tru"
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
        case idx, ngaylk
        case tbLktTruocCungky = "tb_lkt_truoc_cungky"
        case ssTBLktTruocCungky = "ss_tb_lkt_truoc_cungky"
        case ngaytao, chitieu
    }
}

enum Dvt: String, Codable {
    case erl = "Erl"
    case mbNgày = "Mb/ngày"
    case thuêBao = "Thuê bao"
    case triệuĐồng = "Triệu đồng"
}
enum Ngaytao: String, Codable {
    case the040024032018 = "04:00 24/03/2018"
    case the070424032018 = "07:04 24/03/2018"
    case the072124032018 = "07:21 24/03/2018"
    case the072224032018 = "07:22 24/03/2018"
}

enum SoLieuTongHopLuc: String, Codable {
    case empty = ""
}

enum UocTinh: String, Codable {
    case the0 = "0"
}


// MARK: Convenience initializers

extension BcthObj {
    init(data: Data) throws {
        self = try JSONDecoder().decode(BcthObj.self, from: data)
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

extension BcthInfo {
    init(data: Data) throws {
        self = try JSONDecoder().decode(BcthInfo.self, from: data)
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

