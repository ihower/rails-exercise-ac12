var HelloTitle = React.createClass({

  render: function(){
    var name = this.props.name;
      return (
        <h1>Hello { name }</h1>
      )
  }

})
