import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let mp3URL = NSBundle.mainBundle().URLForResource("lamb", withExtension: "mp3")

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var timer:NSTimer?
    var player:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.progress = 0
        
        player = try? AVAudioPlayer(contentsOfURL: mp3URL!)
        
        print("聲音長度 ", player?.duration)
    }

    @IBAction func doPlay(sender: AnyObject) {
        player?.play()
        
        updateTime()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTime", userInfo: nil, repeats: true)

    }
    
    @IBAction func doPause(sender: AnyObject) {
        player?.pause()
        timer?.invalidate()
    }

    @IBAction func doStop(sender: AnyObject) {
        player?.stop()
        
        player?.currentTime = 0
        updateTime()
        
        timer?.invalidate()
    }
    
    func updateTime() {
        guard let p = player else {return}
        
        print("目前播放時間 ", p.currentTime)

        timeLabel.text = "\(Int(p.currentTime))"
        
        progressView.progress = Float(p.currentTime / p.duration)
    }
}

