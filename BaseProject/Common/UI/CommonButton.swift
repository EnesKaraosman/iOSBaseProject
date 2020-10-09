//
//  BaseButton.swift
//  BaseProject
//
//  Created by Enes Karaosman on 18.11.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit

extension UIButton {
    
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        button.transform = transform
            }, completion: nil)
    }
    
}

@IBDesignable
public class CommonButton: UIButton {
    
    public typealias TapHandler = (() -> Void)
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet { super.setNeedsLayout() }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet { super.setNeedsLayout() }
    }
    
    @IBInspectable public var borderColorHighlighted: UIColor = UIColor.clear {
        didSet { super.setNeedsLayout() }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet { super.setNeedsLayout() }
    }
    
    @IBInspectable public var normalBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.setBackgroundColor(color: normalBackgroundColor, forUIControlState: .normal)
        }
    }
    
    @IBInspectable public var highlightedBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.setBackgroundColor(color: highlightedBackgroundColor, forUIControlState: .highlighted)
        }
    }
    
    @IBInspectable public var disabledBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.setBackgroundColor(color: disabledBackgroundColor, forUIControlState: .disabled)
        }
    }
    
    @IBInspectable public var selectedBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.setBackgroundColor(color: selectedBackgroundColor, forUIControlState: .selected)
        }
    }
    
    public var tapHandler: TapHandler? {
        didSet {
            self.removeTarget(self, action: #selector(tapped), for: .touchUpInside)
            guard tapHandler != nil else { return }
            self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        }
    }
    
    public init(title: String, action: @escaping TapHandler) {
        super.init(frame: .zero)
        commonInit()
        self.setTitle(title, for: .normal)
        self.tapHandler = action
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 44)
    }
    
    @objc private func tapped() {
        self.tapHandler?()
        print(#function)
    }
    
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        titleLabel?.font = .init(.body, .semiBold)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius == 0.0 ? bounds.height / 2 : cornerRadius
        layer.borderColor = isHighlighted ? borderColorHighlighted.cgColor : borderColor.cgColor
        layer.borderWidth = borderWidth
    }
    
    private func imageWithColor(color: UIColor?) -> UIImage? {
        guard let color = color else { return nil }
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    private func setBackgroundColor(color: UIColor?, forUIControlState state: UIControl.State) {
        self.setBackgroundImage(imageWithColor(color: color), for: state)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct CommonButtonRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return CommonButton(title: "Common Button") {
            print("Bom")
        }
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct CommonButtonRepresentable_Preview: PreviewProvider {
    static var previews: some View {
        CommonButtonRepresentable()
            .frame(width: nil, height: 44)
            .background(Color.red)
            .cornerRadius(22)
            .padding()
    }
}
#endif
