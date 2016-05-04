//
//  ViewController.swift
//  AudioRecorder
//
//  Created by 張 景隆 on 2015/5/11.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioRecorder:AVAudioRecorder?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 設定 AudioSession 為 可播放＆錄音
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord, withOptions: .DefaultToSpeaker)
        } catch _ {
        }

        // 指定錄音檔
        let directoryURL = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).first
        let audioFileURL = directoryURL!.URLByAppendingPathComponent("memo.m4a")
        
        // 設定錄音格式
        let recorderSetting:[String : AnyObject] = [
            AVFormatIDKey: NSNumber(unsignedInt: kAudioFormatMPEG4AAC), // 指定格式
            AVSampleRateKey: 44100.0, // 取樣率
            AVNumberOfChannelsKey: 2  // 聲道
        ]
        
        
        // 準備錄音
        audioRecorder = try? AVAudioRecorder(URL: audioFileURL, settings: recorderSetting)
        audioRecorder?.prepareToRecord()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doRecorder(sender: AnyObject) {
        
        // Swift 2.0 新寫法
        if let recorder = audioRecorder where !recorder.recording {
            
            let audioSession = AVAudioSession.sharedInstance()
            
            if let _ = try? audioSession.setActive(true) {
                // 開始錄音
                print("開始錄音")
                recorder.record()
            }
            

        }
        
    }

    @IBAction func doStop(sender: AnyObject) {
        // 停止錄音
        print("停止錄音")
        audioRecorder?.stop()
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(false)
        } catch _ {
        }

    }
}

