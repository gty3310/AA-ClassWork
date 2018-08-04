import React from 'react';
import ReactDOM from 'react-dom';
import {login, logout, signup} from "./util/session_api_util";

document.addEventListener("DOMContentLoaded", () => {
  window.login = login;
  window.logout = logout;
  window.signup = signup;

  const root = document.getElementById("root");
  // const store = configureStore(preloadedState);
  ReactDOM.render(<h1>Welcome to BenchBNB</h1>, root);
});
