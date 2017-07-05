//
//  SampleProfile.swift
//  PortalApplicationTest
//
//  Created by Cristian Ames on 7/4/17.
//  Copyright © 2017 Wolox. All rights reserved.
//

import Portal

struct SampleProfile {    
    
    static func view() -> View {
        return View(
            navigator: .unique,
            root: .stack(navBar()),
            component: component()
        )
    }
    
    private static func navBar() -> NavigationBar<Action> {
        return navigationBar(
            title: "Profile",
            onBack: .navigateToPreviousRoute,
            style: navigationBarStyleSheet { base, navBar in
                base.backgroundColor = Color(hex: 0x0D233A)!
                navBar.titleTextColor = .white
                navBar.titleTextFont = UIFont(name: "HelveticaNeue-Bold", size: 30)!
                navBar.statusBarStyle = .lightContent
                navBar.tintColor = .white
            }
        )
    }
    
    private static func component() -> Component<Action> {
        return container(
            children: [
                label(
                    text: "Alias: Mistery Guy",
                    style: labelStyleSheet { _, label in
                        label.textSize = 30
                    },
                    layout: layout {
                        $0.margin = .by(edge: Edge(left: 20, top: 40))
                    }
                ),
                container(
                    children: [
                        imageView(
                            image: Image(image: UIImage(named: "sample_image")!),
                            style: styleSheet {
                                $0.cornerRadius = 20
                            },
                            layout: layout {
//                                $0.aspectRatio = AspectRatio(rawValue: 0.5)
                                $0.margin = .by(edge: Edge(left: 60, top: 20, right: 60))
                            }
                        )
                    ],
                    layout: layout {
                        $0.flex = flex { $0.grow = .one }
                        $0.justifyContent = .center
                        $0.alignment = Alignment(content: .center)
                    }
                )
            ],
            style: styleSheet {
                $0.backgroundColor = .white
            },
            layout: layout {
                $0.flex = flex { $0.grow = .one }
            }
        )
    }
    
}
