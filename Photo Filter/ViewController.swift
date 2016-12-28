//
//  ViewController.swift
//  Photo Filter
//
//  Created by Daniel Springer on 28/12/2016.
//  Copyright © 2016 Daniel Springer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    // create a place to render the filtered image
    let context = CIContext(options: nil)
    
    @IBAction func applyFilter(_ sender: Any) {
        // create an image to filter
        let inputImage = CIImage(image: photoImageView.image)
        // create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        // apply a filter to the image
        let filteredImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        // render the filtered image
        let renderedImage = context.createCGImage(filteredImage, fromRect: filteredImage.extent())
        // Reflect the change back in the interface
        photoImageView.image = (CGImage: renderedImage)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

