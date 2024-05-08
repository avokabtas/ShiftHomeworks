//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 08.05.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    // TODO: Это Черновик!
    // Сделать:
    // - Картинка круглая UIImageView
    // - Тип обуви label Type:
    // - Для чего лучше использовать label Best For:
    // - Цена Price:
    // Кнопка "заказать"
    
    var runningShoes: RunningShoes
    
    init(runningShoes: RunningShoes) {
        self.runningShoes = runningShoes
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "\(runningShoes.brand) \(runningShoes.model)"
    }
    
    
}
