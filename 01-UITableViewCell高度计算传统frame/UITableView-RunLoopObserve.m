//
//  UITableView-RunLoopObserve.m
//  01-UITableViewCell高度计算传统frame
//
//  Created by guochaoyang on 15/9/22.
//  Copyright © 2015年 guochaoyang. All rights reserved.
//

#import "UITableView-RunLoopObserve.h"

@implementation UITableView (RunLoopObserve)

- (void)fd_precacheIfNeeded
{
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    
    // This is a idle mode of RunLoop, when UIScrollView scrolls, it jumps into "UITrackingRunLoopMode"
    // and won't perform any cache task to keep a smooth scroll.
    CFStringRef runLoopMode = kCFRunLoopDefaultMode;
    
    // Collect all index paths to be precached.
//    NSMutableArray *mutableIndexPathsToBePrecached = self.fd_allIndexPathsToBePrecached.mutableCopy;
    
    // Setup a observer to get a perfect moment for precaching tasks.
    // We use a "kCFRunLoopBeforeWaiting" state to keep RunLoop has done everything and about to sleep
    // (mach_msg_trap), when all tasks finish, it will remove itself.
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler
    (kCFAllocatorDefault, kCFRunLoopBeforeWaiting, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity _) {
        NSLog(@"I am in CFRunLoopObserverRef block...");
        // Remove observer when all precache tasks are done.
//        if (mutableIndexPathsToBePrecached.count == 0) {
//            CFRunLoopRemoveObserver(runLoop, observer, runLoopMode);
//            CFRelease(observer);
//            return;
//        }
        // Pop first index path record as this RunLoop iteration's task.
//        NSIndexPath *indexPath = mutableIndexPathsToBePrecached.firstObject;
//        [mutableIndexPathsToBePrecached removeObject:indexPath];
        
        // This method creates a "source 0" task in "idle" mode of RunLoop, and will be
        // performed in a future RunLoop iteration only when user is not scrolling.
        [self performSelector:@selector(fd_precacheIndexPathIfNeeded:)
                     onThread:[NSThread mainThread]
                   withObject:nil
                waitUntilDone:NO
                        modes:@[NSDefaultRunLoopMode]];
    });
    
    CFRunLoopAddObserver(runLoop, observer, runLoopMode);
}


- (void)fd_precacheIndexPathIfNeeded:(id)sender
{
    NSLog(@"I am in fd_precacheIndexPathIfNeeded method..");
}


@end
