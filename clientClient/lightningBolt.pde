class lightningBolt {
  PVector lynkugle = new PVector(0, 0);

  void shoot() {
    if (counter % 10 == 5) {
      if (VenstreHojre == 0) {
        lynkugle.y = karakter.pos.y+10;
        lynkugle.x = karakter.pos.x-60;
        image(bolt, lynkugle.x, lynkugle.y);
      }
      if (VenstreHojre == 1) {
        lynkugle.y = karakter.pos.y + 10;
        lynkugle.x = karakter.pos.x + 100;
        image(bolt, lynkugle.x, lynkugle.y);
      }
    }
    if (counter % 10 > 5) {
      if (VenstreHojre == 0) {
        lynkugle.x = lynkugle.x - 50;
        image(bolt, lynkugle.x, lynkugle.y);
      }
      if (VenstreHojre == 1) {
        lynkugle.x = lynkugle.x + 50;
        image(bolt, lynkugle.x, lynkugle.y);
      }
    }
  }
}
