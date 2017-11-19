//
//  DataModel.swift
//  171116_NetworkTest
//
//  Created by SIMA on 2017. 11. 17..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import Foundation

struct PostModel: Codable {
    var content: String
    var title: String
    var imgCoverUrl: String?
    
//    init?(json : [String: Any]) {
//        guard let content = json["content"] as? String else { return nil }
//        self.content = content
//        guard let title = json["title"] as? String else { return nil }
//        self.title = title
//        guard let imgCover = json["img_cover"] as? String else { return nil }
//        self.imgCoverUrl = imgCover
//    }
    
    var param:[String: String] {
        return ["title": title, "content": content]
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case content = "content"
        case imgCoverUrl = "img_cover"
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        title = try container.decode(String.self, forKey: .title)
//        content = try container.decode(String.self, forKey: .content)
//        imgCoverUrl = try container.decode(String.self, forKey: .imgCoverUrl)
//    }
//    
//    //    //encoding
//    func encode(to encoder: Encoder) throws
//    {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(title, forKey: .title)
//        try container.encode(content, forKey: .content)
//    }
}
