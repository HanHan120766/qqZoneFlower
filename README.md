# ios实现qq空间飘落的花瓣（swift—粒子发射器）

有时候打开好友的qq空间会看到很多漂亮的装饰，最常见的就是在页面飘落装饰物（蒲公英、花瓣等等）。作为一个ios程序猿（现在做h5）就会在想这个东西怎么搞的呢？哈哈，接下来就为大家来分享一下ios如何实现飘落的花瓣。。。��

说道飘落的效果首先来说一下ios的一个动画—–粒子发射器（CAEmitterLayer）。

CAEmitterLayer用来实现基于Core Animation的粒子发生器系统。每个粒子都是一个CAEmitterCell的实例。粒子绘制在背景色与border之上。CAEmitterLayer作为高性能的粒子引擎，可以被用来创建实时粒子动画如：烟雾，雨等效果（本次来做花瓣飘落效果）。嘻嘻��

在属性中，可以指定Layer中的CAEmitterCell数组，每个cell定义了自己的一组属性，如速度、粒子发生率、旋转、缩放或者内容。每个粒子也都是一个emitterCell属性，可以作为一个粒子发生器来运作。Layer还可以设置发生器的位置、发生形状、发射单元的位置等。

先来看看qq空间的花瓣效果：

![qq空间效果图](https://static.shengri.cn/uploads/xydd/wechat/cards/qq.gif)

再来看看我们要完成的效果：

![完成的效果图](https://static.shengri.cn/uploads/xydd/wechat/cards/qq1.gif)

有没有很漂亮（快夸夸我。。。）

接下来就开搞，直接上代码：说明全在注释里---

```
//创建粒子发射器
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
```
创建好粒子发射器，该设置我们的粒子的属性

```
//创建粒子0
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
```
最后将创建的粒子放到粒子发射器中

```
emitter.emitterCells = [emitterCell]  //这里可以设置多种粒子 我们以一种粒子
```
到了这一步，我们的粒子发射器就完成了，再配上我们的美美哒背景图片并隐藏状态栏

```
func creatUI() {
	let backgroundImgView = UIImageView()
	backgroundImgView.image = UIImage(named: "img5.jpeg")
	backgroundImgView.frame = self.view.frame
	self.view.addSubview(backgroundImgView)
}
//隐藏状态栏
override var prefersStatusBarHidden: Bool {
    get {
        return true
    }
}
```
哈哈哈，有没有觉得很简单呢！粒子发射器这个功能就在那里，就看我们的脑洞怎么去发掘它的能力了。
