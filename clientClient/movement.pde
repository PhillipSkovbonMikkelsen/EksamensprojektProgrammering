class movement {

  PVector pos = new PVector (700, 700);
  PVector fart = new PVector (0, 0);

  void tjekKnap() {
    if (keyPressed) {
      if (key == 'w' || key == 'W') {
        fart.add(0, -1*20);
      }
      if (key == 'a' || key == 'A') {
        fart.add(-1*20, 0);
      }
      if (key == 's' || key == 'S') {
        fart.add(0, 1*20);
      }
      if (key == 'd' || key == 'D') {
        fart.add(1*20, 0);
      }
    }
  }


  void brems() {
    if (fart.y > 0) {
      fart.y = fart.y-0.3*20;
    } else if (fart.y < 0) {
      fart.y = fart.y+0.3*20;
    }

    if (fart.x>0) {
      fart.x = fart.x-0.3*20;
    } else if (fart.x < 0) {
      fart.x = fart.x+0.3*20;
    }
  }

  void kant() {
    if (pos.x > 480 && pos.x < 1390) {
      if (pos.y > 850) {
        fart.y = fart.y/3; 
        pos.y = 849;
      }
      if (pos.y < 100) {
        fart.y = fart.y/3;
        pos.y = 101;
      }
    }

    if (pos.x < 480) {
      if (pos.x - pos.y < -430) {
        fart.x = -fart.x/3;
        fart.y = -fart.y/3;
        pos.x = pos.x + 10;
        pos.y = pos.y - 10;
      }
      if (pos.y < 540) {
        if (pos.x + pos.y < 560) {
          fart.x = -fart.x/3;
          fart.y = -fart.y/3;
          pos.x = pos.x + 10;
          pos.y = pos.y + 10;
        }
      }
    }
    if (pos.x < 110) {
      fart.x = -fart.x;
      pos.x = 111;
    }

    if (pos.x > 1390) {
      if (pos.x-pos.y > 1300) {
        fart.x = -fart.x/3;
        fart.y = -fart.y/3;
        pos.x = pos.x - 10;
        pos.y = pos.y + 10;
      }
      if (pos.x + pos.y > 2220) {
        fart.x = -fart.x/3;
        fart.y = -fart.y/3;
        pos.x = pos.x - 10;
        pos.y = pos.y - 10;
      }
    }

    if (pos.x > 1720) {
      fart.x = -fart.x/3;
      pos.x = 1719;
    }
  }

  void stabil() {
    if (fart.x < 0.3*20 && fart.x > -0.3*20) {
      fart.x = 0;
    }
    if (fart.y < 0.3*20 && fart.y > -0.3*20) {
      fart.y = 0;
    }
  }


  void addFart() {
    pos.add(fart);
    angrebstilstand = 0;
  }

  void tjekSide() {
    if (fart.x < 0) {
      image(VenstreImp, pos.x, pos.y);
      VenstreHojre = 0;
    }
    if (fart.x > 0) {
      image(HojreImp, pos.x, pos.y);
      VenstreHojre = 1;
    }
    if (fart.x == 0) {
      if (VenstreHojre == 0) {
        image(VenstreImp, pos.x, pos.y);
      }
      if (VenstreHojre == 1) { 
        image(HojreImp, pos.x, pos.y);
      }
    }
    counter = 4;
  }

  void tjekStart() {
    if (start == 0) {
      image(VenstreImp, pos.x, pos.y);
    }
  }

  void angrib() {
    if (VenstreHojre == 0) {
      if (counter % 10 > 4) {
        image(VenstreImpAngreb, pos.x-32, pos.y);
      } else {
        image(VenstreImp, pos.x, pos.y);
      }
    }
    if (VenstreHojre == 1) {
      if (counter % 10 > 4) {
        image(HojreImpAngreb, pos.x, pos.y);
      } else {
        image(HojreImp, pos.x, pos.y);
      }
    }
    if (counter % 10 == 4 && angrebstilstand == 1) {
      impAngreb.play();
    }
    magi.shoot();
    counter = counter + 0.5;
  }
  
}
