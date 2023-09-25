//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Kyrllan Nogueira on 20/05/19.
//  Copyright © 2019 Kyrllan Nogueira. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {
    
    
    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTaxDescription: UILabel!
    @IBOutlet weak var lbStateTax: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
    
    func calculateTaxes() {
        lbStateTaxDescription.text = "Imposto do Estado (\(tc.gerFormattedValue(of: tc.stateTax, withCurrency: ""))%)"
        lbIOFDescription.text = "IOF (\(tc.gerFormattedValue(of: tc.iof, withCurrency: ""))%)"
        
        lbDolar.text = tc.gerFormattedValue(of: tc.shoppingValue, withCurrency: "US$ ")
        lbStateTax.text = tc.gerFormattedValue(of: tc.stateTaxValue, withCurrency: "US$ ")
        lbIOF.text = tc.gerFormattedValue(of: tc.iofValue, withCurrency: "US$ ")
        
        let real = tc.calculate(usingCreditCard: swCreditCard.isOn)
        lbReal.text = tc.gerFormattedValue(of: real, withCurrency: "R$ ")
        
    }
    
}
