//
//  ToDoModel.swift
//  CustomDatePickerDemo
//
//  Created by Doğanay Şahin on 14.05.2022.
//

import Foundation
import CoreData

struct TodoInfo{
    
    let info : ListItems
    
    var id : NSManagedObjectID {
        return info.objectID
    }
    
    var title : String{
        return info.title ?? " "
    }
    var desc : String{
        return info.desc ?? ""
    }
    
    var date : Date{
        return info.date ?? Date()
    }
    
    var reminder : Bool{
        return info.reminder 
    }

}
