class MessagesController < ApplicationController

  before_action :set_room

  def index
    render :json => @room.messages
  end

  def destroy
    message = @room.messages.find( params[:id] )
    message.destroy

    render :json => message
  end

  def create
    @message = @room.messages.new( :content => params[:message][:content] )
    @message.user = current_user

    if @message.save
      # data = { :content => @message.content, :created_at => @message.created_at, :user_name => "Foobar" }
      html = ApplicationController.renderer.render( :partial => "messages/message", :locals => { :message => @message } )

      ActionCable.server.broadcast( "room_#{@room.id}", html )

      respond_to do |format|
        format.js { render :js => '$("#message_content").val("");' }
        format.json {
          render :json => @message
        }
      end
    else
      render :js => 'alert("No content")';
    end
  end

  protected

  def set_room
    @room = Room.find( params[:room_id] )
  end

end
