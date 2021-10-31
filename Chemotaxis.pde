mouseys[] dots;
floaties[] pop = new floaties[100]; //this is just the "apartments" the 100, but they are all empty because new instances of the floaties class need to be made


void setup() {
  size(700, 700);
  dots = new mouseys[154];
  for (int i = 0; i < dots.length; i++)
  {
    dots[i] = new mouseys();
  }
  for (int i = 0; i < pop.length; i++) {
    pop[i] = new floaties(); // this is parentheses because it calls the constructor as it makes a new instance of the floaties class
  }
}
void draw() {
  background(255);
  for (int i = 0; i < dots.length; i++)
  {

    dots[i].move();
    dots[i].show();
  }

  for (int i = 0; i < pop.length; i++) {

    pop[i].rise();
    pop[i].show(); //dot operator allows us to get to the parts inside the floaties (all the variables and stuff) d
  }
}


class floaties
{
  float myX;
  int myY;
  float mySpeed;
  int mySize;
  int myColor;

  floaties() {//constructor for the 5 member variables as it initializes them
    myX = (int)(Math.random()*700); //dot operator does
    myY = (int)(Math.random()*700);
    mySize = (int)(Math.random()*80)+20;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256-100));
    mySpeed = mySize/60.0; //making the speed proportional to size of floaties
  }
  void rise() { //move function basically
    myY = myY + (int)(Math.random()*3)-1;
    myX = myX - mySpeed; //want to go top of screen where y is smaller
    if (myX < -100) { //this is to make them loop over the screen over and over as they rise up and restart at the bottom
      myX = 700;
    }
  }
  void show()
  {
    fill(myColor);
    stroke(myColor);
    rect(myX, myY, mySize, mySize, 6);
  }
}

class mouseys {
  int xe, ye, value, randR, randG, randB;

  mouseys() {
    xe = 250;
    ye = 250;
    randR = 22;
    randG = 80;
    randB = 100;
  }

  void move() {

    if (mouseX > xe) {
      xe = xe + (int)(Math.random()*20);
    } else {
      xe = xe - (int)(Math.random()*20);
    }
    if (mouseY > ye) {
      ye = ye + (int)(Math.random()*20);
    } else {
      ye = ye - (int)(Math.random()*20);
    }
  }

  void mousePressed() {
    randR = (int)(Math.random()*256)+20;
    randG = (int)(Math.random()*256)+20;
    randB = (int)(Math.random()*256)+20;
  }

  void show() {
    noStroke();
    rect(xe, ye, 10, 10);
    if (mousePressed) {
      fill(randR, randG, randB, 100);
    }
  }
}
