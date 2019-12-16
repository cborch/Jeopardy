//
//  Category.swift
//  JeopardyTrainer
//
//  Created by Carter Borchetta on 12/16/19.
//  Copyright © 2019 Carter Borchetta. All rights reserved.
//

import Foundation

class Category {
    var id: Int
    var title: String
    var cluesCount: Int
    
    init(id: Int, title: String, cluesCount: Int) {
        self.id = id
        self.title = title
        self.cluesCount = cluesCount
    }
}
