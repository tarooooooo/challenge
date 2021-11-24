class MessagesController < ApplicationController
  
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to room_path(@message.room)
    else
      @room = @message.room
      @another_entry = @room.entries.find_by('user_id != ?', current_user.id)
      render '/rooms/show'
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_back(fallback_location: root_path)
  end

  private

    def message_params
      params.require(:message).permit(:room_id, :content)
    end
    
end
