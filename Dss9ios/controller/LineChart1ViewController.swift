//
//  LineChart1ViewController.swift
//  ChartsDemo-iOS
//
//  Created by Jacob Christie on 2017-07-09.
//  Copyright © 2017 jc. All rights reserved.
//

import UIKit
import Charts

class LineChart1ViewController: DemoBaseViewController {

    @IBOutlet var chartView: LineChartView!
  
     var list = [SimpleObj]()
    
    var row = 0
    var ten = ""

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Line Chart 1"
      
        
        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        
        // x-axis limit line
        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
        llXAxis.lineWidth = 4
        llXAxis.lineDashLengths = [10, 10, 0]
        llXAxis.labelPosition = .rightBottom
        llXAxis.valueFont = .systemFont(ofSize: 10)
        
        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0
        
        let ll1 = ChartLimitLine(limit: 150, label: "Upper Limit")
        ll1.lineWidth = 4
        ll1.lineDashLengths = [5, 5]
        ll1.labelPosition = .rightTop
        ll1.valueFont = .systemFont(ofSize: 10)
        
        let ll2 = ChartLimitLine(limit: -30, label: "Lower Limit")
        ll2.lineWidth = 4
        ll2.lineDashLengths = [5,5]
        ll2.labelPosition = .rightBottom
        ll2.valueFont = .systemFont(ofSize: 10)
        
        let leftAxis = chartView.leftAxis
        leftAxis.removeAllLimitLines()
        //leftAxis.addLimitLine(ll1)
        //leftAxis.addLimitLine(ll2)
        //leftAxis.axisMaximum = 200
        //leftAxis.axisMinimum = 0
        leftAxis.gridLineDashLengths = [5, 5]
        leftAxis.drawLimitLinesBehindDataEnabled = true
        
        chartView.rightAxis.enabled = false
        chartView.legend.form = .line
     
        //slidersValueChanged(nil)
        
        chartView.animate(xAxisDuration: 2.5)
        
        
        getdata ()
       
    }

    override func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
        self.setDataCount(Int(10), range: UInt32(100))
    }

    func setDataCount(_ count: Int, range: UInt32) {
        let values = (0..<self.list.count).map { (i) -> ChartDataEntry in
            //let val = Double(arc4random_uniform(range) + 3)
            return ChartDataEntry(x: Double(i), y: Double( self.list[i].giatriInt))
        }
        
        let set1 = LineChartDataSet(values: values, label: self.ten+" - VLR")
        set1.drawIconsEnabled = false
        
        set1.lineDashLengths = [5, 2.5]
        set1.highlightLineDashLengths = [5, 2.5]
        set1.setColor(.blue)
        set1.setCircleColor(.blue)
        set1.lineWidth = 1
        set1.circleRadius = 3
        set1.drawCircleHoleEnabled = false
        set1.valueFont = .systemFont(ofSize: 9)
        set1.formLineDashLengths = [5, 2.5]
        set1.formLineWidth = 1
        set1.formSize = 15
        
        let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                              ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
        //set1.drawFilledEnabled = true
        
        let data = LineChartData(dataSet: set1)
        
        chartView.data = data
    }
    
    func getdata ()
    {
        
        guard  let url_vlr = URL(string: "http://www.simmobi.vn:8090/QLCVMobiWebService/wsqlcv?cmd=111&userid=7592&ms_phongban=620&mucquyen=4&istrungtam=1&thang=03&nam=2018&idtinh=-1&loai=VLR") else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url_vlr) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                let bcth = try JSONDecoder().decode(BcvlObj.self, from: data)
                //et user = User(data)
                //print(user.userInfo.tendangnhap)
                DispatchQueue.main.async {
                   
                    let temp = Utils.listVLR2myObj(listsource: bcth.bcvlrInfo)
                    self.list = Utils.Myobj2Simple4Linechart(listsource: temp, position: self.row)
                    
                    
                    print("size list: \(self.list.count)")
                     self.updateChartData()
                }
            } catch {
                print("error getdata")
            }
        }
        task.resume()
        
    }
    
    
    

  
}
