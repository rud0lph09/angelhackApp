//
//  Candidate.swift
//  Chamba
//
//  Created by Rodolfo Castillo Vidrio on 24/06/18.
//  Copyright © 2018 Rodolfo Castillo Vidrio. All rights reserved.
//

import Foundation

struct Detail {
    var title: String!
    var info: String!
}

class Candidate {
    
    var user: User!
    var experience:[Detail]! = []
    
    init(withUser usr: User, andExperienceData exp: [Detail]) {
        self.user = usr
        self.experience = exp
    }
    
    init() {
        self.user = User(withName: "", lastName: "", secondLastName: "", email: "", tel: "", photoUrl: "", andGender: "")
        self.experience = []
    }
    
    class func getRandomCandidate(prevCandidate: Candidate)->Candidate{
        let candidate = candidates[Int(arc4random_uniform(UInt32(candidates.count - 1)))]
        return (candidate.user.telephone != prevCandidate.user.telephone) ? candidate : Candidate.getRandomCandidate(prevCandidate:prevCandidate)
    }
    
    
}

var candidates = [

    Candidate(withUser: User(withName: "Jaqueline", lastName: "Ocasio", secondLastName: "Montalvo", email: "jom@zmail.com", tel: "5591679957", photoUrl: "https://editorial01.shutterstock.com/wm-preview-1500/2347743a/f1c75242/various-shutterstock-editorial-2347743a.jpg", andGender: "femenino"), andExperienceData: [Detail(title: "Escolaridad", info:"secundaria"), Detail(title: "Disponibilidad", info:"Vespertino"), Detail(title: "Experiencia previa", info:"volanteo, cajera, promotora")]),
    Candidate(withUser: User(withName: "Raúl", lastName: "Castellanos", secondLastName: "Ayala", email: "rca@zmail.com", tel: "5517143567", photoUrl: "https://thumb1.shutterstock.com/display_pic_with_logo/1051921/451248556/stock-photo-young-southeast-asian-man-in-new-york-city-serious-face-portrait-451248556.jpg", andGender: "masculino"), andExperienceData: [Detail(title: "Escolaridad", info:"preparatoria"), Detail(title: "Disponibilidad", info:"Indistinto"), Detail(title: "Experiencia previa", info:"limpieza, barbero, ventasseguridadedecán, albañilería")]),
    Candidate(withUser: User(withName: "Adán", lastName: "Barela", secondLastName: "Velasco", email: "abv@zmail.com", tel: "5518430234", photoUrl: "https://thumb1.shutterstock.com/display_pic_with_logo/239779/239779,1285545267,10/stock-photo-mid-age-woman-poses-for-a-portrait-in-studio-61763254.jpg", andGender: "femenino"), andExperienceData: [Detail(title: "Escolaridad", info:"preparatoria"), Detail(title: "Disponibilidad", info:"Vespertino"), Detail(title: "Experiencia previa", info:"mesera, niñera")]),
    Candidate(withUser: User(withName: "Lucía", lastName: "Pacheco", secondLastName: "García", email: "lpg@zmail.com", tel: "5567023701", photoUrl: "https://thumb9.shutterstock.com/display_pic_with_logo/564025/103263158/stock-photo-los-angeles-may-teri-garr-arrives-at-the-th-annual-race-to-erase-ms-gala-at-century-plaza-103263158.jpg", andGender: "femenino"), andExperienceData: [Detail(title: "Escolaridad", info:"preparatoria"), Detail(title: "Disponibilidad", info:"Vespertino"), Detail(title: "Experiencia previa", info:"limpieza, peluquera, jardinería, niñera, mesera")]),
    Candidate(withUser: User(withName: "Gloria", lastName: "Canales", secondLastName: "Estévez", email: "gce@zmail.com", tel: "5535702375", photoUrl: "https://thumb9.shutterstock.com/display_pic_with_logo/842284/106323995/stock-photo-tia-lessin-at-the-th-annual-producers-guild-awards-hollywood-palladium-hollywood-ca-106323995.jpg", andGender: "femenino"), andExperienceData: [Detail(title: "Escolaridad", info:"preparatoria"), Detail(title: "Disponibilidad", info:"Matutino"), Detail(title: "Experiencia previa", info:"ventasseguridadedecán, volanteo, mesera, carnicería")]),
    Candidate(withUser: User(withName: "Celia", lastName: "Guerrero", secondLastName: "Meléndez", email: "cgm@zmail.com", tel: "5575105125", photoUrl: "https://thumb1.shutterstock.com/display_pic_with_logo/1051921/451225159/stock-photo-young-hispanic-man-in-city-face-portrait-451225159.jpg", andGender: "masculino"), andExperienceData: [Detail(title: "Escolaridad", info:"primaria"), Detail(title: "Disponibilidad", info:"Matutino"), Detail(title: "Experiencia previa", info:"albañilería")]),
    Candidate(withUser: User(withName: "Jesús", lastName: "Villalpando", secondLastName: "Reyes", email: "jvr@zmail.com", tel: "5560221331", photoUrl: "https://thumb1.shutterstock.com/display_pic_with_logo/239779/239779,1285545267,10/stock-photo-mid-age-woman-poses-for-a-portrait-in-studio-61763254.jpg", andGender: "femenino"), andExperienceData: [Detail(title: "Escolaridad", info:"primaria"), Detail(title: "Disponibilidad", info:"Vespertino"), Detail(title: "Experiencia previa", info:"jardinería, promotora, carnicería, mesera")]),
    Candidate(withUser: User(withName: "Citlali", lastName: "Leiva", secondLastName: "del Río", email: "cld@zmail.com", tel: "5504639411", photoUrl: "https://thumb1.shutterstock.com/display_pic_with_logo/663268/96933650/stock-photo-portrait-of-handsome-caucasian-man-looking-at-camera-96933650.jpg", andGender: "masculino"), andExperienceData: [Detail(title: "Escolaridad", info:"primaria"), Detail(title: "Disponibilidad", info:"Matutino"), Detail(title: "Experiencia previa", info:"promotor")]),
    Candidate(withUser: User(withName: "Karla", lastName: "Arroyo", secondLastName: "Reynoso", email: "kar@zmail.com", tel: "5586043839", photoUrl: "https://thumb7.shutterstock.com/display_pic_with_logo/2117717/522296041/stock-photo-senior-asian-woman-casual-studio-portrait-concept-522296041.jpg", andGender: "femenino"), andExperienceData: [Detail(title: "Escolaridad", info:"secundaria"), Detail(title: "Disponibilidad", info:"Indistinto"), Detail(title: "Experiencia previa", info:"niñera, mesera, volanteo")]),
    Candidate(withUser: User(withName: "Miguel Ángel", lastName: "Jimínez", secondLastName: "Rosales", email: "mjr@zmail.com", tel: "5534530064", photoUrl: "https://thumb1.shutterstock.com/display_pic_with_logo/1051921/451248556/stock-photo-young-southeast-asian-man-in-new-york-city-serious-face-portrait-451248556.jpg", andGender: "masculino"), andExperienceData: [Detail(title: "Escolaridad", info:"primaria"), Detail(title: "Disponibilidad", info:"Nocturno"), Detail(title: "Experiencia previa", info:"promotor, cajero, volanteo")])

]
