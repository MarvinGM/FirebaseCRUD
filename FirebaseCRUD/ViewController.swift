//
//  ViewController.swift
//  FirebaseCRUD
//
//  Created by Amben on 6/24/21.
//
import Firebase
import UIKit

class ViewController: UIViewController {
    
    private let database = Database.database().reference()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        database.child("Something").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                return
            }
            print("Value: \(value)")
        })
        
        
        
        let button = UIButton(frame: CGRect(x: 20,
                                            y: 200,
                                            width: view.frame.size.width-40,
                                            height: 50))
        
        button.setTitle("Add Entry", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        view.addSubview(button)
        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
        
        
    }
    
    @objc private func addNewEntry() {
        let object: [String: Any] = [
            "name": "Marvin" as NSObject,
            "youtube": "Yes"
        ]
        database.child("Something_\(Int.random(in: 0..<100))").setValue(object)
    }


}

