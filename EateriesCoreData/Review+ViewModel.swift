//
//  Review+ViewModel.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import Foundation

extension Review {
    // Non-optional ViewModel name property
    var reviewerString: String {
        get { reviewer ?? "" }
        set { reviewer = newValue}
    }
    var commentString: String {
        get { comment ?? "" }
        set { comment = newValue}
    }
}
