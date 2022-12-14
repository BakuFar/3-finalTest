//
//  ViewController.swift
//  3-finalTest
//
//  Created by Фархат Сталбек уулу on 14/12/22.
//

import UIKit


var note: [String] = []

class ViewController: UIViewController {
   
    
    
    @IBOutlet weak var notesTableView: UITableView!
    @IBAction func addNewNoteButton(_ sender: Any) {
        let alert = UIAlertController(title: "New note", message: "Do you want add new note?", preferredStyle: .alert)
        var textField = UITextField()
        alert.addTextField { alertTextField in
            textField = alertTextField
            
        }
        let yesAction = UIAlertAction(title: "YES", style: .cancel) { action in ()
            if textField.text == "" {
                note.insert("Empty Note!", at: 0)
            }
            else {
                note.insert(textField.text!, at: 0)
            }
            
            self.notesTableView.reloadData()
        }
        let noAction = UIAlertAction(title: "NO", style: .destructive) { action in ()
            
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return note.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as! NoteTableViewCell
        
        cell.noteTextLabel.text = note[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
}
class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var noteImageImageView: UIImageView!
    @IBOutlet weak var noteTextLabel: UILabel!
    
    var done: Bool = false
    override func layoutSubviews() {
        if done == false {
            noteImageImageView.image = UIImage(systemName: "square")
        }
        else {
            noteImageImageView.image = UIImage(systemName: "checkmark.square")
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(taskDone))
        noteImageImageView.addGestureRecognizer(tap)
        
    }
    @objc func taskDone() {
        if done == false {
            noteImageImageView.image = UIImage(systemName: "checkmark.square")
            done = true
        }
        else {
            noteImageImageView.image = UIImage(systemName: "square")
            done = false
        }
    }
}
