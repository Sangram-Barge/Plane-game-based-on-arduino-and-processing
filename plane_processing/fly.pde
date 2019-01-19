PShape plane;
PShape cloud;
PShape enemy;

void getShapes(){
    shapeMode(CENTER);
    shape(plane, px, py, 90, 90);
    shape(cloud, c1x, c1y);
    shape(cloud, c2x, c2y);
    shape(cloud, c3x, c3y);
    shape(cloud, c4x, c4y);
    shape(cloud, c5x, c5y);
    shape(cloud, c6x, c6y);
    shape(enemy, e1x, e1y, 100, 100);
    //shape(enemy, e2x, e2y, 50, 50);
}

void moveClouds(){
    if(c1x>minCloudPan){
        c1x -= 0.8;
    }else c1x=width;

    if(c2x>minCloudPan){
        c2x -= .7;
    }else c2x=width;

    if(c3x>minCloudPan){
        c3x -= .9;
    }else c3x=width;

    if(c4x>minCloudPan){
        c4x -= 1.1;
    }else c4x=width;

    if(c5x>minCloudPan){
        c5x -= 1.3;
    }else c5x=width;

    if(c6x>minCloudPan){
        c6x -= 1.2;
    }else c6x=width;
}

 void movePlane(){
     if(keyPressed && keyCode == 38){
         py -= speed;
     }

     else if(keyPressed && keyCode == 40){
         py += speed;
     }

     else if(keyPressed && keyCode == 39){
         px += speed;
     }

     else if(keyPressed && keyCode == 37){
         px -= speed;
     }
 }

//void movePlaneOnDroid(){
//    px = mouseX;
//    py = mouseY;
//}

void moveEnemy(){
    if(e1x>minEnemyPan){
        e1x -= enemy1Speed;
    }else {
        e1x=width;
        e1y=random(0, 200);
        enemy1Speed = random(0.5, 2);
    }

//    if(e2x>minEnemyPan){
//        e2x -= enemy2Speed;
//    }else {
//        e2x=width; 
//        e2y=random(250, 350);
//        enemy2Speed = random(0.8, 2);
//    }
}

void gameOver(){
    println("game over");
    for(int i=3; i>=1; i--){
        println("Game starts in "+i);
        delay(1000);
    }

    px = 80;
    py = height/2;

    e1x = width;
    e1y = 150;
    e2x = width;
    e2y = 200;
}
