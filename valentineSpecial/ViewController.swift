

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loveBtn: UIButton!
    
    var longGesture = UILongPressGestureRecognizer()
    
    var chocos:[UIImage] = [UIImage(named: "choco1")!,UIImage(named: "choco2")!,UIImage(named: "choco3")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //ボタンの幅
        loveBtn.layer.frame.size.width = 100
        //ボタンの高さ
        loveBtn.layer.frame.size.height = 100
        
        //ボタンの背景画像
        loveBtn.setBackgroundImage(UIImage(named:"heart1"), for: .normal)//押されてない時normal
        
        loveBtn.setBackgroundImage(UIImage(named:"heart2"), for: .highlighted)//押された時
        
        
    }
    
    
    @IBAction func tapBtan(_ sender: UIButton) {
        //チョコをランダムに選ぶための数字
        let randomNumber = Int(arc4random()) % chocos.count
        
        //インスタンス化
        let chocoImage = UIImageView()
        //位置や大きさ等のプロパティ
        chocoImage.image = chocos[randomNumber]
        chocoImage.frame.size.width = 100
        chocoImage.frame.size.height = 100
        chocoImage.center = view.center //Viewの中心
        chocoImage.contentMode = UIView.ContentMode.scaleAspectFit //画像の起きさを比率を保ったまま、Viewに収める
        
        //この画像を検出するためのタグ
        chocoImage.tag = 1
        //ユーザーの操作に反応するようにする
        chocoImage.isUserInteractionEnabled = true
        
        //Viewに追加
        view.addSubview(chocoImage)
        
        //どのターゲットを長押しした時に、どの関数を実行するか
        longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(_:)))
        //関数が実行されるまでの長押しする時間
        longGesture.minimumPressDuration = 0.5
        //viewにジェスチャー機能を追加
        chocoImage.addGestureRecognizer(longGesture)
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            //タッチしたViewを取得
            let touchView = touch.view
            if touchView?.tag == 1{
                //タッチした位置に画像の中心を持ってくる
                touchView?.center = touch.location(in: view)
            }
        }
    }
    //画面をなぞった時に呼ばれる関数
    override func  touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchesBegan(touches, with: event)
    }
    
    
    
    //長押しされた時
    @objc func longPress(_ sender: UILongPressGestureRecognizer) {
        sender.view!.removeFromSuperview()
        
    }
    
}
