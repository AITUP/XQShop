//
//  GuideViewController.swift
//  XQShop
//
//  Created by Xuqian on 16/3/22.
//  Copyright © 2016年 Qian xu. All rights reserved.
//

import UIKit

class GuideViewController: BaseViewController {
    
    
    private var scrollView: UIScrollView?
    private var pageController = UIPageControl(frame: CGRectMake(0, ScreenHeight - 50,ScreenWidth, 20))
//    private var registerButton: UIButton!
//    private var loginButton: UIButton!
    private var startButton: UIButton!
    
    private var imageNames = ["guide_35_1","guide_35_2","guide_35_3","guide_35_4"]
    
    override func viewDidLoad() {
         super.viewDidLoad()
        //设置状态栏
//        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.None)
        
        //初始化ScrollView
        initScrollView()
        //初始化PageController
        initPageController()
    }
    
    private func initScrollView() {

        
        scrollView = UIScrollView(frame: ScreenBounds)
        scrollView!.pagingEnabled = true //是否支持分页
        scrollView!.showsHorizontalScrollIndicator = false
        scrollView!.showsVerticalScrollIndicator = false
        scrollView!.bounces = false
        
        scrollView?.contentOffset = CGPointZero
        //
        scrollView?.contentSize = CGSize(width: ScreenWidth * CGFloat(imageNames.count), height: ScreenHeight)
        
        scrollView!.delegate = self
        
        for index in 0..<imageNames.count {
            //注意图片的名字
            print("图片的名字\(imageNames[index])")
            let imageView = UIImageView(image: UIImage(named:"\(imageNames[index])"))
            imageView.frame = CGRect(x:ScreenWidth * CGFloat(index), y:0, width: ScreenWidth, height: ScreenHeight)
            scrollView?.addSubview(imageView)
        }
        
        view.insertSubview(scrollView!, atIndex: 0)
        
        startButton = UIButton()
        startButton.frame = CGRectMake( ScreenWidth / 2 - 75, (ScreenHeight - 100), 150, 50)
        startButton.layer.cornerRadius = 15.0
        startButton.backgroundColor = UIColor.blueColor()
        startButton.setTitle("开始体验", forState: UIControlState.Normal)
        startButton.alpha = 0.0
        view.addSubview(startButton)
        
        
    }
    
    private func initPageController() {
        pageController.numberOfPages = imageNames.count
        pageController.currentPage = 0
        view.addSubview(pageController)
    }
    
    
}
extension GuideViewController: UIScrollViewDelegate {
    
    //MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("只要滚动了就会触发")
        let offset = scrollView.contentOffset
        //随着滑动改变pageControl的状态
        pageController.currentPage = Int(offset.x / view.bounds.width)
        //因为currentPage是从0开始，所以numOfPages减1
        
        if pageController.currentPage == imageNames.count - 1 {
            
            UIView.animateWithDuration(0.5) {
                self.startButton.alpha = 1.0
            }
            
        
        } else {
            
            UIView.animateWithDuration(0.2) {
                self.startButton.alpha = 0.0
            }
        }
      
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
      print("结束滚动")

    }

}
