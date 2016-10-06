//
//  TableViewController.swift
//  CustomCellMath
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    //@IBOutlet var tableView: UITableView!
    

      // an array of arrays
    // i.e. [[1, 2, 3, 4], [5, 3, 1, 0], [5, 2, 6, 6]]
    var numbers: [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numbers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "mathCell", for: indexPath) as! MathTableViewCell
    
        var arrayIndex = indexPath.row //indexPath related to each cell and each row in your tableview (grabbing a specific array from the wider array)
        var selectedArray = self.numbers[arrayIndex]
        
        cell.firstNumberLabel.text = String(selectedArray[0]) //wrap in a String property
        //gets each item in the array
        cell.secondNumberLabel.text = String(selectedArray[1])
        cell.thirdNumberLabel.text = String(selectedArray[2])
        cell.fourthNumberLabel.text = String(selectedArray[3])
        
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showMath" {
            var dest = segue.destination as! DisplayMathViewController
            //destination is actually a subclass of the UIView Controller
            
            var selectedNum = tableView.indexPathForSelectedRow?.row
            if let unwrappedRow = selectedNum{
                
                dest.numbers = self.numbers[unwrappedRow]   //talking about the numers in the detailedmathviewcontroller
            }   //numbers for each are from different classes
        
        }
        
    }
    

}



// MARK: - Generating an array of Data
extension TableViewController {
    
    func generateData() {
        for _ in 1...100 {
            var newNumberRow: [Int] = []
            
            for _ in 1...4 {
                let randomNumber = randomNumberFromOneTo(50)
                newNumberRow.append(randomNumber)
            }
            
            numbers.append(newNumberRow)
        }
    }
    
    func randomNumberFromOneTo(_ number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)) + 1)
    }
    
    
}
