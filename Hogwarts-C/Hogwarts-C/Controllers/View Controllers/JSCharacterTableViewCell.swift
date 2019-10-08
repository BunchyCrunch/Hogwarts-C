//
//  JSCharacterTableViewCell.swift
//  Hogwarts-C
//
//  Created by Josh Sparks on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class JSCharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterNameLabel: UILabel!
    
    @IBOutlet weak var characterRoleLabel: UILabel!
    @IBOutlet weak var characterHouseImageView: UIImageView!
    
    @IBOutlet weak var characterBloodStatusImageView: UIImageView!
    
    @IBOutlet weak var deathEaterImageView: UIImageView!
    
    func updateViews(with character: JSCharacter) {
        
        deathEaterImageView.isHidden == true
        if character.deathEater == true {
            deathEaterImageView.isHidden = false
        }
        
        // half-blood, pure-blood, muggle-born, unknown
        if character.bloodStatus != "unknown" {
            characterBloodStatusImageView.isHidden = false
            characterBloodStatusImageView.image = UIImage.init(named: character.bloodStatus)
        }
        
        if let house = character.house {
            characterHouseImageView.isHidden = false
            characterHouseImageView.image = UIImage.init(named: house.lowercased())
        }
        
        characterNameLabel.text = character.name
        characterRoleLabel.text = character.role
        
    }
    
}
