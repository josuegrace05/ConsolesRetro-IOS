//
//  HomeController.swift
//  Console Retro
//
//  Created by Ringa - mac mini 2 on 20/12/18.
//  Copyright © 2018 Ringa - mac mini 2. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var retroImageView: UIImageView!
    var consoles:[Console] = []
    private var index = 0
    var segueID = "Details"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        consoles = ConsoleCollection().list()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toDetails))
        //retroImageView.isUserInteractionEnabled = true
        retroImageView.addGestureRecognizer(tapGesture)
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //navigationController?.navigationBar.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    @objc func toDetails(){
            performSegue(withIdentifier: segueID, sender: nil)
            //performSegue(withIdentifier: segueID, sender: consoles[index])
    }
    
    func setup() {
        let console = consoles[index]
        titleLabel.text = "Mes consoles Retro\n" + console.name
        retroImageView.image = console.image
        view.backgroundColor = console.color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID {
            if let controller = segue.destination as? DetailsController {
                controller.console = consoles[index]
                //controller.console = sender as? Console
            }
        }
    }
    @IBAction func previousBtPressed(_ sender: Any) {
        index = index == 0 ? consoles.count - 1: index - 1
        setup()
    }
    @IBAction func randomBtPressed(_ sender: Any) {
        index = Int.random(in: 0..<consoles.count)
        setup()
    }
    @IBAction func nextBtPressed(_ sender: Any) {
        index = index == consoles.count - 1 ? 0 : index + 1
        setup()
    }
}
