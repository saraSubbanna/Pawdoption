//
//  DeepLookViewController.swift
//  Bored - Nothing to Do
//
//  Created by Sara Subbanna on 4/9/16.
//  Copyright (c) 2016 Sara Subbanna. All rights reserved.
//

import UIKit
import MapKit

class DeepLookViewController: UIViewController, UISearchBarDelegate, MKMapViewDelegate {

    var searchController:UISearchController!
    var localSearchRequest:MKLocalSearchRequest!
    var localSearch:MKLocalSearch!
    var localSearchResponse:MKLocalSearchResponse!
    
    var name: String?
    var image: UIImage?
    var blurb: String?
    var location: String?
    
    @IBOutlet weak var petMap: MKMapView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var BlurbBox: UITextView!
    @IBOutlet weak var PetImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameLabel.text = name
        BlurbBox.text = blurb
        PetImage.image = image
        petMap.delegate = self

        setMap()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //2
    func setMap() {
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = location
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.startWithCompletionHandler { (localSearchResponse, error) -> Void in
    
            if localSearchResponse == nil{
                var alert = UIAlertView(title: nil, message: "Pet home not found", delegate: self, cancelButtonTitle: "Okay")
                alert.show()
                return
            }
            //3
            self.petMap.addAnnotation(MapPin(coordinate: CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude: localSearchResponse!.boundingRegion.center.longitude), title: "Pet's Home"))

            
            let span = MKCoordinateSpanMake(0.9, 0.9)
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude: localSearchResponse!.boundingRegion.center.longitude), span: span)
            self.petMap.setRegion(region, animated: true)
            
            //self.mapView.addAnnotation(self.pinAnnotationView.annotation)
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class MapPin : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
    }
}
