//
//  CandidateDetailViewController.swift
//  Chamba
//
//  Created by Rodolfo Castillo Vidrio on 24/06/18.
//  Copyright © 2018 Rodolfo Castillo Vidrio. All rights reserved.
//

import UIKit
import AZDropdownMenu

class CandidateDetailViewController: UIViewController {
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var headShot: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var auxView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    
    var options = ["","Mis Vacantes", "Historial"]
    var menu: AZDropdownMenu!
    var currentCandidate: Candidate! = Candidate.getRandomCandidate(prevCandidate: Candidate())
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        menu = AZDropdownMenu(titles: options)
        menu.cellTapHandler = { [weak self] (indexPath: IndexPath) -> Void in
            switch indexPath.row {
            case 1:
                print("Vacantes");
                let controller = VaccancyController.get()
                self?.navigationController?.pushViewController(controller, animated: true)
            case 2:
                print("Historial")
            default: break
                
            }
        }
        headShot.imageFromServerURL(urlString: currentCandidate.user.photoUrl)
        firstName.text = currentCandidate.user.name
        lastName.text = currentCandidate.user.lastname + " " + (currentCandidate.user.secondLastName != nil ? currentCandidate.user.secondLastName! : "")
        auxView.transform = CGAffineTransform.init(translationX: self.view.frame.width, y: 0)
        auxView.alpha = 1
    }
    
    @IBAction func showDropdown() {
        self.menu.frame.origin.y = 50
        if (self.menu?.isDescendant(of: self.view) == true) {
            self.menu?.hideMenu()
        } else {
            self.menu?.showMenuFromView(self.view)
        }
    }
    
    @IBAction func nextCandidate(){
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
             self.auxView.transform = CGAffineTransform.identity
        }) { (completed) in
            self.currentCandidate = Candidate.getRandomCandidate(prevCandidate: self.currentCandidate)
            self.headShot.imageFromServerURL(urlString: self.currentCandidate.user.photoUrl)
            self.firstName.text = self.currentCandidate.user.name
            self.lastName.text = self.currentCandidate.user.lastname + " " + (self.currentCandidate.user.secondLastName != nil ? self.currentCandidate.user.secondLastName! : "")
            self.table.reloadData()
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                self.auxView.alpha = 0
            }) { (completed) in
                self.auxView.transform = CGAffineTransform.init(translationX: self.view.frame.width, y: 0)
                self.auxView.alpha = 1
            }
        }
    }
    
    @IBAction func callByPhone(){
        guard let number = URL(string: "tel://5584176082") else { return }
        UIApplication.shared.open(number)
    }
    
}

extension CandidateDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeDetailCell") as! DetailCell
        let detail = currentCandidate.experience[indexPath.row]
        cell.fill(withTitle: detail.title, withInfo: detail.info)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCandidate != nil ? currentCandidate.experience.count : 0
    }
}
