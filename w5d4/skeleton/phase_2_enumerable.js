Array.prototype.myEach = function(callback) {
  for (i = 0; i < this.length; i++){
    callback(this[i]);
  }
};

// function myCallback(el) {
//   console.log(el);
// }

// [1,2,3].myEach(myCallback);

Array.prototype.myMap = function(callback) {
  let result = [];
  this.myEach((el)=>{
    result.push(callback(el));
  });
  console.log(result);
};

// function myCallback(el) {
//    return -1*el;
// }

// [1,2,3].myMap(myCallback);

Array.prototype.myReduce = function(callback, acc = 0) {
  this.myEach((el)=>acc = callback(acc, el));
  console.log(acc);
};

// [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// });
// [4, 1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// });
// [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }, 25);
