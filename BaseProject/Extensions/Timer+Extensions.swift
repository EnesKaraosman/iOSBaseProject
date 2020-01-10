//
//  Timer+Extensions.swift
//  BaseProject
//
//  Created by Enes Karaosman on 10.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation

extension Timer {
    
    /**
     setTimeout()
     
     Shorthand method for create a delayed block to be execute on started Thread.
     
     This method returns ``Timer`` instance, so that user may execute the block
     within immediately or keep the reference for further cancelation by calling
     ``Timer.invalidate()``
     
     Example:
     let timer = Timer.setTimeout(0.3) {
     // do something
     }
     timer.invalidate()      // cancel it.
     */
    static func setTimeout(delay: TimeInterval, block: @escaping () -> Void) -> Timer {
        return Timer.scheduledTimer(timeInterval: delay, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: false)
    }
    
    /**
     setInternval()
     
     Similar to Timer.setTimeout() this method will return ``Timer`` instance however, this
     method will execute repeatedly.
     
     Warning using this method with caution, it is recommended that the block to utilise
     this method should call [unowned self] or [weak self] to announce OS that it should not
     hold strong reference to this block.
     
     In addition, ``Timer`` returned should kept as member variable, and call invalidated()
     when the block no longer required. such as deinit, or viewDidDisappear()
     */
    static func setInterval(interval: TimeInterval, block: @escaping () -> Void) -> Timer {
        return Timer.scheduledTimer(timeInterval: interval, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: true)
    }
    
}
