//
//  FirstTableViewController.swift
//  LaundryApp
//
//  Created by Jonathan on 5/15/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//  This file is for assigning values for participants waiting in line for laundry.

import UIKit

class FirstTableViewController: UITableViewController {
    
    var participants = [Laundry]()
    var listOfTime = ["8:00 - 10:00",
                      "10:00 - 12:00",
                      "12:00 - 14:00",
                      "14:00 - 16:00",
                      "16:00 - 18:00",
                      "18:00 - 20:00"]
    // provide a list of time for the app to randomly pick from it
    
    override func viewDidLoad() {
        super.viewDidLoad()
        participants = [Laundry(name: "Jonathan", time: randomTime()),
                        Laundry(name: "John", time: randomTime()),
                        Laundry(name: "Shrute", time: randomTime()),
                        Laundry(name: "Jack", time: randomTime()),
                        Laundry(name: "Jimothy", time: randomTime())]
        // the list of people who are in line laundry

        self.clearsSelectionOnViewWillAppear = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        // the app will always start with one section, if there is no input
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participants.count
        // the actual sections will correspond to the number of people
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonInfo", for: indexPath)

        cell.textLabel?.text = participants[indexPath.row].name
        // make the text in each section correspond to the name of people in line for laundry
        return cell
    }
    
    func randomTime() -> String {
        let luckyTime = listOfTime.randomElement()!
        // randomly select a time for laundry for one person
        let place = listOfTime.firstIndex(of: luckyTime)
        // let the program know what index number the time has in the arrays of time
        listOfTime.remove(at: (place)!)
        // remove the time from the list
        return luckyTime
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the array to the final view controller.
        let destinationViewController = segue.destination as! FinalTableViewController
        destinationViewController.result = participants
    }
 

}
