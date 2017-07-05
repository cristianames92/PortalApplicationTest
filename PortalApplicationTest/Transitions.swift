//
//  Transitions.swift
//  Sample
//
//  Created by Cristian Ames Masek on 6/15/17.
//  Copyright © 2017 Wolox. All rights reserved.
//

import Portal

// MARK: - Routes
enum Route: Portal.Route {
    
    case main
    case profile
    
    var previous: Route? {
        switch self {
        case .main:
            return .none
        case .profile:
            return .main
        }
    }
    
}

// MARK: - Navigator
enum Navigator: Equatable {
    
    case unique
    
}

// MARK: - States
struct State {
    let currentRoute: Route
    let count: UInt
}

// MARK: - Messages
enum Message {
    
    case applicationStarted
    case routeChanged(to: Route)
    case incrementCount(by: UInt)
    
}


