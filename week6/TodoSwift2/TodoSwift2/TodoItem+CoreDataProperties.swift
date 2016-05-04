//
//  TodoItem+CoreDataProperties.swift
//  TodoSwift2
//
//  Created by 張 景隆 on 2015/11/14.
//  Copyright © 2015年 張 景隆. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension TodoItem {

    @NSManaged var name: String?

}
