//
//  Restaurant+ViewModel.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import Foundation
import UIKit
extension Restaurant {
    // Non-optional ViewModel name property
    var nameString: String {
        get { name ?? "" }
        set { name = newValue}
    }
    var locationString: String {
        get { location ?? "" }
        set { location = newValue}
    }
    var notesString: String {
        get { notes ?? "" }
        set { notes = newValue}
    }
    
    var imageURL: UIImage {
        let emptyImage = UIImage(named: "placeholder")!
        if image == "" {
            return emptyImage

        }
        guard let url = URL(string: image!) else {
            return emptyImage
        }
        guard let data = try? Data(contentsOf: url) else {
            return emptyImage
        }
        guard let uiImage = UIImage(data: data) else {
            return UIImage()
        }
        return uiImage
    }
}
