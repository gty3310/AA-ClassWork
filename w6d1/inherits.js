Function.prototype.inherits = function(func){
  function Surrogate(){}
  Surrogate.prototype = func.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};


function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);




