//
//  ThreeDObjectViewController.m


#import "ThreeDObjectViewController.h"

@implementation ThreeDObjectViewController
@synthesize objFilePath;
@synthesize activityIndicator;
@synthesize contentLabel;
@synthesize objectName;
@synthesize recognizer1;

- (void)dealloc{
	[mesh release];
	[camera release];
    [activityIndicator release];
    [contentLabel release];
    
	
    [super dealloc];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    NSLog(@"Memory Warning for 3D Object...!!!");
}

#pragma mark - View lifecycle

- (float) distanceFromPoint:(CGPoint)pointA toPoint:(CGPoint)pointB{
	float xD = fabs(pointA.x - pointB.x);
	float yD = fabs(pointA.y - pointB.y);
	
	return sqrt(xD*xD + yD*yD);
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touchA, *touchB;
	CGPoint pointA, pointB;
	
	// Pan gesture.
	if ([touches count] == 1){
		touchA = [[touches allObjects] objectAtIndex:0];
		pointA = [touchA locationInView:self.view];
		pointB = [touchA previousLocationInView:self.view];
		
		position.x = (pointA.x - pointB.x);
		position.y = (pointA.y - pointB.y);
	}
    
	// Pinch gesture.
	else if ([touches count] == 2){
		touchA = [[touches allObjects] objectAtIndex:0];
		touchB = [[touches allObjects] objectAtIndex:1];
		
		// Current distance.
		pointA = [touchA locationInView:self.view];
		pointB = [touchB locationInView:self.view];
		float currDistance = [self distanceFromPoint:pointA toPoint:pointB];
		
		// Previous distance.
		pointA = [touchA previousLocationInView:self.view];
		pointB = [touchB previousLocationInView:self.view];
		float prevDistance = [self distanceFromPoint:pointA toPoint:pointB];
		
		distance = (currDistance - prevDistance) * 0.005;
	}
}

- (void)viewDidLoad{

    [self setTitle:objectName];
    [super viewDidLoad];
    
    // Necessary value for the variables are set here. Ex.: Background Color of 3D object, Object File Path. Etc
    nglGlobalColorFormat(NGLColorFormatRGBA);
    nglGlobalColor(nglColorMake(0, 0, 0, 0));
    nglGlobalFilePath(objFilePath);
    nglGlobalFlush();
    
    activityIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] autorelease];
    [activityIndicator setFrame:CGRectMake(350, 239, 37, 37)];
    contentLabel = [[[UILabel alloc] initWithFrame:CGRectMake(450, 239, 181, 37 )] autorelease];
    [contentLabel setText:@"Loading 3D Object..."];
    [contentLabel setTextColor:[UIColor whiteColor]];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    
    [activityIndicator startAnimating];
    [self.view addSubview:activityIndicator];
    [self.view addSubview:contentLabel];
    
    // Settings for the 3D object like Position,Rotation Frequency etc. are set Here.
    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys: kNGLMeshCentralizeYes, kNGLMeshKeyCentralize, @"0.4", kNGLMeshKeyNormalize,
							  nil];
    
    // Initializing Mesh.
	mesh = [[NGLMesh alloc] initWithFile:objFilePath settings:settings delegate:self];
    mesh.rotationSpace = NGLRotationSpaceWorld;
    
    // Initializing Camera for Mesh.
	camera = [[NGLCamera alloc] initWithMeshes:mesh, nil];

    // Starts the debug monitor. just to Statistics of the 3D Model.
	//[[NGLDebug debugMonitor] startWithView:(NGLView *)self.view];
    
    //Add pinch gesture for Zooming In/Out for 3D Object
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [self.view addGestureRecognizer:pinchGestureRecognizer];
    
    //Add pan gesture.
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    
    [panGestureRecognizer setMaximumNumberOfTouches:2];
    [panGestureRecognizer setMinimumNumberOfTouches:2];
    [self.view addGestureRecognizer:panGestureRecognizer];

}

// Method indicating the Completion of Loading the 3D Object.
- (void)meshLoadingDidFinish:(NGLParsing)parsing{

    [activityIndicator stopAnimating];
    [activityIndicator setHidden:YES];
    [contentLabel setHidden:YES];
    NSLog(@"3D Object Loaded Completely...!!!");

}

// Method to Draw the 3D View.
- (void) drawView{
	[mesh rotateRelativeToX:position.y toY:position.x toZ:0.4];
    [camera drawCamera];
	
	position.x = 0.2;
	position.y = 0.2;
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

#pragma mark - Gesture Recognizer

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
 }

/*!
 
 @function    handlePinch
 @abstract    Handle zoom in/ out.
 @discussion  This method used to zoom in/out
 @param       UIPinchGestureRecognizer, used for recognize the view.
 @result      Used for zoom in/out effect on three D object view.
 */
-(void)handlePinch:(UIPinchGestureRecognizer *)recognizer{
 
    recognizer.view.transform=CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale=1;
}

/*!
 
 \internal
 @function    addGestureRecognizer
 @abstract    Adds gesture recognizer.
 @discussion  This method used to add gesture recognizer.
 @result      Gesture recognizer added.
 */
-(void)addGestureRecognizer {
    
    recognizer1=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [recognizer1 setMaximumNumberOfTouches:2];
    [recognizer1 setMinimumNumberOfTouches:2];
    [self.view addGestureRecognizer:recognizer1];
    
}


@end
