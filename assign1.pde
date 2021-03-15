PImage bg, groundhog, life, robot, soil, soldier;

float soldierX, soldierY;
float soldierXSpeed;

float robotX, robotY;
float laserX, laserY;
float laserXSpeed;
float laserWidth, laserHeight;


void setup()
{
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
  groundhog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soil = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");
  
  //soldier
  soldierX = 0;
  soldierY = floor(random(2,6))*80;
  soldierXSpeed = 4;
  
  //robot
  robotX = floor(random(2,8))*80;
  robotY = floor(random(2,6))*80;
  
  //laser
  laserX = robotX+25;
  laserY = robotY+37;
  laserXSpeed = 2;
  laserWidth = 10;
  laserHeight = 10;
}

void draw()
{
	background(bg);
  image(life, 10, 10);
  image(life, 80, 10);
  image(life, 150, 10);
  image(soil, 0, 160);
  
  //lawn
  noStroke();
  fill(124,204,25);
  rect(0,145,640,15);
  
  //sun
  strokeWeight(5);
  stroke(255,255,0);
  fill(253,184,19);
  ellipse(590,50,120,120);
  
  image(groundhog, 280, 80);
  
  //PartII:
  //soldier random appear
  image(soldier, soldierX, soldierY);
  
  //soldier left to right
  soldierX += soldierXSpeed;
  soldierX %= 640+80;
  
  //robot random appear
  image(robot, robotX, robotY);
  
  //PartIII:
  //laser drawing
  noStroke();
  fill(255,0,0);
  arc(laserX, laserY, 10, 10, HALF_PI, PI+HALF_PI, CHORD);
  arc(laserX+laserWidth-10, laserY, 10, 10, -HALF_PI, HALF_PI, CHORD);
  rect(laserX, laserY-5, laserWidth-10, laserHeight);
  
  //laser shooting
  laserX -= laserXSpeed;
  laserWidth += laserXSpeed;
  
  //laser max width
  if(laserWidth >= 40)
  {
    laserWidth = 40;
  }
  
  //laser move range
  if(laserX <= robotX-160+5)
  {
    //shoot again
    laserX = robotX+25;
    laserY = robotY+37;
    laserXSpeed = 2;
    laserWidth = 10;
    laserHeight = 10;
  }
}
