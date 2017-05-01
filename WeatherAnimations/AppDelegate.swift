

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // This property is in all AppDelegate files by default
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = WeatherViewController()
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()


        return true
    }
    
}

