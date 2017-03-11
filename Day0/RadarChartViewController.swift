//
//  RadarChartViewController.swift
//  Day0
//
//  Created by Milton Leung on 2017-03-11.
//  Copyright © 2017 0mbps. All rights reserved.
//

import UIKit

class RadarChartViewController: UIViewController {
  
  var chart: TKRadarChart!
  
  var emotion: Emotion? {
    didSet {
      chart.reloadData()
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    let w = self.view.bounds.width
    chart = TKRadarChart(frame: CGRect(x: 0, y: 0, width: w, height: w))
    chart.configuration.radius = w/3
    chart.dataSource = self
    chart.delegate = self
    chart.center = view.center
    view.addSubview(chart)
  }
}
extension RadarChartViewController: TKRadarChartDelegate, TKRadarChartDataSource {
  
  func numberOfStepForRadarChart(_ radarChart: TKRadarChart) -> Int {
    return 5
  }
  func numberOfRowForRadarChart(_ radarChart: TKRadarChart) -> Int {
    return 8
  }
  func numberOfSectionForRadarChart(_ radarChart: TKRadarChart) -> Int {
    return 1
  }
  
  func titleOfRowForRadarChart(_ radarChart: TKRadarChart, row: Int) -> String {
    guard let emotionRow = Emotions(rawValue: row) else { fatalError() }
    switch emotionRow {
    case .anger:
      return "Anger"
    case .contempt:
      return "Contempt"
    case .disgust:
      return "Disgust"
    case .fear:
      return "Fear"
    case .happiness:
      return "Happiness"
    case .neutral:
      return "Neutral"
    case .sadness:
      return "Sadness"
    case .surprise:
      return "Surprise"
    }
  }
  
  func valueOfSectionForRadarChart(withRow row: Int, section: Int) -> CGFloat {
    guard let emotionRow = Emotions(rawValue: row) else { fatalError() }
    switch emotionRow {
    case .anger:
      return CGFloat(emotion!.anger)
    case .contempt:
      return CGFloat(emotion!.contempt)
    case .disgust:
      return CGFloat(emotion!.disgust)
    case .fear:
      return CGFloat(emotion!.fear)
    case .happiness:
      return CGFloat(emotion!.happiness)
    case .neutral:
      return CGFloat(emotion!.neutral)
    case .sadness:
      return CGFloat(emotion!.sadness)
    case .surprise:
      return CGFloat(emotion!.surprise)
    }
  }
  
  
  
  
  func colorOfLineForRadarChart(_ radarChart: TKRadarChart) -> UIColor {
    return UIColor(red:0.337,  green:0.847,  blue:0.976, alpha:1)
  }
  
  func colorOfFillStepForRadarChart(_ radarChart: TKRadarChart, step: Int) -> UIColor {
    switch step {
    case 1:
      return UIColor(red:0.545,  green:0.906,  blue:0.996, alpha:1)
    case 2:
      return UIColor(red:0.706,  green:0.929,  blue:0.988, alpha:1)
    case 3:
      return UIColor(red:0.831,  green:0.949,  blue:0.984, alpha:1)
    case 4:
      return UIColor(red:0.922,  green:0.976,  blue:0.988, alpha:1)
    default:
      return UIColor.white
    }
  }
  
  func colorOfSectionFillForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
    if section == 0 {
      return UIColor(red:1,  green:0.867,  blue:0.012, alpha:0.4)
    } else {
      return UIColor(red:0,  green:0.788,  blue:0.543, alpha:0.4)
    }
  }
  
  func colorOfSectionBorderForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
    if section == 0 {
      return UIColor(red:1,  green:0.867,  blue:0.012, alpha:1)
    } else {
      return UIColor(red:0,  green:0.788,  blue:0.543, alpha:1)
    }
}

