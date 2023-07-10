//
//  ViewController.swift
//  tableViewTraining
//
//  Created by Susanna R on 10.07.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let catsName = ["Альфред", "Стоямба", "Пробудившийся", "Йена", "Невергивап", "Повар", "Клерк", "Офицер", "Бегемот", "Лягушка", "Крайбейби", "Именинник", "Инстасамка", "Малыш", "Кот"]
    
    let catsImages = ["Альфред.jpg", "Стоямба.jpg", "Пробудившийся.jpg", "Йена.jpg", "Невергивап.jpg", "Повар.jpg", "Клерк.jpg", "Офицер.jpg", "Бегемот.jpg", "Лягушка.jpg", "Крайбейби.jpg", "Именинник.jpg", "Инстасамка.jpg", "Малыш.jpg", "Кот.jpg"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    

}

extension ViewController {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //тут будем писать что будет отображаться в ячейке
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //привязываем ячейку которую сделали в сториборде
        // dequeueReusableCell означает что мы переиспользуем ячейку Cell
         let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = catsName[indexPath.row]
        cell?.imageView?.image = UIImage(named: catsImages[indexPath.row])
        return cell!
        
    }
    //тут будем писать сколько ячеек будет
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catsName.count
    }
}
