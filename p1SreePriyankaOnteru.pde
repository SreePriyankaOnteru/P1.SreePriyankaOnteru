/*TouchScreen Microwave Interface*/

import controlP5.*; // This library is used to import buttons, knob, toggle, sliders etc.
ControlP5 button;
ControlP5 Obutton;
PImage image;
int timer=0,time=0,doorvalue=0,cooktime=0;

void setup(){
  size(850,450);
  background(#66644b);
  fill(87);
  stroke(200);
  rect(40,65,450,330);//screen
  fill(255);
  stroke(0,0);
  rect(525,2,2,550);//Control Interface
  
  //Buttons on Interface
  button = new ControlP5(this); //object creation
  button.setColorBackground(#171716);
  button.addButton("1").setValue(0).setPosition(540,135).setSize(55,55);
  button.addButton("2").setValue(0).setPosition(600,135).setSize(55,55);
  button.addButton("3").setValue(0).setPosition(660,135).setSize(55,55);
  button.addButton("4").setValue(0).setPosition(540,195).setSize(55,55);
  button.addButton("5").setValue(0).setPosition(600,195).setSize(55,55);
  button.addButton("6").setValue(0).setPosition(660,195).setSize(55,55);
  button.addButton("7").setValue(0).setPosition(540,255).setSize(55,55);
  button.addButton("8").setValue(0).setPosition(600,255).setSize(55,55);
  button.addButton("9").setValue(0).setPosition(660,255).setSize(55,55);
  button.addButton("0").setValue(0).setPosition(600,315).setSize(55,55);
  
  Obutton = new ControlP5(this);
  Obutton.addButton("Defrost").setValue(0).setPosition(720,135).setSize(55,55);
  Obutton.addButton("TimeCook").setValue(0).setPosition(720,195).setSize(55,55);
  Obutton.addButton("Open/\nClose").setValue(0).setPosition(720,255).setSize(55,55);
  Obutton.addButton("Start").setValue(0).setPosition(540,315).setSize(55,55);
  Obutton.addButton("Stop").setValue(0).setPosition(660,315).setSize(55,55);
}

void draw(){
fill(87);
rect(600, 70, 100, 50, 7); //timer
fill(255,0,0);
textSize(30);
String minsec[] = count();
text(minsec[1] + ":" + minsec[0],610,105);
}

String[] count(){
  int sec = timer/60;
  int min=0;
  if(sec>=60){
    min = (timer/60)/60;
    sec = sec%60;
  }
  if(min>=60){
    min=min%60;
  }
  int seconds = time/60;
  int minute = 0;
  if(seconds>=60){
    minute = (time/60)/60;
    seconds = seconds%60;
  }
  if(minute>=60){
    minute=minute%60;
  }
  String str_seconds = String.valueOf(seconds);
  String str_minute = String.valueOf(minute);
  if (time > 0){
    time=time-1;
  }
  if (seconds < 10){
    str_seconds = "0" + seconds;
  }
  if (minute < 10){
    str_minute = "0" + minute;
  }
  if(doorvalue==1){
    time=0;
  }
   if(cooktime == 1){
   str_seconds = String.valueOf(sec);
   str_minute = String.valueOf(min);
    
  if (sec < 10){
    str_seconds = "0" + sec;
  }
  if (min < 10){
    str_minute = "0" + min;
  }
  
  if(doorvalue==1){
    timer=0;
  }
 }
  String minsec[] = {str_seconds, str_minute};
  return minsec;
}

void mouseClicked(){
  if(mouseX> 540 && mouseX < 595 && mouseY>135 && mouseY<190){ 
  if(cooktime==1){
    timer=(timer*10)+((3600/60)*1);
  }
  else if(cooktime==0){
    time+= 3600; 
   }
  }
  if(mouseX> 600 && mouseX < 655 && mouseY>135 && mouseY<190){ 
  if(cooktime==1){
    timer=(timer*10)+((3600/60)*2);
  }
  else if(cooktime==0){
     time+= (3600*2); 
   }
  }
    if(mouseX>660 && mouseX<715 && mouseY>135 && mouseY<190){ 
   if(cooktime==1){
    timer=(timer*10)+((3600*3)/60);
  }
  else{
     time+= (3600*3); 
   }
  }
  if(mouseX>540 && mouseX<595 && mouseY>195 && mouseY<250){ 
    if(cooktime==1){
    timer=(timer*10)+((3600*4)/60);
  }
  else{
  time += (3600*4);
   }
  }
  if(mouseX> 600 && mouseX < 655 && mouseY>195 && mouseY<250){ 
   if(cooktime==1){
    timer=(timer*10)+((3600*5)/60);
  }
  else{
  time+= (3600*5); 
   }
  }
  if(mouseX> 660 && mouseX <715 && mouseY>195 && mouseY<250){ 
   if(cooktime==1){
    timer=(timer*10)+((3600*6)/60);
  }
  else{
  time+= (3600*6); 
   }
  }
  if(mouseX>540 && mouseX<595 && mouseY>255 && mouseY<310){ 
  if(cooktime==1){
    timer=(timer*10)+((3600*7)/60);
  }
  else{
  time+= (3600*7); 
   }
  }
  if(mouseX>600 && mouseX<655 && mouseY>255 && mouseY<310){ 
  if(cooktime==1){
    timer=(timer*10)+((3600*8)/60);
  }
  else{
  time+= (3600*8); 
   }
  }
  if(mouseX>660 && mouseX<715 && mouseY>255 && mouseY<310){ 
  if(cooktime==1){
    timer=(timer*10)+((3600*9)/60);
  }
  else{
  time+= (3600*9); 
   }
  }
  if(mouseX>600 && mouseX<655 && mouseY>315 && mouseY<370){ 
  if(cooktime==1){
     timer=(timer*10);
   }
   else{
     time=0;
   }
  }
  if(mouseX>540 && mouseX<595 && mouseY>315 && mouseY<370){ 
  if(cooktime == 1){
    time = timer;
    cooktime = 0;
  }
  else{
  time+= (3600/2); 
   }
  }
  if(mouseX>660 && mouseX<715 && mouseY>315 && mouseY<370){ 
  cooktime = 0;
  timer = 0;
  time = 0; 
  }
  if(mouseX>720 && mouseX <775 && mouseY>255 && mouseY<310){ 
    if(doorvalue == 1){ 
      fill(0);
      stroke(200);
      rect(0,0,525,550);
      fill(87);
      stroke(0);
      rect(40,65,450,330);
      doorvalue = 0;
     }
     else if(doorvalue == 0){
      fill(#c4c46a);
      stroke(0);
      rect(40,65,450,330);
      doorvalue=1;
      timer = 0;
     }
    }
  if(mouseX>720 && mouseX <775 && mouseY>195 && mouseY<250)
   cooktime = 1;
  if(mouseX>720 && mouseX<775 && mouseY>135 && mouseY<190){
    if(cooktime==1){
    timer=(timer*10)+((3600*5)/60);
  }
  else{
  time+= (3600*5); 
   }
  }
    
}
