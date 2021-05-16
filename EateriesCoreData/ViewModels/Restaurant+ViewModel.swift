//
//  Restaurant+ViewModel.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import Foundation
import UIKit
import CoreData

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
    var imageString: String {
        get { image ?? "" }
        set { image = newValue}
    }
    
    var imageURL: UIImage {
        let emptyImage = UIImage(named: "placeholder")!
        if image == "" {
            return emptyImage

        }
        guard let url = URL(string: image ?? "") else {
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
    
    var reviewArray: [Review] {
        // ViewModel computed property that returns restaurants as array
        get { review?.array as? [Review] ?? []}
        set { review = NSOrderedSet(array: newValue) }
    }
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    func addItem() {
        let newReview = Review(context: viewContext)
        newReview.reviewer = "New review"
        addToReview(newReview)
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    func deleteItems(offsets: IndexSet) {
        offsets.map { reviewArray[$0] }.forEach(viewContext.delete)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
