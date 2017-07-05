//
//  SampleView.swift
//  PortalApplicationTest
//
//  Created by Cristian Ames on 7/4/17.
//  Copyright © 2017 Wolox. All rights reserved.
//

import Portal

struct SampleView {
    
    static func view(count: UInt) -> View {
        return View(
            navigator: .unique,
            root: .stack(navBar()),
            component: component(count: count)
        )
    }
    
    private static func incrementalButton() -> Component<Action> {
        return button(
            text: "Increment",
            onTap: .sendMessage(.incrementCount(by: 1)),
            style: buttonStyleSheet { _, button in
                button.textFont = UIFont(name: "HelveticaNeue", size: 30)!
            }
        )
    }
    
    private static func pushNewWindowButton() -> Component<Action> {
        return button(
            text: "Profile",
            onTap: .navigate(to: .profile),
            style: buttonStyleSheet { _, button in
                button.textFont = UIFont(name: "HelveticaNeue", size: 30)!
            }
        )
    }
    
    private static func navBar() -> NavigationBar<Action> {
        return navigationBar(
            title: "Sample App",
            onBack: .navigateToPreviousRoute,
            style: navigationBarStyleSheet { base, navBar in
                base.backgroundColor = Color(hex: 0x0D233A)!
                navBar.titleTextColor = .white
                navBar.titleTextFont = UIFont(name: "HelveticaNeue-Bold", size: 30)!
                navBar.statusBarStyle = .lightContent
            }
        )
    }
    
    private static func component(count: UInt) -> Component<Action> {
        return container(
            children: [
                container(
                    children: [
                        container(
                            children: [
                                incrementalButton()
                            ],
                            style: styleSheet {
                                $0.backgroundColor = Color(hex: 0x8FBD5D)!
                            },
                            layout: layout {
                                $0.flex = flex { $0.grow = .one }
                                $0.justifyContent = .center
                                $0.alignment = Alignment(content: .center)
                            }
                        ),
                        container(
                            children: [
                                pushNewWindowButton()
                            ],
                            style: styleSheet {
                                $0.backgroundColor = Color(hex: 0x39AEDA)!
                            },
                            layout: layout {
                                $0.flex = flex { $0.grow = .one }
                                $0.justifyContent = .center
                                $0.alignment = Alignment(content: .center)
                            }
                        )
                    ],
                    style: styleSheet {
                        $0.backgroundColor = .red
                    },
                    layout: layout {
                        $0.height = Dimension(value: 50)
                        $0.flex = flex {
                            $0.direction = .row
                        }
                    }
                ),
                container(
                    children: [
                        label(
                            text: String(count),
                            style: labelStyleSheet { _, label in
                                label.textColor = .red
                                label.textSize = 100
                            },
                            layout: layout {
                                $0.alignment = Alignment(self: .center)
                            }
                        )
                    ],
                    style: styleSheet{
                        $0.backgroundColor = .white
                    },
                    layout: layout {
                        $0.flex = flex { $0.grow = .one }
                        $0.justifyContent = .center
                    }
                )
            ],
            layout: layout {
                $0.flex = flex { $0.grow = .one }
            }
        )
    }
    
}
