class Ateroid {
  constructor(pos, COLOR = "green", RADIUS = 10){
    this.pos = super(pos);
    this.color = COLOR;
    this.radius = RADIUS;
    this.vel = 6;
  }
  // COLOR = "green";/
  // RADIUS = 10;
  // const Util = {
  //   randomVec(length) {
  //     const deg = 2 * Math.PI * Math.random();
  //     return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  //   }
  //   // Scale the length of a vector by the given amount.
  //   scale(vec, m) {
  //     return [vec[0] * m, vec[1] * m];
  //   }
  // };
  
  
}
// module.exports = Asteroid;