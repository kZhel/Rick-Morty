
import UIKit

class MainViewController: UIViewController {

    // Dependencies

    // UI
    private let charactersButton = MainScreenButton(with: .characters)
    private let locationsButton = MainScreenButton(with: .locations)
    private let episodesButton = MainScreenButton(with: .episodes)


    // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainThemeColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        setUpButton(button: charactersButton)
        setUpButton(button: locationsButton)
        setUpButton(button: episodesButton)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(false, animated: animated); // <<
         super.viewWillDisappear(animated)
    }
}

// MARK: - MainScreenButtonDelegate

extension MainViewController: MainScreenButtonDelegate {

    func didTapMainScreenButton(with type: MainScreenButtonType) {
        switch type {
        case .characters:
            let charachterVC = CharactersViewController()
            navigationController?.pushViewController(charachterVC, animated: true)
        case .episodes:
            let episodeVC = EpisodeViewController()
            navigationController?.pushViewController(episodeVC, animated: true)
        case .locations:
            let locationVC = LocationViewController()
            navigationController?.pushViewController(locationVC, animated: true)
        }
        
    }
}

// MARK: - Private functions

private extension MainViewController {

    func setUpButton(button: MainScreenButton) {
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.delegate = self
        view.addSubview(button)
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.backgroundColor = .none
        label.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        button.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: view.frame.width * 0.9).isActive = true
        button.heightAnchor.constraint(equalToConstant: view.frame.height * 0.25).isActive = true
        

        switch button.type {
        case .characters:
            label.text = "Characters"
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        case .locations:
            label.text = "Locations"
            button.topAnchor.constraint(equalTo: charactersButton.bottomAnchor, constant: 30).isActive = true
        case .episodes:
            label.text = "Episodes"
            button.topAnchor.constraint(equalTo: locationsButton.bottomAnchor, constant: 30).isActive = true
        }
    }
}
