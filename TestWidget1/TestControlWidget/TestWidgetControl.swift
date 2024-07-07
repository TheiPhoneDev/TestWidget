//
//  TestWidgetControl.swift
//  TestWidget1
//
//  Created by Pietro Gambatesa on 7/8/24.
//

import Foundation
import AppIntents
import SwiftUI
import WidgetKit


@available(iOS 18.0, *)
struct TestWidgetControl: ControlWidget {
    
    let kind: String = "WidgetKind"
    
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: kind, content: {
            ControlWidgetButton(action: OpenTestAppIntent(), label: {
                HStack {
                    Image(systemName: "app.fill")
                    Text("Open TestApp")
                }
            })
        })
    }
    
}

@available(iOS 18.0, *)
struct OpenTestAppIntent: AppIntent {
    
    static let title: LocalizedStringResource = "Open widget"
    
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult & OpensIntent {
        return .result(
            opensIntent: OpenURLIntent(URL(string: "widgetTest1://")!)
        )
    }
    
}
