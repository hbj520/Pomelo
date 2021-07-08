//
//  UIView+ BUFullscreenVideoAd.swift
//  IDPhotoMaker
//
//  Created by Bron on 2020/9/5.
//  Copyright © 2020 Bron. All rights reserved.
//

import Foundation
import BUAdSDK
private var KSubsriberKey:String = "KSubsriberKey"
private var KRemoveSubscriberKey:String = "KRemoveSubscriber"
private var KfullScreenKey:String = "KfullScreenKey"
let kRootVC = UIApplication.shared.keyWindow?.rootViewController

public extension UIViewController{
    var nativeAsdSubscriber:RACSubscriber?{
        get{
            return (objc_getAssociatedObject(self, &KSubsriberKey) as? RACSubscriber)
        }
        set{
            objc_setAssociatedObject(self, &KSubsriberKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    var nativeAdRemoveSubscriber:RACSubscriber?{
        get{
            return (objc_getAssociatedObject(self, &KRemoveSubscriberKey) as? RACSubscriber)
        }
        set{
            objc_setAssociatedObject(self, &KRemoveSubscriberKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    var fullscreenAd:BUNativeExpressFullscreenVideoAd?{
        get{
            return (objc_getAssociatedObject(self, &KfullScreenKey) as? BUNativeExpressFullscreenVideoAd)
        }
        set{
            objc_setAssociatedObject(self, &KfullScreenKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    //加载全凭视频广告
    func loadFullScreenVideoAd(slotId:String)->RACSignal<AnyObject>{
        return RACSignal.createSignal { [weak self](subscriber) -> RACDisposable? in
            self?.nativeAsdSubscriber = subscriber
            self?.fullscreenAd = BUNativeExpressFullscreenVideoAd.init(slotID: slotId)
            self?.fullscreenAd?.delegate = self
            self?.fullscreenAd?.loadData()
            return nil
        }
    }
}

extension UIViewController:BUNativeExpressFullscreenVideoAdDelegate{
    public func nativeExpressFullscreenVideoAdViewRenderSuccess(_ rewardedVideoAd: BUNativeExpressFullscreenVideoAd) {
        self.fullscreenAd?.show(fromRootViewController: kRootVC ?? UIViewController())
    }
    public func nativeExpressFullscreenVideoAd(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd, didFailWithError error: Error?) {
        self.nativeAsdSubscriber?.sendNext((true))

    }
    public func nativeExpressFullscreenVideoAdDidLoad(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd) {
        
        self.fullscreenAd?.show(fromRootViewController: kRootVC ?? UIViewController())

    }
    public func nativeExpressFullscreenVideoAdDidClose(_ fullscreenVideoAd: BUNativeExpressFullscreenVideoAd) {
        self.nativeAsdSubscriber?.sendNext((true))
    }
}
