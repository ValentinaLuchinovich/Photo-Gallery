//
//  PhotosCollectionViewController.swift
//  PhotoApp
//
//  Created by Валентина Лучинович on 13.12.2021.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    // Массив с фотографиями
    let photos = ["Байкал", "Барселона", "Дубай", "Москва", "Санкт-Петербург", "Сочи", "Стокгольм", "Хельсинки"]
    
    // Количество ячеек в ряду
    let itemsPerRow: CGFloat = 2
    // Отступы от секций
    let sectionInSerts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 70, height: 70)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 1
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
//        layout.scrollDirection = .vertical
//
//        collectionView.showsVerticalScrollIndicator = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            photoVC.image = cell.imageView.image
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        cell.imageView.image = image
        return cell
    }

}

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {

    // Размер ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Рассчитываем расстояние отступов
        let paddingWidth = sectionInSerts.left * (itemsPerRow + 1)
        // Выесняем доступную для ячеек ширину
        let availableWidth = collectionView.frame.width - paddingWidth
        // Вычесляем ширину ячейки (будет равна высоте)
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    // Границы между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInSerts
    }

    // Отступ между строками и столбцами
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInSerts.left
    }

    // Отступ между элементами в ячеках
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInSerts.left
    }
}
