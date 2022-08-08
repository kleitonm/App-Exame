//
//  TelaCadastro.swift
//  App-Teste-Intermediario
//
//  Created by Kleiton Mendes on 05/06/22.
//

import Foundation
import UIKit
import CoreData

class TelaCadastroController: ViewController {
    
    var people: [NSManagedObject] = []

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Login")
        
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError{
            print("Não foi possível retornar os registros. \(error)")
        }
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Login", message: nil, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Salvar", style: .default){
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                  let emailToSave = textField.text, let passwordToSave = textField.text else {
                      return
                  }
            
            save(email: emailToSave, password: passwordToSave)
            self.myTableView.reloadData()
        }
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
            
            alert.addTextField()
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true)
            
            }
    
    func save(email: String, password: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        //pegar o contexto e chamar o delegate para a camada de persistencia
        let managedContext = appDelegate.persistentContainer.viewContext
        //pegar a entidade que estou declarando
        let entity = NSEntityDescription.entity(forEntityName: "Login", in: managedContext)!
        //criar um person
        let personEmail = NSManagedObject(entity: entity, insertInto: managedContext)
        personEmail.setValue(email, forKey: "email")
        let personPassword = NSManagedObject(entity: entity, insertInto: managedContext)
        personPassword.setValue(password, forKey: "passsword")
        do {
            try managedContext.save()
            people.append(personEmail)
            people.append(personPassword)
        } catch let error as Error{
            print("Error ao salvar novo nome \(error)")
        }
    }
            
    }
    
    
    

