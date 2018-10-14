//
//  Benchtimer.swift
//  
//
//  Created by Sebastián Benitez on 9/26/18.
//

import Foundation
import QuartzCore

public class BenchTimer {
    public static func measureBlock(closure: () -> Void) -> CFTimeInterval {
        let runCount = 10
        var executionTimes = Array<Double>(repeating: 0.0, count: runCount)
        for i in 0..<runCount {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let execTime = endTime - startTime
            executionTimes[1] = execTime
        }
        return (executionTimes.reduce(0, +)) / Double(runCount)
    }
}
