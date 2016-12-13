class MessagesController < ApplicationController

  before_action :set_room

  def create
    @message = @room.messages.create!( :content => params[:message][:content] )

    # data = { :content => @message.content, :created_at => @message.created_at, :user_name => "Foobar" }
    html = ApplicationController.renderer.render( :partial => "messages/message", :locals => { :message => @message } )

    ActionCable.server.broadcast( "room_#{@room.id}", html )

    render :js => '$("#message_content").val("");'
  end

  protected

  def set_room
    @room = Room.find( params[:room_id] )
  end

end
