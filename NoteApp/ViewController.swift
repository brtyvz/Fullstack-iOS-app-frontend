//
//  ViewController.swift
//  NoteApp
//
//  Created by Berat Yavuz on 25.12.2022.
//

import UIKit

protocol DataDelegate {
    func updateArray (newArray:String)
}

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddNoteViewController
        if segue.identifier == "updateNoteSegue" {
            vc.note = notesArray[noteTableView.indexPathForSelectedRow!.row]
            vc.update = true
        }
    }
    
    
    var notesArray = [Note]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath) as! NotePrototypeCell
        cell.TitleLbl.text = notesArray[indexPath.row].title
        cell.BodyLbl.text = notesArray[indexPath.row].note
        cell.dateLbl.text = notesArray[indexPath.row].date
//        cell.textLabel?.text = notesArray[indexPath.row].title
        return cell
    }
    

    @IBOutlet weak var noteTableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        APIService.functions.fetchNotes()
    }
    override func viewDidAppear(_ animated: Bool) {
        APIService.functions.fetchNotes()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        APIService.functions.delegate = self
        APIService.functions.fetchNotes()
       
        noteTableView.delegate = self
        noteTableView.dataSource = self
    }


}

extension ViewController:DataDelegate {
    
    func updateArray(newArray: String) {
        do {
            notesArray = try JSONDecoder().decode([Note].self, from: newArray.data(using: .utf8)!)
            print(notesArray)
        } catch  {
            print("failed")
        }
        self.noteTableView?.reloadData()
    }
       
}
