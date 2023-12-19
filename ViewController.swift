//
//  ViewController.swift
//  FDCAssessment
//
//  Created by d on 12/19/23.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameError: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var regionError: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var countryError: UILabel!
    
    var cancellables = Set<anycan
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameTextField.addTarget(nil, action: #selector(nameChanged), for: .editingChanged)
    }
    @objc func nameChanged() {
        
    }
    
    func getCountries() {
        NetworkManager.shared.getCountries().sink { [weak self] completion in
            guard let self = self else { return }
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                break
            }
        } receiveValue: { countries in
            // code to show countries
        }

    }


}

extension String {
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    var isAlphabet: Bool {
        return !isEmpty && range(of: "[^a-zA-Z]", options: .regularExpression) == nil
    }
}
