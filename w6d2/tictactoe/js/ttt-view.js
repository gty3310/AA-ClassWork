const Game = require("../node_game_logic/game.js");

class View {
  constructor(game, $el) {
    this.game = game; 
    this.$el = $el;
    this.numTurn = 0;
  }

  bindEvents() {
    const that = this;
    const index = [[0,0], [0,1], [0,2], [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]];
    const li = $("li");
    const player = ["o","x"];
    let move = "";
    // Event.currentPlayer
    let $ul = $('ul');
    $ul.on("click", (event) => {
      const pos = index[$(event.target).data("idx")];
      if(!$(event.target).data("move")){
        that.numTurn++;
        move = player[that.numTurn%2];
        $(event.target).data("move", move);
      }
      console.log(pos);
      that.game.playMove(pos);
      $(event.target).css('background-color', 'white');
      $(event.target).html(`<p>${move}</p>`);
      if(that.game.isOver()){
        alert(`${that.game.winner()} wins!!`);
      }
    });
    // li.on("click", function(event){
    //   event.target;
    //   const pos = index[parseInt($(this).text())];
    //   that.game.playMove(pos);
    //   console.log(pos);
    // });
  }

  makeMove($square) {
    // const index = [[0,0], [0,1], [0,2], [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]];
    // const pos = index[$square.data("idx")];
    // console.log(pos);
    // $square.css('background-color', 'white');
    // debugger;
    // $square
    
    
  }

  setupBoard() {

    let $ul = $('<ul></ul>');
    for (var i = 0; i < 9; i++) {
      let $li = $(`<li><p></p></li>`);
      $li.data("idx",i);
      $li.data("move",null);
      $ul.append($li);
    }
    this.$el.append($ul);
  }
  
}

module.exports = View;
