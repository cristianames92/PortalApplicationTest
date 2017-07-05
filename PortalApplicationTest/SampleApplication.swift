//
//  Sample.swift
//  Sample
//
//  Created by Cristian Ames Masek on 6/15/17.
//  Copyright © 2017 Wolox. All rights reserved.
//

import Portal

typealias Action = Portal.Action<Route, Message>
typealias View = Portal.View<Route, Message, Navigator>
typealias Subscription = Portal.Subscription<Message, Route, SampleSubscription>
typealias SubscriptionType = SampleSubscription

class SampleApplication: Portal.Application {
    
    var initialState: State { return State(currentRoute: .main, count: 25) }
    var initialRoute: Route { return .main }
    
    func update(state: State, message: Message) -> (State, Command?)? {
        switch message {
            
        case .applicationStarted:
            return (State(currentRoute: .main, count: 25), .none)
            
        case .routeChanged(to: let route):
            return (State(currentRoute: route, count: 25), .none)
            
        case .incrementCount(let count):
            return (State(currentRoute: state.currentRoute, count: state.count + count), .none)
            
        }
        
    }
    
    func view(for state: State) -> View {
        switch state.currentRoute {
        case .main:
            return SampleView.view(count: state.count)
        case .profile:
            return SampleProfile.view()
        }
    }
    
    func translateRouteChange(from currentRoute: Route, to nextRoute: Route) -> Message? {
        return .routeChanged(to: nextRoute)
    }
    func subscriptions(for state: State) -> [Subscription] { return [] }
    
}

