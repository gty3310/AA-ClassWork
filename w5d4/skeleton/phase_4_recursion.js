function range(start, finish){
  if (start === finish){
    return [start];
  }
  else {
    let temp = range(start, finish-1);
    temp.push(finish);
    return temp;
  }
}

// range(1,2);
// console.log(range(3,7));

function sumRec(arr){
  if (arr.length === 1){
    return arr[0];
  } else {
    return arr[0] + sumRec(arr.slice(1));
  }
}

// console.log(sumRec([1,2,3,4]));

function exponent(base, exp) {
  if (exp === 0 ) {
    return 1;
  }
  else {
    return exponent(base, exp-1)*base;
  }
}

// console.log(exponent(2,4));

function deepDup(arr){
  let result = [];
  for (i = 0; i<arr.length; i++){
    if (typeof arr[0] === 'number' ){
        result.push(arr[i]);
    }
    else {
      result.push(deepDup(arr[i]));
    }
  }
  return result;
}
// console.log(deepDup([1,2,3,[4,5],[6,[7,8]]]));


// function bsearch(arr,target){
//
// }
// console.log(bsearch([]));

// function mergesort(arr){
//   if(arr.length<2){
//     return arr;
//   }
//   midpoint = Math.floor(arr.length/2);
//   let left = mergesort(arr.slice(0, midpoint));
//   let right = mergesort(arr.slice(midpoint));
//   merge(left, right);
// }
// function merge(left, right){
//   result = [];
//   if (left[0]>right[0]){
//     left[]
//   }
// }
// console.log(mergesort([3,6,1,7,10]));


// console.log();


// console.log();


// console.log();


// console.log();
