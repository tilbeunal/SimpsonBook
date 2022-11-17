//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Tilbe Ünal on 9.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
   
    var mySimpson = [Simpson] ()
    var chosenSimpson : Simpson?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety", simpsonImage: UIImage(named: "homer")!)
        let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "Housewife", simpsonImage: UIImage(named: "marge")!)
        let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "bart")!)
        let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "lisa")!)
        let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "Baby", simpsonImage: UIImage(named: "maggie")!)
        
        mySimpson.append(homer)
        mySimpson.append(marge)
        mySimpson.append(bart)
        mySimpson.append(lisa)
        mySimpson.append(maggie)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell ()
        cell.textLabel?.text = mySimpson[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpson[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }

  
}

