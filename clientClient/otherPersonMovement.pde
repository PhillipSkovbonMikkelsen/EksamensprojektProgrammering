class otherPersonMovement {
  void venKarakterMove() {
    if (c.available() > 0) { 
      input = c.readString(); 
      data = float(split(input, ' ')); 

      //Modtager data fra serveren
      andenPersonPosX = data[0];
      andenPersonPosY = data[1];
      andenPersonVenstreHojre = data[2];
      andenPersonAngrebstilstand = data[3];
      andenPersonCounter = data[4];
      modstanderPos.x = data[5];
      modstanderPos.y = data[6];


      if (andenPersonVenstreHojre==0) {
        if (andenPersonAngrebstilstand == 0) {
          image(VenstreOrc, andenPersonPosX, andenPersonPosY);
        }
        if (andenPersonAngrebstilstand == 1) {
          if (andenPersonCounter % 10 > 4) {
            image(VenstreAngreb, andenPersonPosX, andenPersonPosY);
          }
          if (andenPersonCounter % 10 <= 4) {
            image(VenstreOrc, andenPersonPosX, andenPersonPosY);
          }
        }
      }
      if (andenPersonVenstreHojre==1) {
        if (andenPersonAngrebstilstand==0) {
          image(HojreOrc, andenPersonPosX, andenPersonPosY);
        }
        if (andenPersonAngrebstilstand==1) {
          if (andenPersonCounter % 10 > 4) {
            image(HojreAngreb, andenPersonPosX, andenPersonPosY);
          }
          if (andenPersonCounter % 10 <= 4) {
            image(HojreOrc, andenPersonPosX, andenPersonPosY);
          }
        }
      }
      if (andenPersonCounter % 10 == 5 && andenPersonAngrebstilstand == 1) {
        orcAngreb.play();
      }
    }
  }
}
