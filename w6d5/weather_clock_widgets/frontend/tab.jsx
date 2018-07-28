import React from 'react';

class Tab extends React.Component{
  constructor(info){
    super();
    this.state = {
      index: 0,
      info: info
    };

  }
  render(){
    return (
      <div>
        <ul>
          {this.props.tabInfo.map(title => <h1>title</h1>)}
        </ul>

      </div>

    );
  }


}

export default Tab;
