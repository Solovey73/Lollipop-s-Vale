//
//  ChooseLevelScreenViewController.swift
//  Lollipop's Vale
//
//  Created by Вячеслав on 23.11.2024.
//

import UIKit

final class ChooseLevelScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView!
    private let totalLevels = 100 // Всего уровней
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        setupBackgroundImage()
        setupScrollView()
    }
    
    private func setupBackgroundImage() {
        let backgroundImageView = UIImageView(image: UIImage(named: "background"))
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
    }
    
    private func setupScrollView() {
        // Создаем layout для UICollectionView
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .vertical
                layout.minimumLineSpacing = 10 // Расстояние между строками
                layout.minimumInteritemSpacing = 10 // Расстояние между элементами в одной строке

                // Создаем UICollectionView
                collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                collectionView.translatesAutoresizingMaskIntoConstraints = false
                collectionView.backgroundColor = .clear
                collectionView.delegate = self
                collectionView.dataSource = self

                // Регистрируем ячейку
                collectionView.register(LevelCell.self, forCellWithReuseIdentifier: "LevelCell")
                
                // Добавляем collectionView в view
                view.addSubview(collectionView)

                // Устанавливаем констрейнты
                NSLayoutConstraint.activate([
                    collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
                ])
        
    }
    
    // MARK: - UICollectionViewDataSource

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return totalLevels
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as? LevelCell else {
                return UICollectionViewCell()
            }
            let levelNumber = indexPath.item + 1
            cell.configure(with: levelNumber)
            return cell
        }

        // MARK: - UICollectionViewDelegate

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let levelNumber = indexPath.item + 1
            print("Выбран уровень: \(levelNumber)")
        }

        // MARK: - UICollectionViewDelegateFlowLayout

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Размер каждой кнопки (ячейки)
            let spacing: CGFloat = 10 // Расстояние между ячейками
            let totalSpacing = spacing * 3 // 5 элементов в строке, значит 4 промежутка
            let itemWidth = (collectionView.bounds.width - totalSpacing) / 4 // 5 кнопок в ряд
            return CGSize(width: itemWidth, height: itemWidth) // Квадратные кнопки
        }
    }



// MARK: - LevelCell

class LevelCell: UICollectionViewCell {
    private let button = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)

        
        var config = UIButton.Configuration.plain()
        config.background.image = UIImage(named: "button_2")
        let largeFont = UIFont.systemFont(ofSize: 30)
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(font: largeFont)
        config.background.imageContentMode = .scaleAspectFit
        
        config.imagePlacement = .top
        config.imageColorTransformer = .init { _ in UIColor.white }
        button.configuration = config
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        let width: CGFloat = 80
        button.frame.size.width = width
        button.frame.size.height = width
        
        contentView.addSubview(button)

        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Метод для конфигурации кнопки
    func configure(with level: Int) {
        button.setTitle("\(level)", for: .normal)
    }
    
    @objc private func buttonTapped() {
        let GameScreenViewController = GameScreenViewController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = GameScreenViewController
            
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
