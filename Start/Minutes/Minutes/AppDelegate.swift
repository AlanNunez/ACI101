import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    static var entries: FileEntryStore = FileEntryStore()
    
    static var customPasteboard = UIPasteboard(name: UIPasteboardName("CustomPasteboard"), create: true)
    
    lazy var splashView: UIImageView = {
       let imageView = UIImageView(frame: self.window!.frame)
        imageView.backgroundColor = .green
        return imageView
    }()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        UIPasteboard.general.items = [[String: Any]()]
        self.window?.addSubview(splashView)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        splashView.removeFromSuperview()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
