//
//  HomeCalendarController.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 13/12/2022.
//

import UIKit
import FSCalendar

class CalendarController: UIViewController {
    
    // MARK: - Properties
    
    let date = Date()
    let calendarSelectDayColor = "lightBlue"
    var calendar: FSCalendar!
    var cellReuseIdentifer = "eventCell"
    var formatter = DateFormatter()
    
    // IBOutlets & IBActions
    
    @IBOutlet weak var dateOfTheDayLabel: UILabel!
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var eventsTableView: UITableView!
    @IBOutlet weak var generalViewCalendar: UIView!
    
    @IBAction func precedentButton(_ sender: UIButton) {
        calendarView.setCurrentPage(getPrecedentMonth(date: calendarView.currentPage), animated: true)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        calendarView.setCurrentPage(getNextMont(date: calendarView.currentPage), animated: true)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCalendar()
        
        dateOfTheDayLabel.text = displayDateOfTheDay()
        
        let nibName = UINib(nibName: "EventViewCell", bundle: nil)
        eventsTableView.register(nibName, forCellReuseIdentifier: cellReuseIdentifer)
        
        generalViewCalendar.layer.shadowColor = UIColor.black.cgColor
        generalViewCalendar.layer.shadowOpacity = 0.3
        generalViewCalendar.layer.shadowOffset = .zero
        generalViewCalendar.layer.shadowRadius = 3
        generalViewCalendar.layer.shadowPath = UIBezierPath(rect: generalViewCalendar.bounds).cgPath
        generalViewCalendar.layer.shouldRasterize = true
        generalViewCalendar.layer.rasterizationScale = UIScreen.main.scale

    }
    
    // MARK: - Methods
    
    func setupCalendar() {
        calendarView.delegate = self
        calendarView.dataSource = self
        
        // Calendar settings
        calendarView.scope = .month
        calendarView.firstWeekday = 2
        calendarView.placeholderType = .fillHeadTail
        
        
        // Calendar color
        calendarView.appearance.headerTitleColor = .darkGray
        calendarView.appearance.titleFont = .systemFont(ofSize: 15, weight: .light)
        calendarView.appearance.weekdayTextColor = .black
        calendarView.appearance.weekdayFont = .systemFont(ofSize: 17, weight: .medium)
        calendarView.appearance.todayColor = .init(named: calendarSelectDayColor)
    }
    
    func displayDateOfTheDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM y"
        let dateString = formatter.string(from: date)
        return dateString
    }
    
    func getPrecedentMonth(date: Date) -> Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: date)!
    }
    
    func getNextMont(date: Date) -> Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: date)!
    }
    
}


class CalendarCell: FSCalendarCell {
    
    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        let todayLayer = CAShapeLayer()
        todayLayer.fillColor = UIColor.clear.cgColor
    }
    
}

// MARK: - Extensions

// Calendar

extension CalendarController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "d MMMM yyyy"
        dateOfTheDayLabel.text = formatter.string(from: date)
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        
    }
    
    enum SelectionType {
        case selected
        case dateOfTheDay
    }

}

// TableView

extension CalendarController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifer, for: indexPath)
        return eventCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
