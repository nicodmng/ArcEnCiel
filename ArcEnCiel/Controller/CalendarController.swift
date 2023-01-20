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
    
    private let floatingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        
        button.backgroundColor = .systemBlue
        button.setImage(image, for: .normal)
        button.tintColor = .white
        
        // Shadow
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        
        // Corner radius
        button.layer.cornerRadius = 35
        return button
    }()
    
    // IBOutlets & IBActions
    
    @IBOutlet weak var dateOfTheDayLabel: UILabel!
    @IBOutlet weak var calendarView: FSCalendar!
    
    @IBOutlet weak var eventsTableView: UITableView!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        setupCalendar()

        dateOfTheDayLabel.text = displayDateOfTheDay()
                
        let nibName = UINib(nibName: "EventViewCell", bundle: nil)
        eventsTableView.register(nibName, forCellReuseIdentifier: cellReuseIdentifer)
        
    }
    
    // MARK: - Methods
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.size.width - 60 - 30,
                                      y: view.frame.size.height - 180,
                                      width: 70,
                                      height: 70)
    }
    
    @objc private func didTapButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: .none)
        let addEventVC = storyboard.instantiateViewController(withIdentifier: "addEvent")
        
        addEventVC.modalPresentationStyle = .formSheet
        
        present(addEventVC, animated: true, completion: .none)
        
        print("test")
    }
    
    func setupCalendar() {
        calendarView.scope = .week
        calendarView.delegate = self
        calendarView.dataSource = self
        calendarView.firstWeekday = 2
        //calendarView.appearance.headerMinimumDissolvedAlpha = 0
        calendarView.appearance.borderRadius = 0.5
        calendarView.weekdayHeight = 40
        calendarView.headerHeight = 22
        calendarView.appearance.todayColor = .systemBlue

    }
    
    func displayDateOfTheDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM y"
        let dateString = formatter.string(from: date)
        return dateString
    }
}

// MARK: - Extensions

extension CalendarController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd MMMM yyyy"
        print("\(formatter.string(from: date))")
    }
    
}

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

