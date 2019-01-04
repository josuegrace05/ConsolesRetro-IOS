//
//  DetailsController.swift
//  Console Retro
//
//  Created by Ringa - mac mini 2 on 02/01/19.
//  Copyright © 2019 Ringa - mac mini 2. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    
    var console:Console?
    
    @IBOutlet weak var DurationLabel: UILabel!
    @IBOutlet weak var retroImageView: UIImageView!
    @IBOutlet weak var descTextField: UITextView!
    @IBOutlet weak var titleView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard console != nil else { return }
        title = console!.name
        titleView.text = console!.name
        retroImageView.image = console!.image
        DurationLabel.text = console!.lifeCycle()
        descTextField.text = console!.desc
        view.backgroundColor = console!.color
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
