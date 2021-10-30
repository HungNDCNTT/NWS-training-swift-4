//
//  ViewController.swift
//  NwsTrainingSwift4
//
//  Created by Nguyen Hung on 30/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat","Horse", "Cow", "Camel", "Sheep", "Goat","Horse", "Cow", "Camel", "Sheep", "Goat","Horse", "Cow", "Camel", "Sheep", "Goat","Horse", "Cow", "Camel", "Sheep", "Goat"]
    
   
    let cellReuseIdentifier = "cell"
    override func viewDidLoad() {
           super.viewDidLoad()
           self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
           tableView.delegate = self
           tableView.dataSource = self
       }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{

       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.animals.count
       }
       
     
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
          
           let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier,for: indexPath)
           
        
           cell.textLabel?.text = self.animals[indexPath.row]
           
           if(indexPath.row % 2 == 0){
               cell.backgroundColor = .green
           }else {
               cell.backgroundColor = .yellow
           }
           
           return cell
       }
       
    
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           showDialog(message: "Hello I'm \(self.animals[indexPath.row])")
       }
    func showDialog (message:String){
        let alert = UIAlertController(title: "Alert", message: message , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

