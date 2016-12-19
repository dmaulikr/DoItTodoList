//
//  Task.swift
//  DoIt
//
//  Created by Remus Victuelles on 18/12/16.
//  Copyright © 2016 Noypi Dev. All rights reserved.
//

import Foundation

class Task {
    
    var _name = "", _important = false
    
    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    var important: Bool {
        get {
            return _important
        }
        set {
            _important = newValue
        }
    }
}
