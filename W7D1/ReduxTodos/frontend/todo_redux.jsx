import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import App from './components/app.jsx';
import Root from './components/root.jsx';

//added
document.addEventListener("DOMContentLoaded", function(){
  const store = configureStore();
  window.store = store;
  const container = document.getElementById('container');
  // ReactDOM.render(<h1>Todos App working!!!</h1>, container );
  ReactDOM.render(<Root store={store}/>, container);
});

//added to package.json: "start": "webpack --watch --mode=development"
