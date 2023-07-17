//
//  MainViewController.swift
//  tableViewTraining
//
//  Created by Susanna R on 15.07.2023.
//

import UIKit

class MainViewController: UITableViewController {

        @IBOutlet var catsTableView: UITableView!
    @IBAction func cancelAction(_ sender: Any) {
    dismiss(animated: true)

    }

    
          
    var cats = Cat.getNewCat()
    //15.21
    
          var catsImagesNames = ["Анимекот.jpg", "Стоямба.jpg", "Пробудившийся.jpg", "Йена.jpg", "Невергивап.jpg", "Повар.jpg", "Клерк.jpg", "Офицер.jpg", "Бегемот.jpg", "Лягушка.jpg", "Крайбейби.jpg", "Именинник.jpg", "Инстасамка.jpg", "Малыш.jpg", "Кот.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()          
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cats.count
 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // as! -  это сделали приведение cell к нашему новому классу CustomTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        
        let catGuest = cats[indexPath.row]
    
        cell.catsName.text = catGuest.name
        cell.catsLocation.text = catGuest.location
        cell.catsQuote.text = catGuest.quote
        
        if catGuest.image == nil {
            cell.catsImage.image =  UIImage(named: catGuest.catsPhoto!) //тут ошибка
        } else {
            cell.catsImage.image = catGuest.image
        }
        return cell
    }
/*
 Ошибка "-[UITableViewCellContentView text]: unrecognized selector sent to instance" возникает, когда вы пытаетесь вызвать метод text на объекте UITableViewCellContentView, который не имеет такого метода. Это может происходить, если вы обращаетесь к неправильному объекту или неправильно настроили связи между компонентами интерфейса и кодом.

 В вашем коде, ошибка находится в методе tableView(_:cellForRowAt:) в классе MainViewController. В этом методе, при установке текстового содержимого для ячейки, вы обращаетесь к неправильному объекту catsName, catsLocation и catsQuote.

 Чтобы исправить ошибку, убедитесь, что вы правильно связали эти элементы пользовательского интерфейса с соответствующими свойствами и методами вашего кода. Убедитесь, что вы обращаетесь к правильным объектам в методе tableView(_:cellForRowAt:) и используете правильные свойства и методы для установки текста.

 Проверьте, что у вас есть правильные идентификаторы ячеек в сториборде и что вы правильно связали элементы ячейки с соответствующими свойствами класса CustomTableViewCell.

 Также, убедитесь, что у вас нет других мест в коде, где вы пытаетесь обращаться к неправильным объектам или вызывать неправильные методы для текстового содержимого ячеек.
 */
    // MARK: - Navigation

//    In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    Get the new view controller using segue.destination.
//    Pass the selected object to the new view controller.
//    }

    // нужен этот метод чтобы сработала кнопочка отменить
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newCatVC = segue.source as? NewCatTableViewController else { return }
        newCatVC.saveNewCat()
        cats.append(newCatVC.newCat!)
        tableView.reloadData()
    }
}
