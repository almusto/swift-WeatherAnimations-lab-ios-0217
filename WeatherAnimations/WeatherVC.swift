

import UIKit

class WeatherVC: UIViewController {

    var weatherView: WeatherView!

    override func viewDidLoad() {
        super.viewDidLoad()

        weatherView = WeatherView(frame: view.frame)
        self.view = weatherView


    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        weatherView.changeBackgroundColor()
        weatherView.moveSunAndMoon()

    }
}


