import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tab from './tab';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Root />, root);
});

const tabInfo = [
  {title: 'TO DO', content: 'TODO List'},
  {title: 'TO DO2', content: 'TODO List'},
  {title: 'TO DO3', content: 'TODO List'}
];

function Root () {
  return (
    <div>
      <Clock />
      <Tab tabInfo={tabInfo} />
    </div>
  );
}
