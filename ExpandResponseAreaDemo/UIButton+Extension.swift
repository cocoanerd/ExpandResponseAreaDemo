//
//  UIButton+Extension.swift
//  ExpandResponseAreaDemo
//
//  Created by mmh on 2020/3/24.
//  Copyright © 2020 mmh. All rights reserved.
//

import UIKit

@objcMembers
class ExpandEdgeInsets: NSObject {
    var top: CGFloat
    var left: CGFloat
    var bottom: CGFloat
    var right: CGFloat
    init(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }

    convenience init(edge: CGFloat = 0) {
        self.init(top: edge, left: edge, bottom: edge, right: edge)
    }
}

extension UIButton{
    
    private struct ExpandeResponseAreaKey {
        static var key = "mmh_expand_response_area"
    }
    /// 需要扩充的点击边距
    @objc var expandClickArea: ExpandEdgeInsets? {
        get {
            if let radius = objc_getAssociatedObject(self, &ExpandeResponseAreaKey.key) as? ExpandEdgeInsets {
                return radius
            }
            return nil
        }
        set {
            objc_setAssociatedObject(self, &ExpandeResponseAreaKey.key, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

    }
    // 重写系统方法修改点击区域
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        super.point(inside: point, with: event)
        var bounds = self.bounds
        if (expandClickArea != nil) {
            let x: CGFloat = -(expandClickArea?.left ?? 0)
            let y: CGFloat = -(expandClickArea?.top ?? 0)
            let width: CGFloat = bounds.width + (expandClickArea?.left ?? 0) + (expandClickArea?.right ?? 0)
            let height: CGFloat = bounds.height + (expandClickArea?.top ?? 0) + (expandClickArea?.bottom ?? 0)
            bounds = CGRect(x: x, y: y, width: width, height: height) //负值是方法响应范围
        }
        return bounds.contains(point)
    }
}
