import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = {
      time: new Date()
    };
  }

  tick(){
    this.setState({time: new Date()});

  }



  componentDidMount() {
    this.tickID = setInterval(()=>{this.tick();}, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.tickID);
  }


  render () {
    console.log(this.state);
    return (
      <div className="clock-component">
        <h1>Clock</h1>
        <div className="clock-wrapper">
          <h2 className="time-string">{this.state.time.toTimeString()}</h2>
        </div>
      </div>
    );
  }
}


export default Clock;
