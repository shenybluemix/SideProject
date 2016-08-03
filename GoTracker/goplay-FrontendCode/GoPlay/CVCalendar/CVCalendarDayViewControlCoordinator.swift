//
//  CVCalendarDayViewControlCoordinator.swift
//  CVCalendar
//
//  Created by E. Mozharovsky on 12/27/14.
//  Copyright (c) 2014 GameApp. All rights reserved.
//

import UIKit

public final class CVCalendarDayViewControlCoordinator {
    // MARK: - Non public properties
    public var selectionSet = Set<DayView>()
    private unowned let calendarView: CalendarView

    // MARK: - Public properties
    public weak var selectedDayView: CVCalendarDayView?
    public var animator: CVCalendarViewAnimator! {
        get {
            return calendarView.animator
        }
    }

    // MARK: - initialization
    public init(calendarView: CalendarView) {
        self.calendarView = calendarView
    }
}

// MARK: - Animator side callback

extension CVCalendarDayViewControlCoordinator {
    public func selectionPerformedOnDayView(dayView: DayView) {
        // TODO:
    }

    public func deselectionPerformedOnDayView(dayView: DayView) {
        if dayView != selectedDayView {
            selectionSet.remove(dayView)
            dayView.setDeselectedWithClearing(true)
        }
    }

    public func dequeueDayView(dayView: DayView) {
        selectionSet.remove(dayView)
    }

    public func flush() {
        selectedDayView = nil
        selectionSet.removeAll()
    }
}

// MARK: - Animator reference

private extension CVCalendarDayViewControlCoordinator {
    func presentSelectionOnDayView(dayView: DayView) {
        animator.animateSelectionOnDayView(dayView)
        //animator?.animateSelection(dayView, withControlCoordinator: self)
    }

    func presentDeselectionOnDayView(dayView: DayView) {
        animator.animateDeselectionOnDayView(dayView)
        //animator?.animateDeselection(dayView, withControlCoordinator: self)
    }
}

// MARK: - Coordinator's control actions

extension CVCalendarDayViewControlCoordinator {
    public func performDayViewSingleSelection(dayView: DayView) {
        
       // print("selection \(dayView.selectionView)")
        
        if !selectionSet.contains(dayView) {
            print("No -> Color it Blue")
            presentSelectionOnDayView(dayView)
            selectionSet.insert(dayView)
        } else if selectionSet.contains(dayView) {
            print("Yes -> Color it Red")
            presentDeselectionOnDayView(dayView)
            //dequeueDayView(dayView)
        } else {
            print("yes yes -> color it orange")
        }
        
        
        

//        if let _ = animator {
//            if selectedDayView != dayView {
//                selectedDayView = dayView
//                presentSelectionOnDayView(dayView)
//            } else {
//                selectedDayView = nil
//                presentDeselectionOnDayView(dayView)
//            }
//        }
        
    }

    public func performDayViewRangeSelection(dayView: DayView) {
        
        print("Day view range selection found")
    }
}
