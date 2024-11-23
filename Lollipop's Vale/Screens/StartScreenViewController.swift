//
//  ViewController.swift
//  Lollipop's Vale
//
//  Created by Вячеслав on 21.11.2024.
//

import UIKit

final class StartScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        setupBackgroundImage()
        setupLogo()
        setupButtons()
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
    
    private func setupButtons() {
        setupTutorialButton()
        setupManualButton()
        setupSettingButton()
        setupShopButton()
        setupStartGameButton()
        setupAchievementsButton()
    }
    
    private func setupTutorialButton() {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "button_2"), for: UIControl.State.normal)
        button.setTitle("?", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
        let width = view.bounds.width * 0.191803279
        button.frame.size.width = width
        button.frame.size.height = width
        button.frame.origin.x = view.bounds.width * 0.0606557377
        button.frame.origin.y = view.bounds.height * 0.142319277
        view.addSubview(button)
    }
    
    private func setupManualButton() {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.background.image = UIImage(named: "button_2")
        let largeFont = UIFont.systemFont(ofSize: 30)
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(font: largeFont)
        config.background.imageContentMode = .scaleAspectFit
        config.image = UIImage(systemName: "book.fill")
        config.imagePlacement = .top
        config.imageColorTransformer = .init { _ in UIColor.white }
        button.configuration = config
        
        let width = view.bounds.width * 0.191803279
        button.frame.size.width = width
        button.frame.size.height = width
        button.frame.origin.x = view.bounds.width * 0.747540984
        button.frame.origin.y = view.bounds.height * 0.142319277
        view.addSubview(button)
    }

    private func setupSettingButton() {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.background.image = UIImage(named: "button_2")
        let largeFont = UIFont.systemFont(ofSize: 30)
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(font: largeFont)
        config.background.imageContentMode = .scaleAspectFit
        config.image = UIImage(systemName: "gearshape.fill")
        config.imagePlacement = .top
        config.imageColorTransformer = .init { _ in UIColor.white }
        button.configuration = config
        
        let width = view.bounds.width * 0.191803279
        button.frame.size.width = width
        button.frame.size.height = width
        button.frame.origin.x = view.bounds.width * 0.0606557377
        button.frame.origin.y = view.bounds.height * 0.844126506
        view.addSubview(button)
    }

    private func setupShopButton() {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.background.image = UIImage(named: "button_2")
        let largeFont = UIFont.systemFont(ofSize: 30)
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(font: largeFont)
        config.background.imageContentMode = .scaleAspectFit
        config.image = UIImage(systemName: "cart.fill")
        config.imagePlacement = .top
        config.imageColorTransformer = .init { _ in UIColor.white }
        button.configuration = config
        button.addTarget(self, action: #selector(shopButtonTapped), for: .touchUpInside)
        let width = view.bounds.width * 0.191803279
        button.frame.size.width = width
        button.frame.size.height = width
        button.frame.origin.x = view.bounds.width * 0.747540984
        button.frame.origin.y = view.bounds.height * 0.844126506
        view.addSubview(button)
    }
             
    private func setupStartGameButton() {
        let button = UIButton()
        button.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "button_1"), for: UIControl.State.normal)
        button.setTitle("START GAME", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.frame.size.width = view.bounds.width * 0.849180328
        button.frame.size.height = view.bounds.height * 0.0873493976
        button.frame.origin.x = view.bounds.width * 0.0754098361
        button.frame.origin.y = view.bounds.height * 0.472319277
        view.addSubview(button)
    }
    
    private func setupAchievementsButton() {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "button_1"), for: UIControl.State.normal)
        button.setTitle("ACHIEVEMENTS", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.frame.size.width = view.bounds.width * 0.849180328
        button.frame.size.height = view.bounds.height * 0.0873493976
        button.frame.origin.x = view.bounds.width * 0.0754098361
        button.frame.origin.y = view.bounds.height * 0.592319277
        view.addSubview(button)
    }
    
    @objc private func startGameButtonTapped() {
        let chooseLevelScreenViewController = ChooseLevelScreenViewController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = chooseLevelScreenViewController
            
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    @objc private func shopButtonTapped() {
        let shopScreenViewController = ShopScreenViewController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = shopScreenViewController
            
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}

