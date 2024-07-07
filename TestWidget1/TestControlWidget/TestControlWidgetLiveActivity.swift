//
//  TestControlWidgetLiveActivity.swift
//  TestControlWidget
//
//  Created by Pietro Gambatesa on 7/7/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct TestControlWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct TestControlWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TestControlWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension TestControlWidgetAttributes {
    fileprivate static var preview: TestControlWidgetAttributes {
        TestControlWidgetAttributes(name: "World")
    }
}

extension TestControlWidgetAttributes.ContentState {
    fileprivate static var smiley: TestControlWidgetAttributes.ContentState {
        TestControlWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: TestControlWidgetAttributes.ContentState {
         TestControlWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: TestControlWidgetAttributes.preview) {
   TestControlWidgetLiveActivity()
} contentStates: {
    TestControlWidgetAttributes.ContentState.smiley
    TestControlWidgetAttributes.ContentState.starEyes
}
