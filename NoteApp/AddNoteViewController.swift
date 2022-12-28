//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by Berat Yavuz on 26.12.2022.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    var note:Note?
    
    var update = false 
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var deleteBtn: UIBarButtonItem!
    
    
    
    
    @IBAction func deleteButton(_ sender: Any) {
      
            APIService.functions.deleteNote(id: note!._id)
        self.navigationController?.popViewController(animated: true)
       
    }
    @IBAction func saveClick(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: Date())
        
        if update == true{
            APIService.functions.updateNote(date: date, note: bodyTextView.text, title: titleTextField.text!, id: note!._id)
            self.navigationController?.popViewController(animated: true)
        }
        
        else if (titleTextField.text != "" && bodyTextView.text != "") {
                APIService.functions.createNote(date: date, title: titleTextField.text!, note: bodyTextView.text)
            self.navigationController?.popViewController(animated: true)
        }
            

        
       
      
    }
    override func viewWillAppear(_ animated: Bool) {
        if update == false {
            self.deleteBtn.isEnabled = false
            self.deleteBtn.title = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if update == true {
            titleTextField.text = note?.title
            bodyTextView.text = note?.note
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
