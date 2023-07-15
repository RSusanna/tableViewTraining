//
//  CatModel.swift
//  tableViewTraining
//
//  Created by Susanna R on 15.07.2023.
//

import Foundation


struct Cat {
    
    var name: String
    var location: String
    var quote: String
    var image: String
    
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
        
        var cats = [Cat]()
        for cat in catsNames {
            cats.append(Cat(name: cat, location: "приют 1", quote: "готов найти семью", image: cat))
        }
        return cats
    }
    
}

