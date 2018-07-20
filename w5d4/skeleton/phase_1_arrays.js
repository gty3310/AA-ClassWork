Array.prototype.uniq = function() {
  let result = [];
  for (i=0; i<this.length;i++){
    if (!result.includes(this[i])){
      result.push(this[i]);
    }
    // for (j = 0; j<result.length; j++){
    //   if (result[j] == this[i]){
    //       // result
    //   }
    // 
    // }
    // 
    // console.log(i);
    
  }
  console.log(result);
};

// [1,2,1].uniq();

Array.prototype.twoSum = function() {
  let result = [];
  for (i = 0; i<this.length-1;i++){
    for (j = i+1; j<this.length;j++){
      if (this[i]+this[j] === 0){
        result.push([i,j]);
      }
    }  
  }
  console.log(result);
};
// [1,2,4,-2,1,-1].twoSum();

Array.prototype.transpose = function() {
  let result = [];
  for (i = 0; i<this.length; i++){
    for (j = 0; j<this[i].length; j++){
      // debugger;
      if (i === 0){
        result.push([this[i][j]]);
      } else {
        result[j].push(this[i][j]);
      }
    }
  }
  console.log(result);
};

// [[1,2,3],[4,5,6]].transpose();
