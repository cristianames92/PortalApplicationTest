//
//  Effects.swift
//  Sample
//
//  Created by Cristian Ames Masek on 6/15/17.
//  Copyright © 2017 Wolox. All rights reserved.
//

import Foundation
import Portal

enum SampleSubscription {
    
    case test
    
}

extension SampleSubscription: Equatable {
    
    static func == (lhs: SampleSubscription, rhs: SampleSubscription) -> Bool {
        return true
    }
    
}

enum Command {
    
}

class SampleCommandExecutor: Portal.CommandExecutor {
    
    func execute(command: Command, dispatch: @escaping (Action) -> Void) {
        execute(command: command).map { dispatch($0) }
    }
    
    func execute(command: Command) -> Action? {
        return .none
    }
    
}

final class SampleSubscriptionManager: Portal.SubscriptionManager {
    typealias RouteType = Route
    
    func add(subscription: SampleSubscription, dispatch: @escaping (Action) -> Void) {
        //        switch subscription {
        //
        //        case .tracker(let messageTransformer):
        //            _ = trackerApplication.run { trackerMessage in
        //                if let trackerMessage = messageTransformer(trackerMessage) {
        //                    dispatch(.sendMessage(trackerMessage))
        //                }
        //            }
        //
        //        }
    }
    
    func remove(subscription: SampleSubscription) {
        //        switch subscription {
        //
        //        case .tracker:
        //            trackerApplication.stop()
        //
        //        }
    }
    
}

