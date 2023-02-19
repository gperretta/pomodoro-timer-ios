//
//  TimerView.swift
//  Timer
//
//  Created by Gilda on 01/01/23.
//

import SwiftUI

struct TimerView: View {
    @StateObject var timerManager = TimerManager()
    var title : String {
        switch timerManager.timerState {
        case .notStarted:
            return "Ready to start"
        case .focusing:
            return "Focused work mode"
        case .pausing:
            return "Take a break"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 16) {
                    Text(timerManager.timingPlan.rawValue)
                        .opacity(0.7)
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // MARK: timing plan
//                    Button {
//                        timerManager.switchTiming()
//                    } label: {
//                        Text(timerManager.timingPlan.rawValue)
//                            .fontWeight(.semibold)
//                        // inside the frame spacing
//                            .padding(.vertical, 12)
//                            .padding(.horizontal, 20)
//                        // frame
//                            .background(.ultraThinMaterial)
//                            .cornerRadius(20)
//                    }
                }
                
                // MARK: progress ring
                ProgressRing()
                    .environmentObject(timerManager)
                    .padding(.vertical)
                
                // MARK: timer labels
                HStack {
                    // timer starting time
                    VStack(spacing: 8) {
                        Text(timerManager.timerState == .notStarted ? "Start now" : "Started at")
                            .opacity(0.7)
                        Text(timerManager.startTime,
                                format: .dateTime.hour().minute().second())
                        .fontWeight(.bold)
                    }
                    Spacer()
                    // timer ending time (starting time + 25 min by default etc)
                    VStack(spacing: 8) {
                        Text("End at")
                            .opacity(0.7)
                        if (timerManager.timerState == .notStarted) {
                            Text((timerManager.startTime)+1500,
                                    format: .dateTime.hour().minute().second())
                            .fontWeight(.bold)
                        } else {
                            Text(timerManager.endTime,
                                    format: .dateTime.hour().minute().second())
                            .fontWeight(.bold)
                        }
                    }
                }
                .padding(.horizontal, 44)
                .padding(.bottom, 52)
                
                // MARK: buttons
                Button {
                    timerManager.toggleTimerState()
                } label: {
                    Text(timerManager.timerState == .focusing ? "Start a pause" : "Start to focus")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                }
                .padding(.bottom, 8)
                Button {
                    timerManager.reset()
                } label: {
                    Text("Reset")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                }
            }
            .navigationBarHidden(true)
            .padding(.bottom, 24)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
