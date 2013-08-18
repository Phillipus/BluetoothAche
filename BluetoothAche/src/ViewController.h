//
//  ViewController.h
//  Bluetoother
//
//  Created by Phillipus on 29/04/2012.
//  Copyright (c) 2012 Dada Beatnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISwitch *theSwitch;
- (IBAction)toggleBluetooth:(UISwitch *)uiSwitch;

@end
