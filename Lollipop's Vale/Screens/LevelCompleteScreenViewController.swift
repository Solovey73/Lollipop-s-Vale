//
//  LevelCompleteScreenViewController.swift
//  Lollipop's Vale
//
//  Created by Вячеслав on 23.11.2024.
//

import UIKit

final class LevelCompleteScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        setupUI()
    }
    
    private func setupUI() {
        setupBackgroundImage()
        setupLogo()
        setupStackView()
    }
    
    private func setupBackgroundImage() {
        let backgroundImageView = UIImageView(image: UIImage(named: "background"))
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
    }
    
    private func setupLogo() {
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.frame.size.width = view.bounds.width / 2
        logoImageView.frame.size.height = logoImageView.frame.size.width
        logoImageView.center.x = view.bounds.midX
        logoImageView.center.y = view.bounds.height * 0.35
        view.addSubview(logoImageView)
    }
    
    private func setupStackView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        backgroundView.frame.size.width = view.bounds.width * 0.94
        backgroundView.frame.size.height = view.bounds.height * 0.3
        backgroundView.center.x = view.bounds.midX
        backgroundView.center.y = view.bounds.height * 0.75
        backgroundView.layer.cornerRadius = 15
        view.addSubview(backgroundView)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(stackView)

        // Устанавливаем констрейнты для стэка внутри containerView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.8)
        ])
        
        // Создаем элементы стэка
        let label = UILabel()
        label.text = "Level Complete"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center

        let nextLevelButton = UIButton(type: .system)
        nextLevelButton.setTitle("Next Level", for: .normal)
        nextLevelButton.setTitleColor(.white, for: .normal)
        nextLevelButton.backgroundColor = UIColor.systemPurple
        nextLevelButton.layer.cornerRadius = 15

        let mainMenuButton = UIButton(type: .system)
        mainMenuButton.setTitle("Main Menu", for: .normal)
        mainMenuButton.setTitleColor(.white, for: .normal)
        mainMenuButton.backgroundColor = UIColor.systemPurple
        mainMenuButton.layer.cornerRadius = 15
        mainMenuButton.addTarget(self, action: #selector(mainMenuButtonTapped), for: .touchUpInside)

        // Добавляем элементы в стэк
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(nextLevelButton)
        stackView.addArrangedSubview(mainMenuButton)
    }
    
    @objc private func mainMenuButtonTapped() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = StartScreenViewController()
            
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
}
