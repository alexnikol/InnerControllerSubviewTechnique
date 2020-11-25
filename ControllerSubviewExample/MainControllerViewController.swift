//
//  MainControllerViewController.swift
//  ControllerSubviewExample
//
//  Created by Alexander Nikolaychuk on 25.11.2020.
//

import UIKit

class MainControllerViewController: UIViewController {

    var firstController = FirstController()
    var secondController = SecondsController()
    @IBOutlet weak var parentWrap: UIView!
    var activeIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateVisibleController()
    }
    
    @IBAction func `switch`(_ sender: Any) {
        
        activeIndex = activeIndex == 0 ? 1 : 0
        
        updateVisibleController()
    }
    
    func updateVisibleController() {
        parentWrap.subviews.forEach { $0.isHidden = true }
        if activeIndex == 0 {
            parentWrap.bringSubviewToFront(firstController.view)
            firstController.view.isHidden = false
        } else if activeIndex == 1 {
            parentWrap.bringSubviewToFront(secondController.view)
            secondController.view.isHidden = false
        }
    }
    
    func setupView() {
        self.parentWrap.addSubview(firstController.view)
        self.parentWrap.addSubview(secondController.view)
        addChild(firstController)
        addChild(secondController)
        
        parentWrap.subviews.forEach { $0.isHidden = true }
        addCNST(newView: firstController.view, view: parentWrap)
        addCNST(newView: secondController.view, view: parentWrap)
    }
    
    func addCNST(newView: UIView, view: UIView) {
        newView.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
            let verticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
            let widthConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
            let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }

}
