var MessageItem = React.createClass({
    render :function(){
      var message = this.props.message
      var onRemove = this.props.onRemove

      return (
        <li>
          { message.content }
          <a onClick={ onRemove.bind(this,message) }>(remove)</a>
        </li>
      )
    }
})

var MessageList = React.createClass({

  render: function(){
    var messages = this.props.messages
    var onRemove = this.props.onRemove

    //var onRemove = this.props.onRemove;

    var items = messages.map(function(message){
      return (
        <MessageItem message={message} onRemove={onRemove} />
      )
    })

    return (
      <ul>
        { items }
      </ul>
    )
  }

})
