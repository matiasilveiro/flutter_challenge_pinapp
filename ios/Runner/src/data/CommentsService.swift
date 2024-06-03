//
//  CommentsService.swift
//  Runner
//
//  Created by Matias Silveiro on 03/06/2024.
//

import Foundation
import Alamofire

class CommentsService {
    static func getCommentsForPost(postId: Int) async -> Any? {
        do {
            let data = try await NetworkManager.shared.get(
                path: "/comments?postId=\(postId)", parameters: nil
            )
            //return try JSONSerialization.jsonObject(with: data)
            return String(data: data, encoding: .utf8)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
