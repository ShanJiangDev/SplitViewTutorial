//
//  DetailViewController.swift
//  SplitViewProject
//
//  Created by shan jiang on 2017-06-19.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var weaponImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // Whenever you switch the monster, you will want the UI to refresh itself and update the details displayed in the outlets.
    var monster: Monster! {
        didSet (newMonster) {
            self.refreshUI()
        }
    }
    // Using optional chaining even though the properties are implicitly-un-wrapped optionals. Its possible that you will change monster and trigger the method even before the view has loaded. so you need to be sure to check that the outlets are connected first.
    func refreshUI() {
        nameLabel?.text = monster.name
        descriptionLabel?.text = monster.description
        iconImageView?.image = UIImage(named: monster.iconName)
        weaponImage?.image = monster.weaponImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// Since detailViewController need to update when the monster is slected, we need to implement the delegate.
extension DetailViewController: MonsterSelectionDelegate{
    func monsterSelected(_ newMonster: Monster) {
        monster = newMonster
    }
}
