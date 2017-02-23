//
//  Secondinfo+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 20/02/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Secondinfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Secondinfo> {
        return NSFetchRequest<Secondinfo>(entityName: "Secondinfo");
    }

    @NSManaged public var dp: String?
    @NSManaged public var username: String?
    @NSManaged public var usercomment: String?

}
