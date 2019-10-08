//
//  JSTableViewController.swift
//  Hogwarts-C
//
//  Created by Josh Sparks on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class JSTableViewController: UITableViewController {

    var characters: [JSCharacter] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        JSCharacterController.fetchCharacters { (characters) in
            DispatchQueue.main.async {
                self.characters = characters
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? JSCharacterTableViewCell else { return UITableViewCell()}
        let character = characters[indexPath.row]
        
        cell.updateViews(with: character)
        return cell
    }


}
