//
//  CoreDataListItem+CoreDataProperties.swift
//  idm362-thd44
//
//  Created by Ty Drake on 3/1/23.
//
//

import Foundation
import CoreData


extension CoreDataListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataListItem> {
        return NSFetchRequest<CoreDataListItem>(entityName: "CoreDataListItem")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var name: String?

}

extension CoreDataListItem : Identifiable {

}
