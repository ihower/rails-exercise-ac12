var HelloMessage = React.createClass({

  render: function(){
    var name = this.props.name;
      // JSX: mixed HTML and JavaScript
      return (
        <div>
          <HelloTitle name="foobar" />
        </div>
      )
  }

})
