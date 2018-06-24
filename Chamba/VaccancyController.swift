//
//  VaccancyController.swift
//  Chamba
//
//  Created by Rodolfo Castillo Vidrio on 24/06/18.
//  Copyright © 2018 Rodolfo Castillo Vidrio. All rights reserved.
//

import UIKit
import Eureka

class VacancyCell: UITableViewCell {
    @IBOutlet weak var titleTag: UILabel!
    @IBOutlet weak var infoTag: UILabel!
    
    func fill(withTitle _t: String, andInfo _i: String) {
        self.titleTag.text = _t
        self.infoTag.text = _i
    }
}

class VaccancyController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var table: UITableView!
    var vacancies: [Vacancy] = [Vacancy(withTitle: "Se solicita Mesero", andInfo: "Se solicita mesero in experiencia preevia, ambos sexos"), Vacancy(withTitle: "Se solicita Gerente", andInfo: "Gerente, genero Masculino, con referencias")]
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func _bye() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacancies.count
    }
    
    @IBAction func addVacancy(){
        let _c = NewVacancyController()
        _c._cVacancyController = self
        self.navigationController?.pushViewController(_c, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vacancycellID") as! VacancyCell
        let _v = vacancies[indexPath.row]
        cell.fill(withTitle: _v.title, andInfo: _v.info)
        return cell
    }
    
    class func get()-> VaccancyController {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VacancyControllerID") as! VaccancyController
    }
}

class Vacancy {
    var title: String!
    var info: String!
    
    init(withTitle _t: String, andInfo _i: String) {
        self.title = _t
        self.info = _i
    }
    
    init(){
    }
}

class NewVacancyController: FormViewController {
    
    var _cVacancyController: VaccancyController!
    
    var newVac: Vacancy = Vacancy()
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = false
        let play = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveVacancy))
        
        navigationItem.rightBarButtonItems = [play]
        super.viewDidLoad()
        form +++ Section("Nueva vacante")
            <<< TextRow(){ row in
                row.title = "Título"
                row.placeholder = "Título de la vacante"
                }.onChange({ (row) in
                    self.newVac.title = (row.value != nil ) ? row.value! : ""
                })
            <<< TextRow(){ row in
                row.title = "Descripción"
                row.placeholder = "Descripción de la vacante"
                }.onChange({ (row) in
                    self.newVac.info = (row.value != nil ) ? row.value! : ""
                })
        
    }
    
    @objc func saveVacancy(){
        if newVac.title != nil && newVac.info != nil {
            _cVacancyController.vacancies.append(newVac)
            _cVacancyController.table.reloadData()
            self.navigationController?.popViewController(animated: true)
        } else  {
            let c = UIAlertController(title: "Whoops", message: "No dejes campos en blanco", preferredStyle: .alert)
            c.addAction(UIAlertAction(title: "Okey", style: .default, handler: nil))
        }
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}
