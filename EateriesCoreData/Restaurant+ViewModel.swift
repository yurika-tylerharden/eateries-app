//
//  Restaurant+ViewModel.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import Foundation

extension Restaurant {
    // Non-optional ViewModel name property
    var nameString: String {
        get { name ?? "" }
        set { name = newValue}
    }
    
}
