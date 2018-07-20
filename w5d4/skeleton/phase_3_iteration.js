const bubbleSort = function(arr) {
  let sorted = false;
  while (!sorted){
    sorted = true;
    for (i = 0; i< arr.length-1; i++){
      if (arr[i] > arr[i+1]){
        temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;
        sorted = false;
      }
    }
  }
  console.log(arr);
};

// bubbleSort([5, 1, 4, 2, 8 ]);

String.prototype.substrings = function() {
  const result = [];
  for(i = 0; i< this.length; i++){
    for(j = i+1; j<this.length+1; j++){
      result.push(this.slice(i,j));
    }
  }
  console.log(result);
};

// "abc".substrings();
