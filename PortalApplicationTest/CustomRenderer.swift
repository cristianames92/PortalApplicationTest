//
//  CustomRenderer.swift
//  Sample
//
//  Created by Cristian Ames Masek on 6/15/17.
//  Copyright © 2017 Wolox. All rights reserved.
//

import Portal
import UIKit

class CustomRenderer: UIKitCustomComponentRenderer {
    typealias RouteType = Route
    typealias MessageType = Message
    
    fileprivate let _parentContainer: ContainerController
    
    required init(container: ContainerController) {
        _parentContainer = container
    }
    
    func renderComponent(_ componentDescription: CustomComponentDescription, inside view: UIView, dispatcher: @escaping (Action) -> Void) {
    }
    
}

