import Foundation
import UIKit

class EditEntryViewController: UIViewController
{
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var entry: Entry? = nil
    
    lazy var keychain = KeychainFacade()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(EditEntryViewController.onSave))
        
        navigationItem.rightBarButtonItem = saveButton
        
        if entry == nil
        {
            entry = Entry()
            self.title = "Add New Entry"
        }
        
        titleTextField.text = entry?.title
        contentTextView.text = entry?.content
        
    }
    
    @objc func onSave(_ sender: UIBarButtonItem)
    {
        entry?.title = titleTextField.text!
        entry?.content = contentTextView.text!
        
        AppDelegate.entries.write(entry!)
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onSaveCredentials(_ sender: Any) {
        if let text = titleTextField.text {
            do {
               try keychain.set(string: text, forKey: "Value")
            } catch let facadeError as KeychainFacadeError {
                print(facadeError)
            } catch {
                print(KeychainFacadeError.self)
            }
        }
        
    }
}
