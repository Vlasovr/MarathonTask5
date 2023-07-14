
import UIKit

class PopOverVC: UIViewController {
       
    private lazy var segmentedControl: UISegmentedControl = {
        var segmentContr = UISegmentedControl(items: ["280pt", "150pt"])
        segmentContr.selectedSegmentIndex = 0
        segmentContr.addTarget(self, action: #selector(suitDidChange), for: .valueChanged)
        return segmentContr
    }()
    
    private lazy var closeButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(closePopover), for: .touchUpInside)
        return button
    }()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(segmentedControl)
        view.addSubview(closeButton)
        setupConstraints()
    }
    
    @objc func suitDidChange() {
        if segmentedControl.selectedSegmentIndex == 1 {
            preferredContentSize = CGSize(width: 300, height: 150)
        } else {
            preferredContentSize = CGSize(width: 300, height: 280)
        }
    }

    private func setupConstraints() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
        ])
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
    }
    
    @objc func closePopover() {
        dismiss(animated: true)
    }
    
}
