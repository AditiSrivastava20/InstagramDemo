//
//  UserData.swift
//  InstagramTaskDemo
//
//  Created by Sierra 4 on 13/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import Foundation
class firstinfo
{
    var name : String?
   
    var pic : URL?
    var comment : String?
    var displaypic : URL?
    var playvideo : URL?
    var typeofchoice : String?
    


    
    init(name : String? , pic :URL? , comment : String?, displaypic: URL?, playvideo: URL?, typeofchoice: String)
    {
        self.name = name
      
        self.pic = pic
        self.comment = comment
        self.displaypic = displaypic
        self.playvideo = playvideo
        self.typeofchoice = typeofchoice
    
    }
    
}
