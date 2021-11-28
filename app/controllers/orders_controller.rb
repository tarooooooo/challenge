class OrdersController < ApplicationController
   before_action :redirect_root

  def new
    @order = Order.new
    @post = Post.find(params[:post_id])
  end

  def create
    @order = Order.new(order_params)
    @room = @order.post.room
    @entry = Entry.new(user_id: current_user.id, room_id: @room.id)

    if @room.post.limit > @room.users.count.to_i
      ActiveRecord::Base.transaction do
        @entry.save
        @order.save
      end

      flash[:success] = "購入が完了しました！"
      redirect_to finish_order_path(@order)
    else
      flash[:danger] = "#{@room.post.title}は制限人数に達しています！"
      redirect_to post_path(@room.post)
    end

    rescue => e
      flash[:danger] = "購入できませんでした。もう一度、最初からやり直してください。"
      redirect_to post_path(@order.post)

  end

  def finish
    @order = Order.find(params[:id])
  end

  private
  def redirect_root
    unless logged_in?
      flash[:success] = "ログインまたは、新規登録を行なってください。"
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order).permit(
      :seller_id,
      :buyer_id,
      :order_price,
      :post_id
      )
  end
end
