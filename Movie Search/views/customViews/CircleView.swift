import UIKit

@IBDesignable
class CircleView: UIView {
    
    override func drawRect(rect: CGRect) {
        let centerX = bounds.size.width / 2
        let centerY = bounds.size.height / 2
        let arcCenter = CGPoint(x: centerX, y: centerY)

        let circlePath = UIBezierPath(arcCenter: arcCenter, radius: CGFloat(centerX), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.CGPath

        shapeLayer.fillColor = UIColor.redColor().CGColor

        layer.addSublayer(shapeLayer)
    }
}
