import processing.serial.*;

Serial port;

int width = 800;
float maxHeight = 150;
float minHeight = 10;

float c1x=width, c1y=random(minHeight, maxHeight), c2x=width, c2y=random(minHeight, maxHeight), c3x=width, c3y=random(minHeight, maxHeight), c4x=width, c4y=random(minHeight, maxHeight), c5x=width, c5y=random(minHeight, maxHeight), c6x=width, c6y=random(minHeight, maxHeight);
float e1x=width, e1y=random(15, 90), e2x=width, e2y=random(15, 80);
float px = 80, py = height/2;

float minCloudPan = -120;
float minEnemyPan = -50;
float speed = 2;
float enemy1Speed = 0.9, enemy2Speed = 1.2;

void setup(){
    size(800, 400);
    port = new Serial(this, Serial.list()[0], 115200);
    plane = loadShape("plane.svg");
    cloud = loadShape("cloud.svg");
    enemy = loadShape("bot1.svg");
    port.bufferUntil('\n');
}

void draw(){
    background(#ADA0A0);
    getShapes();
    moveClouds();
    movePlane();
    //movePlaneOnDroid();
    moveEnemy();
    boolean gameConditionX = (px+35>e1x-25)&&(px-35<e1x+25)||(px+35>e2x-25)&&(px-35<e2x+25);
    boolean gameConditionY = (py+35>e1y-25)&&(py-35<e1y+25)||(py+35>e2y-25)&&(py-35<e2y+25);
    if(gameConditionX && gameConditionY){
        gameOver();
    }
    
    String inString = port.readStringUntil('\n');
    if(inString != null){
      inString = trim(inString);
      py = float(inString);
    }
}
