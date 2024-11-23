//
//  GameScreenViewController.swift
//  Lollipop's Vale
//
//  Created by Вячеслав on 22.11.2024.
//

import UIKit

final class GameScreenViewController: UIViewController {
    
    private var selectedButtonTag = 28
    private var score: Int = 0 {
        willSet {
            scoreLabelButton.setTitle("Score \(newValue)", for: .normal)
        }
    }
    private var gamerFrogImageView: UIImageView = UIImageView()
    private var opponentFrogImageView: UIImageView = UIImageView()
    private var gemImageView: UIImageView = UIImageView()
    private var opponentStepsTag: [Int] = [20,19,14,13,12,11]
    private var scoreLabelButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        setupButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupGamerFrog()
        setupOpponentFrog()
        setupGemImageView()
        setupScoreLabel()
    }
    
    private func setupBackgroundImage() {
        let backgroundImageView = UIImageView(image: UIImage(named: "background"))
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
    }
    
    private func setupButtons() {
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.spacing = 10
        mainStack.distribution = .fillEqually
        mainStack.frame.size.width = view.bounds.width * 0.9
        mainStack.frame.size.height = view.bounds.height * 0.5
        mainStack.frame.origin.x = view.bounds.width * 0.05
        mainStack.frame.origin.y = view.bounds.height * 0.35
        view.addSubview(mainStack)
        var tagCounter = 1
        // Создаю 6 строк
        for _ in 1...6 {
            let rowStack = UIStackView()
            rowStack.axis = .horizontal
            rowStack.spacing = 10
            rowStack.distribution = .fillEqually
            // В каждой строке 5 кнопок
            for _ in 0..<5 {
                let button = UIButton(type: .system)
                button.setBackgroundImage(UIImage(named: "el10"), for: .normal)
                button.tag = tagCounter
                tagCounter += 1
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                rowStack.addArrangedSubview(button)
            }
            mainStack.addArrangedSubview(rowStack)
        }
        setupFiniishButton()
        setupBackButton()
    }
    
    private func setupFiniishButton() {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "logo"), for: .normal)
        button.tag = 33
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.frame.size.width = view.bounds.width * 0.39
        button.frame.size.height = view.bounds.height * 0.18
        button.center.x = view.bounds.midX
        button.center.y = view.bounds.height * 0.2
        view.addSubview(button)
    }
    
    private func setupBackButton() {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.background.image = UIImage(named: "button_2")
        let largeFont = UIFont.systemFont(ofSize: 30)
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(font: largeFont)
        config.background.imageContentMode = .scaleAspectFit
        config.image = UIImage(systemName: "arrowshape.turn.up.backward.fill")
        config.imagePlacement = .top
        config.imageColorTransformer = .init { _ in UIColor.white }
        button.configuration = config
        
        let width = view.bounds.width * 0.191803279
        button.frame.size.width = width
        button.frame.size.height = width
        button.frame.origin.x = view.bounds.width * 0.747540984
        button.frame.origin.y = view.bounds.height * 0.874126506
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    private func setupGamerFrog() {
        let gamerFrogImageView = UIImageView(image: UIImage(named: "frog1"))
        if let button = self.view.viewWithTag(28) as? UIButton {
            gamerFrogImageView.frame.size.width = button.bounds.width
            gamerFrogImageView.frame.size.height = button.bounds.height
            let buttonCenterInView = self.view.convert(button.center, from: button.superview)
            print("Центр innerView относительно superview: \(buttonCenterInView)")
            gamerFrogImageView.center.x = buttonCenterInView.x
            gamerFrogImageView.center.y = buttonCenterInView.y
            print(gamerFrogImageView.center.x)
            print(buttonCenterInView.x)
            gamerFrogImageView.tag = 31
            
            view.addSubview(gamerFrogImageView)
            
        }
        
    }
    
    private func setupOpponentFrog() {
        let opponentFrogImageView = UIImageView(image: UIImage(named: "frog2"))
        if let button = self.view.viewWithTag(30) as? UIButton {
            opponentFrogImageView.frame.size.width = button.bounds.width
            opponentFrogImageView.frame.size.height = button.bounds.height
            let buttonCenterInView = self.view.convert(button.center, from: button.superview)

            opponentFrogImageView.center.x = buttonCenterInView.x
            opponentFrogImageView.center.y = buttonCenterInView.y
    
            opponentFrogImageView.tag = 32
            
            view.addSubview(opponentFrogImageView)
            
        }
    }
    
    private func setupGemImageView() {
        let gemImageView = UIImageView(image: UIImage(named: "el2"))
        if let button = self.view.viewWithTag(3) as? UIButton {
            gemImageView.frame.size.width = button.bounds.width * 0.7
            gemImageView.frame.size.height = button.bounds.height * 0.7
            let buttonCenterInView = self.view.convert(button.center, from: button.superview)
            gemImageView.center.x = buttonCenterInView.x
            gemImageView.center.y = buttonCenterInView.y
            gemImageView.tag = 34
            view.addSubview(gemImageView)
        }
    }
    
    private func setupScoreLabel() {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.background.image = UIImage(named: "button_1")
        let largeFont = UIFont.systemFont(ofSize: 30)
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(font: largeFont)
        config.background.imageContentMode = .scaleAspectFit
        button.configuration = config
        
        button.frame.size.width = view.bounds.width * 0.3
        button.frame.size.height = view.bounds.height * 0.2
        button.frame.origin.x = view.bounds.width * 0.687540984
        button.frame.origin.y = view.bounds.height * 0.05
        button.setTitle("SCORE: \(score)", for: .normal)
        scoreLabelButton = button
        view.addSubview(button)
        
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        print("Кнопка с tag \(sender.tag) нажата")
        let buttonTag = sender.tag
        if buttonTag == selectedButtonTag {return}
        
        if buttonTag == 3 {
            moveViewToButton(targetButton: buttonTag)
            view.viewWithTag(34)?.isHidden = true
            score += 1
        }
        
        if buttonTag == 33 && 1...5 ~= selectedButtonTag {
            moveViewToButton(targetButton: 33)
            showLevelCompletionScreen()
        }
        if buttonTag == selectedButtonTag + 5 || buttonTag == selectedButtonTag - 5 {
            moveViewToButton(targetButton: buttonTag)
            
        }
        if buttonTag == selectedButtonTag + 1 && selectedButtonTag % 5 != 0 {
            moveViewToButton(targetButton: buttonTag)
        }
        
        if buttonTag == selectedButtonTag - 1 && buttonTag % 5 != 0 {
            moveViewToButton(targetButton: buttonTag)
        }
        
        
        
    }
    
    private func moveViewToButton(targetButton: Int) {
        selectedButtonTag = targetButton
        UIView.animate(.easeIn) {
            if let button = self.view.viewWithTag(targetButton) as? UIButton {
                
                let buttonCenterInView = self.view.convert(button.center, from: button.superview)
                print("Центр innerView относительно superview: \(buttonCenterInView)")
                self.view.viewWithTag(31)?.center.x = buttonCenterInView.x
                self.view.viewWithTag(31)?.center.y = buttonCenterInView.y
            }
        }
        moveOpponentFrog()
    }
    
    private func moveOpponentFrog() {
        UIView.animate(.easeIn) {
            if let button = self.view.viewWithTag(opponentStepsTag.removeFirst()) as? UIButton {
                
                let buttonCenterInView = self.view.convert(button.center, from: button.superview)
                print("Центр innerView относительно superview: \(buttonCenterInView)")
                self.view.viewWithTag(32)?.center.x = buttonCenterInView.x
                self.view.viewWithTag(32)?.center.y = buttonCenterInView.y
            }
            
        }
    }
    
    private func showLevelCompletionScreen() {
        let levelCompleteScreenViewController = LevelCompleteScreenViewController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = levelCompleteScreenViewController
            
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    @objc private func backButtonTapped() {
        let chooseLevelScreenViewController = ChooseLevelScreenViewController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = chooseLevelScreenViewController
            
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    
}


