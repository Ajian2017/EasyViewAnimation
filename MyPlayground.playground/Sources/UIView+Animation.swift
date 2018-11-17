import Foundation
import UIKit

internal enum AnimationMode {
    case inSequence
    case inParallel
}

public struct Animation {
    public let duration: TimeInterval
    public let closure: (UIView) -> Void
}

public extension Animation {
    static func fadeIn(duration: TimeInterval = 0.3) -> Animation {
        return Animation(duration: duration, closure: { $0.alpha = 1 })
    }
    
    static func resize(to size: CGSize, duration: TimeInterval = 0.3) -> Animation {
        return Animation(duration: duration, closure: { $0.bounds.size = size })
    }
    
    static func move(byX offsetX: CGFloat,y offsetY:CGFloat, duration: TimeInterval = 0.3) -> Animation{
        return Animation(duration: duration, closure: {
            var frame = $0.frame
            frame.origin.x += offsetX;
            frame.origin.y += offsetY
            $0.frame = frame
        })
    }
}

public final class AnimationToken {
    private let view: UIView
    private let animations: [Animation]
    private let mode: AnimationMode
    private var isValid = true
    
    // We don't want the API user to think that they should create tokens
    // themselves, so we make the initializer internal to the framework
    internal init(view: UIView, animations: [Animation], mode: AnimationMode) {
        self.view = view
        self.animations = animations
        self.mode = mode
    }
    
    deinit {
        // Automatically perform the animations when the token gets deallocated
        perform {}
    }
    
    internal func perform(completionHandler: @escaping () -> Void) {
        // To prevent the animation from being executed twice, we invalidate
        // the token once its animation has been performed
        guard isValid else {
            return
        }
        isValid = false
        switch mode {
        case .inSequence:
            view.performAnimations(animations,
                                   completionHandler: completionHandler)
        case .inParallel:
            view.performAnimationsInParallel(animations,
                                             completionHandler: completionHandler)
        }
    }
}

public extension UIView {
    func animate(inParallel animations: [Animation]) {
        for animation in animations {
            UIView.animate(withDuration: animation.duration) {
                animation.closure(self)
            }
        }
    }
}

public extension UIView {
    func animate(_ animations: [Animation]) {
        // Exit condition: once all animations have been performed, we can return
        guard !animations.isEmpty else {
            return
        }
        // Remove the first animation from the queue
        var animations = animations
        let animation = animations.removeFirst()
        
        // Perform the animation by calling its closure
        UIView.animate(withDuration: animation.duration, animations: {
            animation.closure(self)
        }, completion: { _ in
            // Recursively call the method, to perform each animation in sequence
            self.animate(animations)
        })
    }
}

internal extension UIView {
    func performAnimations(_ animations: [Animation], completionHandler: @escaping () -> Void) {
        // This implementation is exactly the same as before, only now we call
        // the completion handler when our exit condition is hit
        guard !animations.isEmpty else {
            return completionHandler()
        }
        
        var animations = animations
        let animation = animations.removeFirst()
        
        UIView.animate(withDuration: animation.duration, animations: {
            animation.closure(self)
        }, completion: { _ in
            self.performAnimations(animations, completionHandler: completionHandler)
        })
    }
    
    func performAnimationsInParallel(_ animations: [Animation], completionHandler: @escaping () -> Void) {
        // If we have no animations, we can exit early
        guard !animations.isEmpty else {
            return completionHandler()
        }
        
        // In order to call the completion handler once all animations
        // have finished, we need to keep track of these counts
        let animationCount = animations.count
        var completionCount = 0
        
        let animationCompletionHandler = {
            completionCount += 1
            
            // Once all animations have finished, we call the completion handler
            if completionCount == animationCount {
                completionHandler()
            }
        }
        
        // Same as before, only with the call to the animation
        // completion handler added
        for animation in animations {
            UIView.animate(withDuration: animation.duration, animations: {
                animation.closure(self)
            }, completion: { _ in
                animationCompletionHandler()
            })
        }
    }
}

public extension UIView {
    @discardableResult func animate(_ animations: [Animation]) -> AnimationToken {
        return AnimationToken(
            view: self,
            animations: animations,
            mode: .inSequence
        )
    }
    
    @discardableResult func animate(inParallel animations: [Animation]) -> AnimationToken {
        return AnimationToken(
            view: self,
            animations: animations,
            mode: .inParallel
        )
    }
}

public extension UIView {
    @discardableResult func animate(_ animations: Animation...) -> AnimationToken {
        return animate(animations)
    }
    
    @discardableResult func animate(inParallel animations: Animation...) -> AnimationToken {
        return animate(inParallel: animations)
    }
}

public func animate(_ tokens: [AnimationToken]) {
    guard !tokens.isEmpty else {
        return
    }
    var tokens = tokens
    let token = tokens.removeFirst()
    
    token.perform {
        animate(tokens)
    }
}

public func animate(inParallel tokens: [AnimationToken]) {
    guard !tokens.isEmpty else {
        return
    }
    tokens.forEach { (token) in
        token.perform{}
    }
}

public func animate(_ tokens: AnimationToken...) {
    animate(tokens)
}

