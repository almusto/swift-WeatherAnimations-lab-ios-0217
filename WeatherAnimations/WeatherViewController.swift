//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    
    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
  var stormButton: UIButton!

    var viewCenterX: CGFloat = 0
    var viewCenterY: CGFloat = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

      viewCenterX = self.view.center.x
      viewCenterY = self.view.center.y

      self.view.backgroundColor = UIColor.blue

      let imageViews = [sun, moon, cloud, lightning]
      for imageView in imageViews {
        view.addSubview(imageView)
      }


      stormButton = UIButton(type: UIButtonType.custom)
      stormButton.frame = CGRect(x: Int(viewCenterX - 25), y: Int(viewCenterY + 200), width: 50, height: 50)
      stormButton.setTitle("🌩", for: UIControlState.normal)
      stormButton.backgroundColor = UIColor.white
      stormButton.layer.borderWidth = 2.0
      stormButton.layer.borderColor = UIColor.gray.cgColor
      stormButton.addTarget(self, action: #selector(onTap(_:)), for: UIControlEvents.touchUpInside)
      view.addSubview(stormButton)


      sun.center = CGPoint(x: viewCenterX + 300, y: viewCenterY + 500)

      moon.center = CGPoint(x: viewCenterX + 300, y: viewCenterY + 500)

      cloud.center = CGPoint(x: viewCenterX, y: viewCenterY)
      cloud.alpha = 0

      lightning.translatesAutoresizingMaskIntoConstraints = false
      lightning.topAnchor.constraint(equalTo: cloud.bottomAnchor).isActive = true
      lightning.centerXAnchor.constraint(equalTo: cloud.centerXAnchor).isActive = true
      lightning.alpha = 0





    }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    changeBackgroundColor()
    moveSunAndMoon()

  }


  func changeBackgroundColor() {
    UIView.animateKeyframes(withDuration: 20, delay: 0, options: [.allowUserInteraction, .repeat], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
        self.view.backgroundColor = UIColor.cyan
      }

      UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
        self.view.backgroundColor = UIColor.blue
      }

      UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25) {
        self.view.backgroundColor = UIColor.black
      }
      UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
        self.view.backgroundColor = UIColor.blue
      }

    }, completion: nil)
  }



  func moveSunAndMoon() {

    UIView.animateKeyframes(withDuration: 20, delay: 0, options: [.calculationModeCubic, .repeat], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
        self.sun.center = CGPoint(x: self.viewCenterX, y: self.viewCenterY - 250)
        self.view.layoutIfNeeded()
      }

      UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
        self.sun.center = CGPoint(x: self.viewCenterX - 300, y: self.viewCenterY + 500)
        self.view.layoutIfNeeded()
      }

      UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25) {
        self.moon.center = CGPoint(x: self.viewCenterX, y: self.viewCenterY - 250)
        self.view.layoutIfNeeded()
      }

      UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
        self.moon.center = CGPoint(x: self.viewCenterX - 300, y: self.viewCenterY + 500)
        self.view.layoutIfNeeded()
      }

    }, completion: {_ in
      self.sun.center = CGPoint(x: self.viewCenterX + 300, y: self.viewCenterY + 500)
      self.moon.center = CGPoint(x: self.viewCenterX + 300, y: self.viewCenterY + 500)
    })
  }

  func onTap(_ sender: UIButton) {
    moveCloud()
    flash()

  }

  func moveCloud() {

    UIView.animateKeyframes(withDuration: 8, delay: 0, options: [], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
        self.cloud.alpha = 1
      }

      UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
        self.cloud.center = CGPoint(x: self.viewCenterX, y: self.viewCenterY - 200)
        self.view.layoutIfNeeded()
      }

      UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25) {
        self.cloud.center = CGPoint(x: self.viewCenterX, y: self.viewCenterY)
        self.view.layoutIfNeeded()
      }

      UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
        self.cloud.center = CGPoint(x: self.viewCenterX, y: self.viewCenterY - 200)
        self.cloud.alpha = 0
        self.view.layoutIfNeeded()

      }
    }, completion: {_ in
      self.cloud.center = CGPoint(x: self.viewCenterX, y: self.viewCenterY)

    })
  }

  func flash() {
    UIView.animateKeyframes(withDuration: 1, delay: 3, options: [.autoreverse], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/6) {
        self.lightning.alpha = 1
      }
      UIView.addKeyframe(withRelativeStartTime: 1/6, relativeDuration: 1/6) {
        self.lightning.alpha = 0

      }
      UIView.addKeyframe(withRelativeStartTime: 2/6, relativeDuration: 1/6) {
        self.lightning.alpha = 1

      }
      UIView.addKeyframe(withRelativeStartTime: 3/6, relativeDuration: 1/6) {
        self.lightning.alpha = 0

      }
      UIView.addKeyframe(withRelativeStartTime: 4/6, relativeDuration: 1/6) {
        self.lightning.alpha = 1

      }
      UIView.addKeyframe(withRelativeStartTime: 5/6, relativeDuration: 1/6) {
        self.lightning.alpha = 0
      }
    })
  }


}


