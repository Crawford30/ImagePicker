//
//  ViewController.swift
//  ImagePicker
//
//  Created by JOEL CRAWFORD on 4/28/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    


    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func choosePhoto(_ sender: UIButton) {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        
        //giving the user a choice either librabry or camera
        
        //we use action sheet
        
        
        let actionShhet = UIAlertController(title: "Photo source", message: "Choose a source", preferredStyle: .actionSheet)
        
        
        
        actionShhet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            
            //check if camera is avaliable
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                //present this if avaliabel
                
                imagePickerController.sourceType = .camera
                           
                           self.present(imagePickerController, animated: true, completion: nil)
                
            }
            
            else {
                print("Camera isnt avaliable! or isnt working")
            }
            
            
           
           
        }))
        
        
        
        
        
             actionShhet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
                
                
                imagePickerController.sourceType = .photoLibrary
                
                self.present(imagePickerController, animated: true, completion: nil)
                
             }))
        
        
        
             actionShhet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionShhet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       //since its a dictionary we use a key to retrieve it
        
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        imageView.image = image
        
        //then we dismiss after selecting a photo
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    


}

