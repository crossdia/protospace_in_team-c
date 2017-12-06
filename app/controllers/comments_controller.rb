class CommentsController < ApplicationController
  def create
  	@comment = Comment.create(text: comment_params[:text], prototype_id: comment_params[:prototype_id],user_id: current_user.id)
  	redirect_to "/prototypes/#{@comment.prototype.id}"
  end

  def edit
  	@comments = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(text: comment_params[:text], prototype_id: comment_params[:prototype_id], user_id: current_user.id) if current_user.id = comment.user_id
    redirect_to controller: :prototypes, action: :show, id: params[:prototype_id]
  end

  def destroy
  end

  private
  def comment_params
    params.permit(:text,:prototype_id)
  end
end
