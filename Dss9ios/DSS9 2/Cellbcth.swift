

import UIKit

class CellBcth: UITableViewCell {
    
    @IBOutlet weak var lbmuc: UILabel!
     @IBOutlet weak var lbthuchien: UILabel!
     @IBOutlet weak var lbkehoach: UILabel!
     @IBOutlet weak var lbptram: UILabel!
     @IBOutlet weak var lbloai: UILabel!
    
    
    @IBInspectable var cornerRadius: CGFloat? = 5
    
    @IBInspectable var shadowOffsetWidth: Int? = 0
    @IBInspectable var shadowOffsetHeight: Int? = 2
    @IBInspectable var shadowColor: UIColor? = .black
    @IBInspectable var shadowOpacity: Float? = 0.3
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius!
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius!)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth!, height: shadowOffsetHeight!);
        layer.shadowOpacity = shadowOpacity!
        layer.shadowPath = shadowPath.cgPath
    }
    
}



