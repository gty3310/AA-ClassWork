const View = require("./ttt-view.js"); // require appropriate file
const Game = require("../node_game_logic/game.js"); // require appropriate file


$( () => {
  const game = new Game();
  const el = $(".ttt");
  
  console.log(el);
  // debugger;
  const view = new View(game, el);
  view.setupBoard();
  view.bindEvents();
});
