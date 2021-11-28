class MessagesController < ApplicationController
   before_action :redirect_root

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
    def redirect_root
    unless logged_in?
      flash[:success] = "ログインまたは、新規登録を行なってください。"
      redirect_to root_path
    end
  end

    def message_params
      params.require(:message).permit(:room_id, :content)
    end

end
