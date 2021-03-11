class CommentsController < ApplicationController
  
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to shop_path(@comment.shop.id)
    else
      @shop = @comment.shop
      @comments = @shop.comments
      render "shops/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end

end
