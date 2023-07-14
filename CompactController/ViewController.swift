import UIKit

class ViewController: UIViewController {
    
    private lazy var presentButton: UIButton = {
        var button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Present"
        button.configuration = configuration

        button.addTarget(self, action: #selector(presentPopoverController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(presentButton)
        setupButtonConstraints()
    }
    
    private func setupButtonConstraints() {
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.heightAnchor.constraint(equalToConstant: 20),
            presentButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
        
    @objc func presentPopoverController() {
        let popOverVC = PopOverVC()
        popOverVC.view.backgroundColor = .secondarySystemBackground
        popOverVC.preferredContentSize = CGSize(width: 300, height: 280)
        popOverVC.modalPresentationStyle = .popover
        popOverVC.popoverPresentationController?.delegate = self
        
        present(popOverVC, animated: false)
        popOverVC.popoverPresentationController?.sourceView = presentButton
        popOverVC.popoverPresentationController?.sourceRect = CGRect(x: presentButton.bounds.midX,
                                                                     y: presentButton.bounds.maxY,
                                                                     width: 0,
                                                                     height: 0)
        }
    }

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
    
