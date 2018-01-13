//
//  PostDataVC.swift
//  Kmong
//
//  Created by Eunseok on 2018. 1. 13..
//  Copyright © 2018년 Eunseok. All rights reserved.
//

import UIKit
import Firebase

class PostDataVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var images: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var downloadURL: String = ""
    var ImageName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(PostDataVC.handleTap))
        view.addGestureRecognizer(tap)
        imagePicker.delegate = self
        
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    @IBAction func imageBtnPressed(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let img = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
        self.images.image = img
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postDataBtnPressed(_ sender: Any) {
        if images.image != nil && priceText.text != "" && descriptionText.text != "" {
            let newPostRef = Database.database().reference().child("Service").childByAutoId()
            
            var data = NSData()
            data = UIImageJPEGRepresentation(images.image!, 0.8)! as NSData
            
            let metaData = StorageMetadata()
            metaData.contentType = "image/png"
            self.ImageName = "\(Date().timeIntervalSince1970).png"
            let storageRef = Storage.storage().reference()
            storageRef.child("Images").child(ImageName).putData(data as Data, metadata: metaData){(metaData,error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }else{
                    self.downloadURL = metaData!.downloadURL()!.absoluteString
                }
            }
            
            let newPost = ["description": descriptionText.text!,
                           "imageUrl": ImageName,
                           "seller": (Auth.auth().currentUser?.displayName)!,
                           "price": priceText.text!,
                           "rating": 0,
                           "uid": (Auth.auth().currentUser?.uid)!] as [String : Any]
            newPostRef.updateChildValues(newPost)
            NotificationCenter.default.post(name: Notification.Name("NEW_POST"), object: nil)
            dismiss(animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "사진, 서비스내용, 가격을 확인해주세요",
                                          message: "내용이 없을경우 서비스 등록을 하실수없습니다",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: true)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        descriptionText.resignFirstResponder()
        priceText.resignFirstResponder()
    }
}
