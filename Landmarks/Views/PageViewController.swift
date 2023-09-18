//
//  PageViewController.swift
//  Landmarks
//
//  Created on 7/22/23.


import SwiftUI
import UIKit

// stores an array of Page instances
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    // binding as a property of PageViewController to update setViewControllers
    @Binding var currentPage: Int

    // make coordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // manages the view controller's life cycle
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        return pageViewController
    }

    // provide a view controller for display
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }

    // declare a nested class
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
    
        func pageViewController(
                   _ pageViewController: UIPageViewController,
                   didFinishAnimating finished: Bool,
                   previousViewControllers: [UIViewController],
                   transitionCompleted completed: Bool) {
                   if completed,
                      let visibleViewController = pageViewController.viewControllers?.first,
                      let index = controllers.firstIndex(of: visibleViewController) {
                       parent.currentPage = index
                   }
        }
    }
}
