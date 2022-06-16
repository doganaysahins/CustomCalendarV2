//
//  PetInformationViewModel.swift
//  Petwatch
//
//  Created by Doğanay Şahin on 22.04.2022.
//

import Foundation
import CoreData
import UIKit

class TodoInformationViewModel : ObservableObject {
    @Published var title : String = " "
    @Published var desc : String = " "
    @Published var date : Date = Date()
    @Published var reminder : Bool = false
//    @Published var red : Double = 0
//    @Published var green : Double = 0
//    @Published var blue : Double = 0
//    @Published var alpha : Double = 0

    @Published var tasks: [TodoInfo] = []
    
    
    
    func getAllTasks() {
        tasks = CoreDataManager.shared.getAllInformation().map(TodoInfo.init)
    }
    
    
    func getOnlyDate(date : Date){
        tasks = tasks.filter { task in
            return task.date == date
        }
    }
    
    
    func delete(_ task: TodoInfo) {

        let existingTask = CoreDataManager.shared.getInfoById(id: task.id)
        if let existingTask = existingTask {
            CoreDataManager.shared.deleteInfo(task: existingTask)
        }
    }
    
    func save(date : Date) {
        
        let task = ListItems(context: CoreDataManager.shared.viewContext)
        task.title = title
        task.date = date
        task.reminder = reminder
        task.desc = desc
//        task.red = red
//        task.green = green
//        task.blue = blue
//        task.alpha = alpha
//        task.imagePet = imgPet?.jpegData(compressionQuality: 0.5)
        
        print(title, date, reminder)

        CoreDataManager.shared.save()
    }
    
    
}
