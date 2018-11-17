import Foundation
import UIKit

public class RandomColorView : UIView{
    
    @objc public func handleTap(tap:UITapGestureRecognizer){
        backgroundColor = UIColor.random()
        let animation = CATransition()
        animation.type = .moveIn
        layer.add(animation, forKey: "animation")
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.random()
        let tap = UITapGestureRecognizer(target: self, action: #selector(RandomColorView.handleTap(tap:)));
        addGestureRecognizer(tap)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
