//
//  Star.swift
//  ShiningStars
//
//  Created by Jal Irani on 2/28/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import Foundation


class Star {
    
    var fname: String
    var lname: String
    var bio: String
    var heroes: String
    var hobbies: String
    var quote: String
    var url :String
    var type: String
    
    init(fname: String, lname: String, bio: String, heroes: String, hobbies: String, quote: String, url: String, type: String) {
        self.fname = fname
        self.lname = lname
        self.bio = bio
        self.heroes = heroes
        self.hobbies = hobbies
        self.quote = quote
        self.url = url
        self.type = type
    }
}
