//
//  ViewController.m
//  Bluetoother
//
//  Created by Phillipus on 29/04/2012.
//  Copyright (c) 2012 Dada Beatnik. All rights reserved.
//

#import "ViewController.h"

// Private BluetoothManager stuff
@interface BluetoothManager : NSObject

+ (id)sharedInstance;
- (BOOL)setEnabled:(BOOL)enabled;
- (BOOL)enabled;
- (BOOL)setPowered:(BOOL)powered;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    
    BluetoothManager *btManager = [BluetoothManager sharedInstance];

    // This part needs to be dispatched on the main UI thread to work (but not the above line - why?)
    dispatch_async(dispatch_get_main_queue(), ^{
        BOOL enabled = [btManager enabled];
        [self.theSwitch setOn:enabled];
        //[self setBadge:enabled];
    });
}

-(IBAction) toggleBluetooth:(UISwitch *)uiSwitch {
	BOOL enabled = uiSwitch.isOn;
    
    BluetoothManager *btManager = [BluetoothManager sharedInstance];
	[btManager setPowered:enabled];
	[btManager setEnabled:enabled];
	//[self setBadge:enabled];
}

// Show 1 or 0 badge for on/off state
-(void) setBadge:(BOOL)setting {
	int badgeNumber = setting ? 1 : 0;
	[[UIApplication sharedApplication] setApplicationIconBadgeNumber:badgeNumber];
}

@end
