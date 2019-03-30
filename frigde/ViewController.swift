//
//  ViewController.swift
//  frigde
//
//  Created by Tony Liao on 2019/3/29.
//  Copyright © 2019 GreatLL. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photo: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
        }
        else {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
        }
        
    
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photo.image = userPickedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
        
    }
}

