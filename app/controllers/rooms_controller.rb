class RoomsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @room = current_user.rooms.new(post_id: params[:post_id])
    @room.post_id = post.id
    
    ActiveRecord::Base.transaction do
      @room.save
      @entry = Entry.new(user_id: current_user.id, room_id: @room.id)
      @entry.save
    end
      flash[:success] = "#{post.title}のチャットを作成しました。"
      redirect_to room_path(@room)
    rescue => e
      flash[:danger] = "チャットの作成に失敗しました。もう一度やり直してください。"
     redirect_to post_path(post)
  end

  def join
    @room = Room.find(params[:id])
    @entry = Entry.new(user_id: current_user.id, room_id: @room.id)
    
    if @room.post.limit > @room.users.count.to_i
    
      if @entry.save
        flash[:success] = "#{@room.post.title}のチャットに参加しました！"
        redirect_to room_path(@room)
      else
        flash[:danger] = "チャットに参加できませんでした。"
      end
      
    else
      flash[:danger] = "#{@room.post.title}は制限人数に達しています！"
      redirect_to post_path(@room.post)
    end
  end

  private

  def room_params
    params.require(:room).permit(user_ids: [])
  end

end
