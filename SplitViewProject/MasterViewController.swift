//
//  MasterViewController.swift
//  SplitViewProject
//
//  Created by shan jiang on 2017-06-19.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import UIKit

// This defines a protocol with a single method monsterSelected(). The detail view controller side will implement this method, and the master view controller will accept a delegate of an object which wants to know about this
protocol MonsterSelectionDelegate: class {
    func monsterSelected(_ newMonster: Monster)
}

class MasterViewController: UITableViewController {
    
    var monsters = [Monster]()
    // This means that the delegate property is required to be an object that has selectedMonster() implemented. That object will be responsible for handling what needs to happen within its view after the monster was selected
    weak var delegate: MonsterSelectionDelegate?

    // This initializer will set up the array of monsters. Note that you are implementing init(coder:) because this class is being loaded from a storyboard.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.monsters.append(Monster(name: "Cat-Bot", description: "MEE-OW",
                                     iconName: "meetcatbot.png", weapon: Weapon.Sword))
        self.monsters.append(Monster(name: "Dog-Bot", description: "BOW-WOW",
                                     iconName: "meetdogbot.png", weapon: Weapon.Blowgun))
        self.monsters.append(Monster(name: "Explode-Bot", description: "BOOM!",
                                     iconName: "meetexplodebot.png", weapon: Weapon.Smoke))
        self.monsters.append(Monster(name: "Fire-Bot", description: "Will Make You Stamed",
                                     iconName: "meetfirebot.png", weapon: Weapon.NinjaStar))
        self.monsters.append(Monster(name: "Ice-Bot", description: "Has A Chilling Effect",
                                     iconName: "meeticebot.png", weapon: Weapon.Fire))
        self.monsters.append(Monster(name: "Mini-Tomato-Bot", description: "Extremely Handsome",
                                     iconName: "meetminitomatobot.png", weapon: Weapon.NinjaStar))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.monsters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let monster = self.monsters[indexPath.row]
        cell.textLabel?.text = monster.name
        
        return cell
    }
 
    // This will notified whenever the user selectes a row in the table view. all you need to do is notify the monster selection delegate of the new monster.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMonster = self.monsters[indexPath.row]
        self.delegate?.monsterSelected(selectedMonster)
        // Make sure the delegate is set and that it is a DetailViewController instance as you expected. Call showDetailViewController() on the split view controller and pass in the detail view controller. Every subclass of UIViewControoler has an inherited property splitViewController. which will refer to the split view controller the view controller is in. if one existed.
        if let detailViewController = self.delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }

}
