//
//  Fetch.swift
//  verycomplicatedui
//
//  Created by thatartplace on 2019-05-08.
//  Copyright © 2019 thatartplace. All rights reserved.
//

import Foundation

typealias FetchResponseHandler = (Response) -> Void

struct Response {
    var status: Int
    var statusText: String
}

struct Fetch {
    enum Status {
        case invalid
        case fetching
        case success
        case error
    }
    
    var status = Status.invalid
    var urlSession = URLSession.shared
}

extension URL {
}
