//
//  ShopScreenViewController.swift
//  Lollipop's Vale
//
//  Created by Вячеслав on 23.11.2024.
//

import UIKit

class ShopScreenViewController: UIViewController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
        
    private func setupUI() {
        setupBackgroundImage()
        setupBackButton()
        setupShoplable()
        createLabel()
        // Создаём сетку с изображениями лягушек
        setupFrogGrid()
    }
        
    private func setupFrogGrid() {
        let gridContainer = UIStackView()
        gridContainer.axis = .vertical
        gridContainer.spacing = 16
        gridContainer.alignment = .center
        gridContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gridContainer)
            
        let frogSkins = ["frog1", "frog2", "frog3", "frog4"]
        let columns = 2
        let buttonSize: CGFloat = 150
        let buttonSpacing: CGFloat = 80
            
        for row in 0..<(frogSkins.count / columns) {
            let rowStack = UIStackView()
            rowStack.axis = .horizontal
            rowStack.spacing = buttonSpacing
            rowStack.alignment = .center
                
            for column in 0..<columns {
                let index = row * columns + column
                    if index < frogSkins.count {
                        let button = UIButton(type: .custom)
                                        button.translatesAutoresizingMaskIntoConstraints = false
                                        button.setImage(UIImage(named: frogSkins[index]), for: .normal)
                                        button.layer.cornerRadius = buttonSize / 2
                                        button.clipsToBounds = true
                                        
                                        // Настраиваем размер кнопки
                                        NSLayoutConstraint.activate([
                                            button.widthAnchor.constraint(equalToConstant: buttonSize),
                                            button.heightAnchor.constraint(equalToConstant: buttonSize)
                                        ])
                                        
                                        // Настраиваем изображение внутри кнопки
                                        button.imageView?.contentMode = .scaleAspectFit // Изображение пропорционально масштабируется
                                        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы внутри кнопки
                                        
                                        rowStack.addArrangedSubview(button)
                    }
                }
                
                gridContainer.addArrangedSubview(rowStack)
            }
            
            NSLayoutConstraint.activate([
                gridContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                gridContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 300)
            ])
        }
        
        @objc private func backButtonTapped() {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = StartScreenViewController()
                
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
        }
    
    private func setupBackgroundImage() {
        let backgroundImageView = UIImageView(image: UIImage(named: "background"))
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
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
    
    private func setupShoplable() {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "button_1"), for: UIControl.State.normal)
        button.setTitle("SHOP", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.frame.size.width = view.bounds.width * 0.849180328
        button.frame.size.height = view.bounds.height * 0.143493976
        button.frame.origin.x = view.bounds.width * 0.0754098361
        button.frame.origin.y = view.bounds.height * 0.142319277
        view.addSubview(button)
    }
    
    private func createLabel() {
        let label = UILabel()
        label.text = "choose a frog skin"
        label.textAlignment = .center
        label.font = UIFont(name: "ChalkboardSE-Bold", size: 34)
        label.textColor = .white
        label.frame.size.width = view.bounds.width * 0.849180328
        label.frame.size.height = view.bounds.height * 0.143493976
        label.center.x = view.bounds.midX
        label.center.y = view.bounds.height * 0.32
        view.addSubview(label)
    }
    
}
