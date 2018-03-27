// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

struct User: Codable {
    let success: Bool
    let userInfo: UserInfo
}

struct UserInfo: Codable {
    let userID: Int
    let username, password, tendangnhap: String
    let mucquyen, istrungtam, msphongban, permissionXemCV: Int
    let permissionDBL, permissionBC, permissionSL, permissionNL: Int
    let permissionNHIENLIEUDIEN, permissionXemCVTuDong, permissionDanhGiaNV, permissionSoLieuBcclml: Int
    let permissionConfig, permissionLuong, rcheckSmartphoneID, isAdmin: Int
    let msbophan, trangthai: Int
    let tenphongban: String
    let permissionBCChiPhi: Int
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case username, password, tendangnhap, mucquyen, istrungtam, msphongban
        case permissionXemCV = "Permission_XemCV"
        case permissionDBL = "Permission_DBL"
        case permissionBC = "Permission_BC"
        case permissionSL = "Permission_SL"
        case permissionNL = "Permission_NL"
        case permissionNHIENLIEUDIEN = "Permission_NHIEN_LIEU_DIEN"
        case permissionXemCVTuDong = "Permission_XemCV_TuDong"
        case permissionDanhGiaNV = "Permission_Danh_Gia_NV"
        case permissionSoLieuBcclml = "Permission_SoLieu_bcclml"
        case permissionConfig = "Permission_Config"
        case permissionLuong = "Permission_Luong"
        case rcheckSmartphoneID = "rcheck_smartphone_id"
        case isAdmin = "is_admin"
        case msbophan, trangthai, tenphongban
        case permissionBCChiPhi = "Permission_BC_ChiPhi"
    }
}

// MARK: Convenience initializers

extension User {
    init(data: Data) throws {
        self = try JSONDecoder().decode(User.self, from: data)
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

extension UserInfo {
    init(data: Data) throws {
        self = try JSONDecoder().decode(UserInfo.self, from: data)
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

