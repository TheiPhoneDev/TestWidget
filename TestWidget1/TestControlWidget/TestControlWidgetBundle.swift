//
//  TestControlWidgetBundle.swift
//  TestControlWidget
//
//  Created by Pietro Gambatesa on 7/7/24.
//

import WidgetKit
import SwiftUI

@main
struct TestControlWidgetBundle: WidgetBundle {
    var body: some Widget {
        TestControlWidget()
        TestWidgetControl()
        TestControlWidgetLiveActivity()
    }
}
