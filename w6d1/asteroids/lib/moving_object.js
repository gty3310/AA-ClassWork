class MovingObject {
  constructor(args) {
    this.pos = args.pos;
    this.vel = args.vel;
    this.radius = args.radius;
    this.color = args.color;
  }
  draw(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(
      this.pos[0],
      this.pos[1],
      this.radius,
      0,
      2*Math.PI,
      false
    );
    ctx.fill();
  }
  move() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
  }

}
module.exports = MovingObject;
// let circle = new MovingObject(
const mo = new MovingObject(
  { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
);
mo.draw(ctx);
