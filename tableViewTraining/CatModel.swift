//
//  CatModel.swift
//  tableViewTraining
//
//  Created by Susanna R on 15.07.2023.
//

import UIKit


struct Cat {
    
    var name: String
    var location: String?
    var quote: String?
    var image: UIImage?
    var catsPhoto: String?
    
    static   let catsNames = ["Анимекот",
                     "Стоямба",
                     "Пробудившийся",
                     "Йена",
                     "Невергивап",
                     "Повар",
                     "Клерк",
                     "Офицер",
                     "Бегемот",
                     "Лягушка",
                     "Крайбейби",
                     "Именинник",
                     "Инстасамка",
                     "Малыш",
                     "Кот"]
    
    
 static   func getNewCat() -> [Cat] {
        
        var catCurrentGuest = [Cat]()
     
        for cat in catsNames {
            catCurrentGuest.append(Cat(name: cat, location: "приют 1", quote: "готов найти семью", image: nil, catsPhoto: cat))
        }
        return catCurrentGuest
    }
    
}

