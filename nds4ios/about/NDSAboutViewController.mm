//
//  NDSAboutViewController.m
//  nds4ios
//
//  Created by Developer on 7/8/13.
//  Copyright (c) 2013 InfiniDev. All rights reserved.
//

#import "NDSAboutViewController.h"
#import "Twitter/Twitter.h"
#import "emu.h"

@interface NDSAboutViewController ()

@end

@implementation NDSAboutViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:78.0/255.0 green:156.0/255.0 blue:206.0/255.0 alpha:1.0]];
    
    versionLabel.text = [NSBundle mainBundle].infoDictionary[@"GitVersionString"];
    desmumeVersion.text = [NSString stringWithCString:EMU_version() encoding:NSASCIIStringEncoding];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *screenNames = @[@"angelXwind", @"iPlop", @"maczydeco", @"rileytestut", @"dchavezlive", @"Malvix_", @"wj82315", @"vanillastar67", @"winocm", @"GranPC"];
    if (indexPath.section == 0)
    {
        NSURL *twitterURL = [NSURL URLWithString:[NSString stringWithFormat:@"twitter://user?screen_name=InfiniDev_"]];
        if ([[UIApplication sharedApplication] canOpenURL:twitterURL])
            [[UIApplication sharedApplication] openURL:twitterURL];
        else
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://twitter.com/InfiniDev_"]]];
    } else if (indexPath.section == 1 && indexPath.row < screenNames.count)
    {
        NSURL *twitterURL = [NSURL URLWithString:[NSString stringWithFormat:@"twitter://user?screen_name=%@", screenNames[indexPath.row]]];
        if ([[UIApplication sharedApplication] canOpenURL:twitterURL])
            [[UIApplication sharedApplication] openURL:twitterURL];
        else
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://twitter.com/%@", screenNames[indexPath.row]]]];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)sendTweet:(id)sender {
    //New tweet sheet
    SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    //Preloaded message
    [tweetSheet setInitialText:@"I love playing Nintendo DS games on my iOS device with #nds4ios from @InfiniDev_"];
    
    [tweetSheet addURL:[NSURL URLWithString:@"http://nds4ios.angelxwind.net/"]];
    
    //Set a blocking handler for the tweet sheet
    tweetSheet.completionHandler = ^(SLComposeViewControllerResult result){
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    //Show the tweet sheet
    [self presentViewController:tweetSheet animated:YES completion:nil];
}

@end
