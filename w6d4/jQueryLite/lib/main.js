const DOMNodeCollection = require("./dom_node_collection.js");

//this is simulating the jQuery's selector style and rapper style
function $l(arg){
  if (arg instanceof HTMLElement) {
    return new DOMNodeCollection(Array.from(arg));
  } else {
    const elementList = document.querySelectorAll(arg);
    return new DOMNodeCollection(Array.from(elementList));
  }
}

window.$l = $l;
