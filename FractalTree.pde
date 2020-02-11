private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .35;  
private float h=0.0;
private float s=0.0;
private float b=255.0;
public void setup() 
{   
	size(640,480); 
	frameRate(30); 
	colorMode(HSB);  
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength *=fractionLength;
	int endX1 = (int) (branchLength*Math.cos(angle1) + x);
	int endY1 = (int) (branchLength*Math.sin(angle1) + y);
	int endX2 = (int) (branchLength*Math.cos(angle2) + x);
	int endY2 = (int) (branchLength*Math.sin(angle2) + y);
	stroke(h,s,b);
	line(x,y,endX1,endY1); 
	line(x,y,endX2,endY2);
	h+=1;
	if (h>255) {
		h=0;
	}
	s+=1;
	if (s>255) {
		s=0;
	}
	b-=1;
	if (b<200) {
		b=250;
	}
	if (branchLength>smallestBranch) {
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 

