import processing.net.*; 
import processing.sound.*;

PImage VenstreOrc;
PImage HojreOrc;
PImage VenstreAngreb;
PImage HojreAngreb;
PImage VenstreImp;
PImage HojreImp;
PImage VenstreImpAngreb;
PImage HojreImpAngreb;
PImage baggrund;
PImage bolt;

SoundFile musik;
SoundFile impAngreb;
SoundFile orcAngreb;

int VenstreHojre=0;
float counter = 0;
int angrebstilstand = 0;
int HP = 100;
int start = 0;

float andenPersonPosX;
float andenPersonPosY;
float andenPersonVenstreHojre;
float andenPersonAngrebstilstand;
float andenPersonCounter;

PVector modstanderPos = new PVector(0,0);

movement karakter = new movement();
otherPersonMovement venKarakter = new otherPersonMovement();

lightningBolt magi = new lightningBolt();

Client c; 
String input;
float data[]; 
int abe;

void setup() { 
  fullScreen();
  background(204);
  stroke(0);
  frameRate(15); 

  c = new Client(this, "192.168.43.250", 85); 

  VenstreOrc = loadImage("billeder/Orc1Hvile.png");
  HojreOrc = loadImage("billeder/Orc2Hvile.png");
  VenstreAngreb = loadImage("billeder/Orc1Angreb.png");
  HojreAngreb = loadImage("billeder/Orc2Angreb.png");

  VenstreImp = loadImage("billeder/Imp1.png");
  HojreImp = loadImage("billeder/Imp2.png");
  VenstreImpAngreb = loadImage("billeder/Imp1Angreb.png");
  HojreImpAngreb = loadImage("billeder/Imp2Angreb.png");
  
  baggrund = loadImage("billeder/battleArena.png");
  bolt = loadImage("billeder/ImpMagi.png");

  VenstreOrc.resize(100, 120);
  VenstreAngreb.resize(100, 120);
  HojreOrc.resize(100, 120);
  HojreAngreb.resize(100, 120);

  VenstreImp.resize(100, 120);
  VenstreImpAngreb.resize(130, 120);
  HojreImp.resize(100, 120);
  HojreImpAngreb.resize(130, 120);
  
  bolt.resize(50, 50);
  
  musik = new SoundFile(this, "lyde/musik.mp3");
  musik.amp(0.2);
  musik.loop();
  
  impAngreb = new SoundFile(this, "lyde/impAngreb.mp3");
  orcAngreb = new SoundFile(this, "lyde/orcAngreb.mp3");
} 

void draw() {
  clear();
  background(baggrund);
  karakter.tjekStart();
  if (key != 'f') {
    magi.lynkugle.x = 0;
    magi.lynkugle.y = 0;
    start = 1;
    karakter.tjekKnap();
    karakter.brems();
    karakter.kant();
    karakter.stabil();
    karakter.addFart();
    karakter.tjekSide();
  }

  if (key == 'f') {
    angrebstilstand = 1;
    start = 1;
    karakter.angrib();
  }

  c.write(karakter.pos.x + " " + karakter.pos.y + " " + VenstreHojre + " " + angrebstilstand + " " + counter + " " + magi.lynkugle.x + " " + magi.lynkugle.y);

  venKarakter.venKarakterMove();
  rect(modstanderPos.x, modstanderPos.y, 20, 20);
}
