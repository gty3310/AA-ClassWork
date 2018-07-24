function sum () {
  let arr = [...arguments];
  // let arr = Array.prototype.slice.call(arguments);
  // debugger;
  let sum = 0;
  arr.forEach(el=>{
    sum += el;
  });
  return sum;
}
function sum2 (...args){
  let sum = 0;
  args.forEach(el=>{
    sum += el;
  });
  return sum;
}
console.log(sum(1,2,3,4));
console.log(sum2(1,2,3,4));

// function myBind(...args){
// 
// }

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

Function.prototype.myBind = function (context, ...args) {
  // let bindArgs = [...arguments].slice(1);
  return (...callArgs) => {
    return this.call(context,...args.concat(callArgs));
    // this.apply(context,bindArgs.concat(callArgs));
  };
};

Function.prototype.myBind2 = function (context) {
  let bindArgs = [...arguments].slice(1);
  let func = this;
  
  return function(){
    let callArgs = [...arguments];
    func.call(context, ...bindArgs.concat(callArgs));
  };
};
// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(breakfast, "meow", "Kush")();
markov.says.myBind2(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
// 
// // bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
// 
// // no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// // Breakfast says meow to me!
// // true
function curriedSum(numArgs){
  let numbers = [];
  let result = 0;
  function _curriedSum(num) {
    numbers.push(num);
    result += num;
    if (numbers.length === numArgs){
      return result;
      // return this(...numbers)
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

const summ = curriedSum(4);
console.log(summ(5)(30)(20)(1)); // => 56


Function.prototype.curry = function(numArgs){
  let accum = [];
  curryfunc = (arg) => {
    accum.push(arg);
    if (accum.length === numArgs) {
      return this(...accum);
    } else {
      return curryfunc;
    }
  };
  return curryfunc;
};

Function.prototype.curry2 = function(numArgs){
  let accum = [];
  let func = this;
  curryfunc = function(arg){
    accum.push(arg);
    if (accum.length === numArgs) {
      return func(...accum);
    } else {
      return curryfunc;
    }
  };
  return curryfunc;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry2(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
console.log(f1 = f1(6)); // = 30

// or more briefly:
console.log(sumThree.curry(3)(4)(20)(6)); // == 30
console.log(sumThree.curry2(3)(4)(20)(6)); // == 30








