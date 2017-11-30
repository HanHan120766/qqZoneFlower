//
//  ViewController.swift
//  iDay
//
//  Created by 千云锋 on 2017/11/29.
//  Copyright © 2017年 千云锋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.creatUI()
        self.creatCAEmitterLayer()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func creatUI() {
        let backgroundImgView = UIImageView()
        backgroundImgView.image = UIImage(named: "img5.jpeg")
        backgroundImgView.frame = self.view.frame
        self.view.addSubview(backgroundImgView)
    }
    
    //TODO: -----------------创建粒子发射----------------
    func creatCAEmitterLayer() {
        var rect = CGRect(x: 0.0, y: -70.0, width: 10, height: 10.0) //发射位置
        rect.origin.x = self.view.center.x
        let emitter = CAEmitterLayer()
        emitter.frame = rect
        view.layer.addSublayer(emitter)  //添加到layer层
        /*
         emitterShape: 发射器的形状
         kCAEmitterLayerPoint;//点的形状，粒子从一个点发出
         kCAEmitterLayerLine;//线的形状，粒子从一条线发出
         kCAEmitterLayerRectangle;//矩形形状，粒子从一个矩形中发
         kCAEmitterLayerCuboid;//立方体形状，会影响Z平面的效果
         kCAEmitterLayerCircle;//圆形，粒子会在圆形范围发射
         kCAEmitterLayerSphere;//球型
         */
        emitter.emitterShape = kCAEmitterLayerRectangle

        emitter.emitterPosition = CGPoint(x: rect.width/2, y: rect.height/2) //发射器在xy平面的中心位置。
        emitter.emitterSize = rect.size //发射器尺寸
        
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "huaban")?.cgImage // 花瓣图片
        emitterCell.birthRate = 3 // 每秒产生花瓣的数量
        emitterCell.lifetime = 10 // 花瓣的存活时间
        emitterCell.yAcceleration = 30.0 // y轴上的加速度
        emitterCell.xAcceleration = 5.0 //x轴上的加速度
        emitterCell.velocity = 15.0 //初始速度
        emitterCell.emissionLongitude = CGFloat(-Double.pi) //向左
        emitterCell.velocityRange = 200.0 //速度范围
        emitterCell.emissionRange = CGFloat(Double.pi/2)  //周围发射角度
        emitterCell.spin = 1 //粒子旋转速度
        emitterCell.alphaRange = 0.3  //粒子透明度能改变的范围
        
        let emitterCell1 = CAEmitterCell()
        emitterCell1.contents = UIImage(named: "huaban")?.cgImage
        emitterCell1.birthRate = 4
        emitterCell1.lifetime = 10
        emitterCell1.yAcceleration = 35.0  //给Y方向一个加速度
        emitterCell1.xAcceleration = 5.0 //x方向一个加速度
        emitterCell1.velocity = 8.0 //初始速度
        emitterCell1.emissionLongitude = CGFloat(-Double.pi) //向左
        emitterCell1.velocityRange = 150.0
        emitterCell1.emissionRange = CGFloat(Double.pi/2)
        emitterCell1.spin = 0.5
        emitterCell1.alphaRange = 0.5
        emitterCell1.alphaSpeed = 1


        emitter.emitterCells = [emitterCell, emitterCell1]  //这里可以设置多种粒子 我们以一种为粒子
    }
    
    
    //隐藏状态栏
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

