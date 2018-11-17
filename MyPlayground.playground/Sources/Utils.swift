import Foundation
import UIKit

extension UIColor{
    public static func random()->UIColor{
        return UIColor.init(red: Float.random0To1, green: Float.random0To1, blue: Float.random0To1, alpha: 1)
    }
}
extension Float{
    public static var random0To1:CGFloat{
        get{
            let random = Float(arc4random() % 255)/255.0;
            return CGFloat(random)
        }
    }
}
