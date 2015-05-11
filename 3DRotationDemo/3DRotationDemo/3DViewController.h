//
//  Ninth_LessonViewController.h
//  Ninth Lesson
//
//  Created by Diney Bomfim on 6/5/11.
//  Copyright 2011 DB-Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <NinevehGL/NinevehGL.h>

@interface Ninth_LessonViewController : UIViewController <NGLViewDelegate,NGLMeshDelegate>
{
	NGLMesh *mesh;
	NGLCamera *camera;
	
	float distance;
	CGPoint position;
}

@end
