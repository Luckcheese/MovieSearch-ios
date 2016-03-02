import UIKit

class CardView: UIView {

    var radius: CGFloat = 2

    override func layoutSubviews() {
        layer.cornerRadius = radius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius)

        layer.masksToBounds = false
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: 0);
        layer.shadowOpacity = 0.3
        layer.shadowRadius=2
        layer.shadowPath = shadowPath.CGPath

        layer.borderColor = UIColor.lightGrayColor().CGColor
        layer.borderWidth = 1.0
    }

    func resizeToFitSubviews() {
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in self.subviews {
            let newWidth = someView.frame.origin.x + someView.frame.width
            let newHeight = someView.frame.origin.y + someView.frame.height
            width = max(width, newWidth)
            height = max(height, newHeight)
        }

        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: width, height: height)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
