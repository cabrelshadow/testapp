import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var field = UITextField()
    var protectionView: UIView? // Vue de protection

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    override func applicationWillResignActive(_ application: UIApplication) {
        // Ajouter une vue pour protéger l'écran
        addProtectionView()
    }

    override func applicationDidBecomeActive(_ application: UIApplication) {
        // Retirer la vue de protection
        removeProtectionView()
    }

    private func addProtectionView() {
        // Créer une vue noire qui couvre tout l'écran
        if protectionView == nil {
            protectionView = UIView(frame: window?.frame ?? UIScreen.main.bounds)
            protectionView?.backgroundColor = UIColor.black
            protectionView?.alpha = 1.0
        }
        // Ajouter cette vue à la fenêtre principale
        if let protectionView = protectionView, let window = window {
            window.addSubview(protectionView)
        }
    }

    private func removeProtectionView() {
        // Supprimer la vue noire lorsqu'elle n'est plus nécessaire
        protectionView?.removeFromSuperview()
        protectionView = nil
    }
}
