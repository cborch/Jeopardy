//
//  Clues.swift
//  JeopardyTrainer
//
//  Created by Carter Borchetta on 12/16/19.
//  Copyright © 2019 Carter Borchetta. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Clues {
    var id = 0
    var cluesCount = 0
    var clueArray: [Clue] = []
    var apiURL = "http://jservice.io/api/category/?id="
    
    func getData(completed: @escaping () -> ()) {
        Alamofire.request(apiURL+"\(id)").responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("clues json \(json)")
                
                let numberOfClues = json["clues"].count
                for index in 0..<numberOfClues {
                    let clue = Clue()
                    clue.question = json["clues"][index]["question"].stringValue
                    clue.answer = json["clues"][index]["answer"].stringValue
                    clue.categoryID = json["clues"][index]["category_id"].intValue
                    clue.value = json["clues"][index]["value"].intValue
                    clue.clueID = json["clues"][index]["id"].intValue
                    
                    self.clueArray.append(clue)
                    print(self.clueArray[index].question)
                }
//                let numberOfCategories = json.count
//                for index in 0..<numberOfCategories {
//                    let id = json[index]["id"].intValue
//                    let title = json[index]["title"].stringValue
//                    let cluesCount = json[index]["clues_count"].intValue
//
//                    self.categoryArray.append(Category(id: id, title: title, cluesCount: cluesCount))
//                    print("\(id), \(title), \(cluesCount)")
//                }
                
                
            case .failure(let error):
                print("Error: failed to get data from URL \(self.apiURL), error \(error.localizedDescription)")
            }
            completed()
        }
    }
}
