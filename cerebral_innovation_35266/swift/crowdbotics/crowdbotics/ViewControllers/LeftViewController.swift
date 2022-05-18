//
//  LeftViewController.swift
//  LGSideMenuControllerDemo
//
import Foundation
import UIKit

class LeftViewController: UITableViewController {
    
    private let titlesArray = ["Profile",
                               "News",
                               "Articles",
                               "Video",
                               "About"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        tableView.estimatedRowHeight = 30.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 44.0, left: 0.0, bottom: 44.0, right: 0.0)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeftViewCell

        cell.titleLabel.text = titlesArray[indexPath.row]

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row == 1 || indexPath.row == 3) ? 22.0 : 44.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.row == 0)
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "TestViewController") as? TestViewController else { return }
            
            print("Profile")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let navVC = appDelegate.window!.rootViewController as! UINavigationController
            navVC.pushViewController(viewController, animated: true)
            dismiss(animated: true, completion: nil)
        }
        else if (indexPath.row == 1)
        {
            print("News")
        }
        else if (indexPath.row == 2)
        {
            print("Articles")
        }
        else if (indexPath.row == 3)
        {
            print("Video")
        }
        else if (indexPath.row == 4)
        {
            print("About")
        }
    }
    
}
