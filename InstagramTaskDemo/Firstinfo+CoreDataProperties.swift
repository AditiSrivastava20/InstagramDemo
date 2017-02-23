//
//  Firstinfo+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 20/02/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Firstinfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Firstinfo> {
        return NSFetchRequest<Firstinfo>(entityName: "Firstinfo");
    }

    @NSManaged public var id: String?
    @NSManaged public var feedpic: String?
    @NSManaged public var likes: Int64

}
