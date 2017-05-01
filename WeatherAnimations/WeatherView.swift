//
//  WeatherView.swift
//  WeatherAnimations
//
//  Created by Alessandro Musto on 5/1/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit


class WeatherView: UIView {

    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
    var stormButton: UIButton!

    var viewCenterX: CGFloat = 0
    var viewCenterY: CGFloat = 0

    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        viewCenterX = self.center.x
        viewCenterY = self.center.y

        self.backgroundColor = UIColor.blue

        let imageViews = [sun, moon, cloud, lightning]
        for imageView in imageViews {
            self.addSubview(imageView)
        }

        stormButton = UIButton(type: UIButtonType.custom)
        stormButton.frame = CGRect(x: Int(viewCenterX - 25), y: Int(viewCenterY + 200), width: 50, height: 50)
        stormButton.setTitle("🌩", for: UIControlState.normal)
        stormButton.backgroundColor = UIColor.white
        stormButton.layer.borderWidth = 2.0
        stormButton.layer.borderColor = UIColor.gray.cgColor
        stormButton.addTarget(self, action: #selector(onTap(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(stormButton)

        sun.center = CGPoint(x: viewCenterX + 300, y: viewCenterY + 500)
        moon.center = CGPoint(x: viewCenterX + 300, y: viewCenterY + 500)
        cloud.frame = CGRect(x: (width/2) - 75, y: (height/3) * 2, width: 150, height: 75)
        cloud.alpha = 0

        lightning.translatesAutoresizingMaskIntoConstraints = false
        lightning.topAnchor.constraint(equalTo: cloud.bottomAnchor).isActive = true
        lightning.centerXAnchor.constraint(equalTo: cloud.centerXAnchor).isActive = true
        lightning.alpha = 0

    }


    func changeBackgroundColor() {
        UIView.animateKeyframes(withDuration: 20, delay: 0, options: [.allowUserInteraction, .repeat], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.backgroundColor = UIColor.cyan
            }

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.backgroundColor = UIColor.blue
            }

            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25) {
                self.backgroundColor = UIColor.black
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.backgroundColor = UIColor.blue
            }

        }, completion: nil)
    }



    func moveSunAndMoon() {

        UIView.animateKeyframes(withDuration: 20, delay: 0, options: [.calculationModeCubic, .repeat], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.sun.center = CGPoint(x: self.viewCenterX, y: self.viewCenterY - 250)
                self.layoutIfNeeded()
            }

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.sun.center = CGPoint(x: self.viewCenterX - 300, y: self.viewCenterY + 500)
                self.layoutIfNeeded()
            }

            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25) {
                self.moon.center = CGPoint(x: self.viewCenterX, y: self.viewCenterY - 250)
                self.layoutIfNeeded()
            }

            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.moon.center = CGPoint(x: self.viewCenterX - 300, y: self.viewCenterY + 500)
                self.layoutIfNeeded()
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
                self.layoutIfNeeded()
            }

            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25) {
                self.cloud.center = CGPoint(x: self.viewCenterX, y: self.viewCenterY)
                self.layoutIfNeeded()
            }

            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.cloud.center = CGPoint(x: self.viewCenterX, y: self.viewCenterY - 200)
                self.cloud.alpha = 0
                self.layoutIfNeeded()
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
