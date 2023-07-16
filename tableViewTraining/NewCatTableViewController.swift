//
//  NewCatTableViewController.swift
//  tableViewTraining
//
//  Created by Susanna R on 16.07.2023.
//

import UIKit

class NewCatTableViewController: UITableViewController {
    
    @IBOutlet var imageOfCat: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
    }
    //MARK: - Работа с алерт контроллером
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            // прописываем логику если индекс ячейки 0 (добавить фото/сфоткать/отменить)
        if indexPath.row == 0 {
            
            // создаем константы чтобы загрузить фото в алерт
            let cameraIcon = UIImage(imageLiteralResourceName: "camera")
            let photoIcon = UIImage(imageLiteralResourceName: "photo")
            
            // что должно быть в алерте:
            let actionSheet = UIAlertController(
                                title: nil,
                                message: nil,
                                preferredStyle: .actionSheet)
            // логика для камеры
            let camera = UIAlertAction(title: "Камера", style: .default) { _ in
            // что делаем:
                self.chooseImagePicker(sourse: .camera)
            }
            // вставляем в алерт иконку фоточек
            camera.setValue(cameraIcon, forKey: "image")
            // текст двигаем вправо чтобы красиво было (до этого по сердеке был)
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            // там где камера вставляем фото
            let photo = UIAlertAction(title: "Добавить фото", style: .default) { _ in
            // что делаем:
                self.chooseImagePicker(sourse: .photoLibrary)
            }
            // вставляем в алерт иконку фоточек
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Отмена", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            // и соответственно вызываем алертконтроллер
            present(actionSheet, animated: true)
        } else {
            //в противном случае закрываем клаву
            view.endEditing(true)
        }
    }
}

//MARK: - Работа с клавиатурой
// Логика для скрытия клавиатуры при нажатии на done
extension NewCatTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

//MARK: - Работа с изображением

extension NewCatTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(sourse: UIImagePickerController.SourceType) {
        
        // проверка на доступность источника выбора изображения
        
        if UIImagePickerController.isSourceTypeAvailable(sourse) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
           // разрешает редактировать изображение прежде чем загрузить, например масштабировать
            imagePicker.allowsEditing = true
            imagePicker.sourceType = sourse
            present(imagePicker, animated: true)
            }
        }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageOfCat.image = info[.editedImage] as? UIImage
        imageOfCat.contentMode = .scaleAspectFill
        imageOfCat.clipsToBounds = true
        dismiss(animated: true)
    }
    
    
    }

