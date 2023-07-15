//
//  MainViewController.swift
//  tableViewTraining
//
//  Created by Susanna R on 15.07.2023.
//

import UIKit

class MainViewController: UITableViewController {

        @IBOutlet var catsTableView: UITableView!
                
        let catsNames = ["Анимекот", "Стоямба", "Пробудившийся", "Йена", "Невергивап", "Повар", "Клерк", "Офицер", "Бегемот", "Лягушка", "Крайбейби", "Именинник", "Инстасамка", "Малыш", "Кот"]
          
          let catsImages = ["Анимекот.jpg", "Стоямба.jpg", "Пробудившийся.jpg", "Йена.jpg", "Невергивап.jpg", "Повар.jpg", "Клерк.jpg", "Офицер.jpg", "Бегемот.jpg", "Лягушка.jpg", "Крайбейби.jpg", "Именинник.jpg", "Инстасамка.jpg", "Малыш.jpg", "Кот.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()          
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return catsNames.count
 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // as! -  это сделали приведение cell к нашему новому классу CustomTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        cell.catsName?.text = catsNames[indexPath.row]
        cell.catsImage?.image = UIImage(named: catsNames[indexPath.row])
        return cell
    }
/*
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
}
*/

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
extension UIImage {
    func scaledToFill(targetSize: CGSize) -> UIImage? {
        
        //получаем оригинальный размер изображения
        let imageSize = self.size

        //задаем изначальные параметры изображения
        let scaledSize = CGSize(width: imageSize.width, height: imageSize.height)
        //UIGraphicsBeginImageContextWithOptions: Это метод, который создает графический контекст. Он принимает размеры (targetSize) и дополнительные параметры для конфигурации контекста.
        //targetSize: Размеры, переданные этому методу, определяют размер холста (графического контекста), на котором будет происходить рисование. В данном случае, targetSize является размером, который вы хотите использовать для масштабирования изображения.
        
       // false: Это значение булева флага, указывающего, должен ли графический контекст учитывать масштаб экрана. В данном случае false означает, что масштабирование не должно учитывать масштаб экрана.

       // 0.0: Это значение, связанное с параметром opaque, указывающим, должен ли графический контекст быть непрозрачным или прозрачным. Значение 0.0 означает, что графический контекст будет прозрачным.
        
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0.0)
        
        
      /*
        (targetSize.width - scaledSize.width) / 2 используется для выравнивания масштабированного изображения по центру графического контекста при рисовании.

       Деление на 2 выполняется, чтобы определить горизонтальное смещение изображения внутри контекста. Поскольку размер изображения меньше размера контекста, оно должно быть выровнено по центру, чтобы оставить одинаковые отступы с обеих сторон.

       Аргумент size в CGRect(origin: CGPoint(x: (targetSize.width - scaledSize.width) / 2, y: (targetSize.height - scaledSize.height) / 2), size: scaledSize) определяет размер прямоугольника, в который будет вписано масштабированное изображение. scaledSize - это размер масштабированного изображения, а origin - это его точка начала координат (верхний левый угол) в контексте рисования.
       */
        self.draw(in: CGRect(origin: CGPoint(x: (targetSize.width - scaledSize.width) / 2, y: (targetSize.height - scaledSize.height) / 2), size: scaledSize))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //возвращаем исправленное изображение
        return scaledImage
    }
}

/*
 Графический контекст - это объект, который представляет собой область памяти, используемую для рисования графических элементов, таких как изображения, текст, фигуры и т. д. Он служит в качестве целевого холста, на котором происходит рендеринг графики.

 Графический контекст содержит информацию о текущем состоянии рисования, такую как текущий цвет, стиль пера, шрифты и другие параметры. Он также обеспечивает методы для выполнения операций рисования, например, рисование линий, заполнение фигур, наложение текста и т. д.

 В iOS и macOS графический контекст обычно представлен классом UIGraphicsContext или NSGraphicsContext. Он может быть создан для конкретного устройства (например, экран, печатное устройство) или для виртуального контекста, который можно использовать для рисования в памяти без непосредственного отображения на экране.

 В контексте разработки приложений на iOS и macOS, графический контекст используется для создания пользовательского интерфейса, рисования графических элементов, обработки изображений, анимаций и других задач, связанных с графикой.
 */
