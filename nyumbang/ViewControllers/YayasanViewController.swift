//
//  YayasanViewController.swift
//  nyumbang
//
//  Created by Bill Tanthowi Jauhari on 27/04/19.
//  Copyright © 2019 Apple Developer Academy - Kelompok 6. All rights reserved.
//

import UIKit

class YayasanViewController: UIViewController {

    
    @IBOutlet weak var listOfSearch: UITableView!
    
    var yayasan: [Yayasan] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yayasan = createYayasanArray()
    }
    
    func createYayasanArray() -> [Yayasan] {
        
        let description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
        
        let place = "Tangerang"
        
        let video1 =  Yayasan(title: "Yayasan Sabilillah Malang", description: description, photo: UIImage(imageLiteralResourceName: "vlog-4.png"), place: place)
        let video2 =  Yayasan(title: "Lembaga Amil Zakat NU", description: description, photo: UIImage(imageLiteralResourceName: "buku.png"), place: place)
        let video3 =  Yayasan(title: "Lembaga Amil Zakat Muhammadiyah", description: description, photo: UIImage(imageLiteralResourceName: "dev-setup.png"), place: place)
        let video4 =  Yayasan(title: "Badan Amil Zakat Nasional", description: description, photo: UIImage(imageLiteralResourceName: "pangan.png"), place: place)
        let video5 =  Yayasan(title: "Active Cepat Tanggap", description: description, photo: UIImage(imageLiteralResourceName: "palu.png"), place: place)
        let video6 =  Yayasan(title: "LazisNU", description: description, photo: UIImage(imageLiteralResourceName: "vlog-4.png"), place: place)
        let video7 =  Yayasan(title: "Yayasan Sabilillah Malang", description: description, photo: UIImage(imageLiteralResourceName: "ss-delegates.png"), place: place)
        let video8 =  Yayasan(title: "Lembaga Amil Zakat NU", description: description, photo: UIImage(imageLiteralResourceName: "int-overview.png"), place: place)
        let video9 =  Yayasan(title: "Lembaga Amil Zakat Muhammadiyah", description: description, photo: UIImage(imageLiteralResourceName: "buku.png"), place: place)
        let video10 =  Yayasan(title: "Badan Amil Zakat Nasional", description: description, photo: UIImage(imageLiteralResourceName: "pangan.png"), place: place)
        let video11 =  Yayasan(title: "Active Cepat Tanggap", description: description, photo: UIImage(imageLiteralResourceName: "palu.png"), place: place)
        let video12 =  Yayasan(title: "LazisNU", description: description, photo: UIImage(imageLiteralResourceName: "beginner-first-app.png"), place: place)
        
        return [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10, video11, video12]
    }
    
//    func createAcaraArray() -> [Yayasan] {
//
//        let description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
//
//        let video1 =  Yayasan(title: "Penggalangan Barang Kantor Malang", description: description, photo: UIImage(imageLiteralResourceName: "vlog-4.png"))
//        let video2 =  Yayasan(title: "Charity for life", description: description, photo: UIImage(imageLiteralResourceName: "buku.png"))
//        let video3 =  Yayasan(title: "Buku anda membangun bangsa", description: description, photo: UIImage(imageLiteralResourceName: "dev-setup.png"))
//        let video4 =  Yayasan(title: "Hidup indah dengan beramal", description: description, photo: UIImage(imageLiteralResourceName: "pangan.png"))
//        let video5 =  Yayasan(title: "Amal Festival", description: description, photo: UIImage(imageLiteralResourceName: "palu.png"))
//        let video6 =  Yayasan(title: "Muslim Expo and Amal", description: description, photo: UIImage(imageLiteralResourceName: "vlog-4.png"))
//        let video7 =  Yayasan(title: "Hari jadi Malang bersama Charity", description: description, photo: UIImage(imageLiteralResourceName: "ss-delegates.png"))
//        let video8 =  Yayasan(title: "Romadhon berzakat", description: description, photo: UIImage(imageLiteralResourceName: "int-overview.png"))
//        let video9 =  Yayasan(title: "Zakat Mal untuk membantu sesama", description: description, photo: UIImage(imageLiteralResourceName: "buku.png"))
//        let video10 =  Yayasan(title: "Baznas Berbagi", description: description, photo: UIImage(imageLiteralResourceName: "pangan.png"))
//        let video11 =  Yayasan(title: "Indonesia charity", description: description, photo: UIImage(imageLiteralResourceName: "palu.png"))
//        let video12 =  Yayasan(title: "NU beramal", description: description, photo: UIImage(imageLiteralResourceName: "beginner-first-app.png"))
//
//        return [video5, video2, video7, video3, video1, video6, video4, video8, video9, video10, video11, video12]
//    }
    
    @IBOutlet weak var searchSomething: UISearchBar!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show the navigation bar
    }
    
    
}


extension YayasanViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yayasan.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yayasanKita = yayasan[indexPath.row]
        let cell = listOfSearch.dequeueReusableCell(withIdentifier: "YayasanCell") as! YayasanCell
        cell.setFoundation(foundation: yayasanKita)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = listOfSearch.indexPathForSelectedRow
        let currentDiscovery = listOfSearch.cellForRow(at: indexPath!) as! YayasanCell
        
        guard let discoveryDetail = segue.destination as? YayasanDetailViewController else { return }
        discoveryDetail.yayasan = currentDiscovery.yayasan
        
    }
    
}


