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
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCalendar()
        
        dateOfTheDayLabel.text = displayDateOfTheDay()
        
        let nibName = UINib(nibName: "EventViewCell", bundle: nil)
        eventsTableView.register(nibName, forCellReuseIdentifier: cellReuseIdentifer)
        
    }
    
    // MARK: - Methods
    
    func setupCalendar() {
        calendarView.delegate = self
        calendarView.dataSource = self
        calendarView.scope = .week
        calendarView.firstWeekday = 2
        calendarView.appearance.weekdayFont = .preferredFont(forTextStyle: .subheadline)
        calendarView.appearance.weekdayTextColor = .black
        calendarView.appearance.weekdayFont = .systemFont(ofSize: 15, weight: .light)
        calendarView.appearance.borderRadius = 0.5
        calendarView.weekdayHeight = 40
        calendarView.headerHeight = 20
        calendarView.appearance.todayColor = .init(named: calendarSelectDayColor)
        calendarView.appearance.todaySelectionColor = .init(named: calendarSelectDayColor)
        calendarView.clipsToBounds = true
        calendarView.register(MyCell.self, forCellReuseIdentifier: "eventCell")
    }
    
    func displayDateOfTheDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM y"
        let dateString = formatter.string(from: date)
        return dateString
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
                
   
    class MyCell: FSCalendarCell {
     
 
        
        
        
        
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







