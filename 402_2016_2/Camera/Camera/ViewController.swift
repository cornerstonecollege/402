//
//  ViewController.swift
//  Camera
//
//  Created by Luiz on 2016-11-15.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: Session.AudioString)
        
        if Session.imageData != nil {
            self.imgView.contentMode = UIViewContentMode.scaleAspectFit
            let image = UIImage(data: Session.imageData!)
            self.imgView.image = UIImage(cgImage: (image?.cgImage)!, scale: 1.0, orientation: UIImageOrientation(rawValue: Session.imageOrientation!)!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePic(_ sender: Any) {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.sourceType = .camera
        present(imgPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imgView.contentMode = UIViewContentMode.scaleAspectFit
            self.imgView.image = img
            let data = UIImagePNGRepresentation(img)
            UserDefaults.standard.set(data, forKey: Session.ImageString)
             UserDefaults.standard.set(img.imageOrientation.rawValue, forKey: Session.ImageOrientationString)
        }
        
        dismiss(animated: true, completion: nil)
    }
}

