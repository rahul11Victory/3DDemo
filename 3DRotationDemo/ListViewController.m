//
//  ListViewController.m
//  3DRotationDemo


#import "ListViewController.h"
#import "ThreeDObjectViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // Set title for Navigation Controller Page.
    [self setTitle:@"Select Sample"];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (IBAction) sampleButtonClicked:(id)sender{
    UIButton *tappedButton = (UIButton*)sender;
    NSString *sampleFilePath ;

    // Load the 3D View Controller to display Objects.
    ThreeDObjectViewController *threeDobjectViewController = [[ThreeDObjectViewController alloc] initWithNibName:@"ThreeDObjectViewController" bundle:[NSBundle mainBundle]];

    // Check which button is Tapped and Load appropriate Object.
    if ([tappedButton tag] == 1) {
        sampleFilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Cow.obj"];
        [threeDobjectViewController setObjectName: @"Cow"];

    }
    else if ([tappedButton tag] == 2) {
        sampleFilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Tea Pot.obj"];
        [threeDobjectViewController setObjectName:@"Tea Pot"];
    }
    else{
        sampleFilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Teddy.obj"];
        [threeDobjectViewController setObjectName: @"Teddy"];
    }
    
     // Set File Path.
    [threeDobjectViewController setObjFilePath:sampleFilePath];
    [self.navigationController pushViewController:threeDobjectViewController animated:YES];
}

@end
