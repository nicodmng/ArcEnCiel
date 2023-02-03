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
        calendarView.scope = .week
        calendar?.locale = Locale(identifier: "ar")
        calendarView.delegate = self
        calendarView.dataSource = self
        calendarView.firstWeekday = 2
        //calendarView.appearance.headerMinimumDissolvedAlpha = 0
        calendarView.appearance.borderRadius = 0.5
        calendarView.weekdayHeight = 40
        calendarView.headerHeight = 22
        calendarView.appearance.todayColor = .systemBlue
        calendarView.clipsToBounds = false
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

class MyCell: FSCalendarCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(UIImageView(image: UIImage(named: "portrait_2")))
    }
    
    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
}

