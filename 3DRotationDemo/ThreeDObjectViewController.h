//
//  ThreeDObjectViewController.h


#import <UIKit/UIKit.h>
#import <NinevehGL/NinevehGL.h>

@interface ThreeDObjectViewController : UIViewController <NGLViewDelegate,NGLMeshDelegate>{
	NGLMesh *mesh;
	NGLCamera *camera;
	
	float distance;
	CGPoint position;
    
}

@property(nonatomic,retain)    NSString *objFilePath;
@property(nonatomic,retain)    UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain)    UILabel *contentLabel;
@property(nonatomic,retain)     NSString *objectName;
@property(nonatomic,retain)     UIPanGestureRecognizer *recognizer1;

@end
