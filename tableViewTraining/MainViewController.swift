//
//  MainViewController.swift
//  tableViewTraining
//
//  Created by Susanna R on 15.07.2023.
//

import UIKit

class MainViewController: UITableViewController {

        @IBOutlet var catsTableView: UITableView!
                

          
    let cat = Cat.getNewCat()
    
    
          let catsImages = ["Анимекот.jpg", "Стоямба.jpg", "Пробудившийся.jpg", "Йена.jpg", "Невергивап.jpg", "Повар.jpg", "Клерк.jpg", "Офицер.jpg", "Бегемот.jpg", "Лягушка.jpg", "Крайбейби.jpg", "Именинник.jpg", "Инстасамка.jpg", "Малыш.jpg", "Кот.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()          
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cat.count
 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // as! -  это сделали приведение cell к нашему новому классу CustomTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        cell.catsName?.text = cat[indexPath.row].name
        cell.catsLocation.text = cat[indexPath.row].location
        cell.catsQuote.text = cat[indexPath.row].quote
        cell.catsImage?.image = UIImage(named: cat[indexPath.row].image)
        return cell
    }
/*
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
}
*/

   
    // MARK: - Navigation

//    In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    Get the new view controller using segue.destination.
//    Pass the selected object to the new view controller.
//    }

    // нужен этот метод чтобы сработала кнопочка отменить
    @IBAction func cancelAction(_ segue: UIStoryboardSegue) {}
    
    
    
}



/*
 Графический контекст - это объект, который представляет собой область памяти, используемую для рисования графических элементов, таких как изображения, текст, фигуры и т. д. Он служит в качестве целевого холста, на котором происходит рендеринг графики.

 Графический контекст содержит информацию о текущем состоянии рисования, такую как текущий цвет, стиль пера, шрифты и другие параметры. Он также обеспечивает методы для выполнения операций рисования, например, рисование линий, заполнение фигур, наложение текста и т. д.

 В iOS и macOS графический контекст обычно представлен классом UIGraphicsContext или NSGraphicsContext. Он может быть создан для конкретного устройства (например, экран, печатное устройство) или для виртуального контекста, который можно использовать для рисования в памяти без непосредственного отображения на экране.

 В контексте разработки приложений на iOS и macOS, графический контекст используется для создания пользовательского интерфейса, рисования графических элементов, обработки изображений, анимаций и других задач, связанных с графикой.
 */
