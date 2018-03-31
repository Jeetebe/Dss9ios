// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

struct TinhObj: Codable {
    let tinhInfo: [TinhInfo]
    let success: Bool
}

struct TinhInfo: Codable {
    let idTinh: Int
    let codeTinh : String
    let tenTinh: String
    let flag: Bool

    public init(idTinh: Int, codeTinh : String, tenTinh: String, flag: Bool) {
        self.idTinh = idTinh
        self.codeTinh  = codeTinh
        self.tenTinh = tenTinh
        self.flag = flag
    }

    
    
    enum CodingKeys: String, CodingKey {
        case idTinh = "id_tinh"
        case codeTinh = "code_tinh"
        case tenTinh = "ten_tinh"
        case flag
    }
}

// MARK: Convenience initializers

extension TinhObj {
    init(data: Data) throws {
        self = try JSONDecoder().decode(TinhObj.self, from: data)
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

extension TinhInfo {
    init(data: Data) throws {
        self = try JSONDecoder().decode(TinhInfo.self, from: data)
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

