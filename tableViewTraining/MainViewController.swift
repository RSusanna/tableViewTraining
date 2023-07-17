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
    
          var catsImages = ["Анимекот.jpg", "Стоямба.jpg", "Пробудившийся.jpg", "Йена.jpg", "Невергивап.jpg", "Повар.jpg", "Клерк.jpg", "Офицер.jpg", "Бегемот.jpg", "Лягушка.jpg", "Крайбейби.jpg", "Именинник.jpg", "Инстасамка.jpg", "Малыш.jpg", "Кот.jpg"]
    
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
            cell.catsImage.image =  UIImage(named: catGuest.catsImage!)
        } else {
            cell.catsImage.image = catGuest.image
        }
        return cell
    }

   
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
