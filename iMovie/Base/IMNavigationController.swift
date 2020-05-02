//
//  IMNavigationController.swift
//  iMovie
//
//  Created by SHABEERALI K on 27/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import UIKit

/// Custom Navigation controller class where we do all navigation Bar customization
class IMNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = .orange
        self.navigationBar.tintColor = .yellow
        self.navigationBar.barStyle = .black
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 24)!]
        UINavigationBar.appearance().titleTextAttributes = attributes

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
