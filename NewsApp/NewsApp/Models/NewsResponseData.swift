struct News: Codable {
    var title: String
    var time: String
    var url: String
    var type: Int
    var photoUrl: String
    var photoAlt: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case url = "Url"
        case type = "Type"
        case photoUrl = "PhotoUrl"
        case photoAlt = "PhotoAlt"
    }
}

struct NewsResponseData: Codable {
    var list: [News]
    enum CodingKeys: String, CodingKey {
        case list = "List"
    }
}



