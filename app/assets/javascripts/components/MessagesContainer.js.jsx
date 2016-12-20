var MessagesContainer = React.createClass({

  getInitialState: function(){
    return {
      messages: [],
      new_message_input: ''
    }
  },

  componentDidMount: function () {
    var that = this;
    $.ajax({
      url: "/rooms/1/messages",
      dataType: "json",
      success: function(messages){
        that.setState( { messages: messages } );
      }
    })
  },

  add_fake_data: function(){
    this.setState( {
      messages: [ { content: "Q____Q"} ]
    })
  },

  handleRemoveClick: function(message){

    console.log( message )

    var that = this;
    $.ajax({
      url : "/rooms/1/messages/" + message.id,
      type: "DELETE",
      success: function(data){
        var messages = $.grep(that.state.messages, function(e){
          return e.id != message.id
        });

        that.setState( { messages: messages });
      }
    })
  },

  handleChange: function(event){
    this.setState( {
      new_message_input: event.target.value
    })
  },
  handleSubmit: function(){
    var that = this;

    $.ajax({
      url: "/rooms/1/messages",
      type: "POST",
      data: {
        message: {
          content: that.state.new_message_input
        }
      },
      dataType: "json",
      success: function(data){
        var messages = that.state.messages;
        messages.push(data);

        that.setState( { messages: messages,
                         new_message_input: ""
                       });
      }
    })
  },
  render: function(){
      return(
        <div>
          <a onClick={ this.add_fake_data }>Add Fake data</a>

          <input type="text" value={this.state.new_message_input} onChange={ this.handleChange } />
          <button onClick={this.handleSubmit}>Submit</button>

          <MessageList messages={this.state.messages} onRemove={this.handleRemoveClick} />

        </div>
      )
  }

})
