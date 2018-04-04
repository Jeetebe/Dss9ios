//
//  PieChartViewController.swift
//  ChartsDemo-iOS
//
//  Created by Jacob Christie on 2017-07-09.
//  Copyright © 2017 jc. All rights reserved.
//

import UIKit
import Charts

class PieChartViewController: DemoBaseViewController {

    @IBOutlet var chartView: PieChartView!

    var list = [SimpleObj]()
    var myFilter = FilterObj()
    var tab:Int!
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Half Pie Bar Chart"
        
        list.append(SimpleObj(t: "1",gt: "1",gti: 10))
        list.append(SimpleObj(t: "2",gt: "1",gti: 20))
        list.append(SimpleObj(t: "3",gt: "1",gti: 30))
        
        
        self.setup(pieChartView: chartView)
        
        chartView.delegate = self
        
        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
//        chartView.legend = l

        // entry label styling
        chartView.entryLabelColor = .white
       // chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)

        
         chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
        
        getdata ()
    }
    
    override func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
        //self.setDataCount(Int(sliderX.value), range: UInt32(sliderY.value))
        self.setDataCount(4, range: 100)
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let entries = (0..<list.count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            //return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
            return PieChartDataEntry(value: Double(list[i].giatriInt),
                                     label: list[i].ten
                                   )
        }
        
        let set = PieChartDataSet(values: entries, label: "")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
       
        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        //data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.white)
          let ghichu = myFilter.tentinh + ": " + Utils.get_name(tab: tab, name: myFilter.loai) + " - tháng "  + myFilter.thang + " năm " + myFilter.nam
        chartView.chartDescription?.text = ghichu
        chartView.chartDescription?.font = UIFont(name: "HelveticaNeue-Light", size: 14.0)!
        chartView.chartDescription?.enabled = true
        chartView.data = data
        chartView.highlightValues(nil)
    }
    
    func getdata ()
    {
        var cmd = ""
        switch tab {
        case 1:
            cmd = "111"
            
            if myFilter.loai == "-1"
            {
                myFilter.loai = "VLR"
            }
        case 2:
            cmd = "109"
            
            if myFilter.loai == "-1"
            {
                myFilter.loai = "1"
            }
        case 3:
            cmd = "110"
            
            if myFilter.loai == "-1"
            {
                myFilter.loai = "Tong_Hop"
            }
        case 4:
            cmd = "112"
            
            if myFilter.loai == "-1"
            {
                myFilter.loai = "PTTB_TT"
            }
        case 5:
            cmd = "113"
            
            if myFilter.loai == "-1"
            {
                myFilter.loai = "LL_Thoai"
            }
            
            
        default:
            cmd = "111"
            
            if myFilter.loai == "-1"
            {
                myFilter.loai = "VLR"
            }
        }
        
        
        let url = "http://www.simmobi.vn:8090/QLCVMobiWebService/wsqlcv?cmd="+cmd+"&userid=7592&ms_phongban=620&mucquyen=4&istrungtam=1&thang="+myFilter.thang+"&nam="+myFilter.nam+"&idtinh="+myFilter.tinh+"&loai=" + myFilter.loai
        print("url vlr\(url)")
        guard  let url_vlr = URL(string: url)
            else {
                return
        }
        
        
        let task = URLSession.shared.dataTask(with: url_vlr) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                switch self.tab
                {
                case 1:
                    let bcth = try JSONDecoder().decode(BcvlObj.self, from: data)
                    self.list = Utils.listVLR2simple(listsource: bcth.bcvlrInfo)
                    print("size list: \(self.list.count)")
                case 2:
                    let bcth = try JSONDecoder().decode(DtttObj.self, from: data)
                    self.list = Utils.listDTTT2simple(listsource: bcth.bcthInfo)
                   
                default:
                    return
                }
                
                print("size list: \(self.list.count)")
                DispatchQueue.main.async {
                   
                    if self.list.count != 12
                    {
                        self.list.removeLast();
                        self.list.removeLast();
                    }
                    
                    self.updateChartData()
                }
            } catch {
                print("error getdata")
            }
        }
        task.resume()
        
    }
    
   
   
}




class DemoBaseViewController: UIViewController, ChartViewDelegate {
    private var optionsTableView: UITableView? = nil
    let parties = ["Party A", "Party B", "Party C", "Party D", "Party E", "Party F",
                   "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
                   "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
                   "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
                   "Party Y", "Party Z"]
    
    @IBOutlet weak var optionsButton: UIButton!
    //var options: [Option]!
    
    var shouldHideData: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.initialize()
    }
    
    private func initialize() {
        self.edgesForExtendedLayout = []
    }
    
   
    func updateChartData() {
        fatalError("updateChartData not overridden")
    }
    
    func setup(pieChartView chartView: PieChartView) {
        chartView.usePercentValuesEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.58
        chartView.transparentCircleRadiusPercent = 0.61
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        
        chartView.drawCenterTextEnabled = true
        
        let paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
     
        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 0
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = true
        
        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.drawInside = false
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
        //        chartView.legend = l
    }
    
    func setup(radarChartView chartView: RadarChartView) {
        chartView.chartDescription?.enabled = false
    }
    
    func setup(barLineChartView chartView: BarLineChartViewBase) {
        chartView.chartDescription?.enabled = false
        
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = false
        
        // ChartYAxis *leftAxis = chartView.leftAxis;
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        
        chartView.rightAxis.enabled = false
    }
    // TODO: Cannot override from extensions
    //extension DemoBaseViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        NSLog("chartValueSelected");
    }
    
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        NSLog("chartValueNothingSelected");
    }
    
    func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat) {
        
    }
    
    func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {
        
    }
}

extension DemoBaseViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 0
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        
        return 44.0;
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
            cell?.backgroundView = nil
            cell?.backgroundColor = .clear
            cell?.textLabel?.textColor = .white
        }
       // cell?.textLabel?.text = self.options[indexPath.row].label
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
    }
}
