//
//  CharactersViewController.swift
//  FourthWeekHomework
//
//  Created by Yusuf Aksu on 26.11.2022.
//

import UIKit

class CharactersViewController: UIViewController {

  private var characters: [CharacterModel]?
  //MARK: Lifecycle
  override func viewDidLoad() {
      super.viewDidLoad()

      Client.getCharacters { [weak self] characters, error in
          guard let self = self else { return }
          self.characters = characters
      }
    print(self.characters)
  }
}
