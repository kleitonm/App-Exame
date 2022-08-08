//
//  TelaInicial.swift
//  App-Teste-Intermediario
//
//  Created by Kleiton Mendes on 05/06/22.
//

import Foundation
import UIKit
import CoreData

class TelaLoginController: UIViewController {
    
    var pushRegister = TelaCadastroController()
    var people: [NSManagedObject] = []
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""


        if email == emailTextField.text ?? "" && password == passwordTextField.text ?? ""{
//        self.performSegue(withIdentifier: "ViewController", sender: nil)
        } else {
        print("Senha ou e-mail não conferem")
        }

        }
    
    
    @IBAction func registerButton(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "TelaCadastroController", sender: nil)
        
    }
    
   
}

