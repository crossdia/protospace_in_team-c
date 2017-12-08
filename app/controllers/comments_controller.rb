class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  def create
  	@comment = Comment.create(text: comment_params[:text], prototype_id: comment_params[:prototype_id],user_id: current_user.id)
    @prototype = Prototype.find(params[:prototype_id])
  end

  def edit
  	@comments = find_comment
  end

  def update
    comment = find_comment
    comment.update(text: comment_params[:text], prototype_id: comment_params[:prototype_id], user_id: current_user.id) if current_user.id == comment.user_id
    redirect_to controller: :prototypes, action: :show, id: params[:prototype_id]
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
    end
    @prototype = Prototype.find(params[:prototype_id])
    render
  end

  private
  def comment_params
    params.permit(:text,:prototype_id)
  end

  def find_comment
    Comment.find(params[:id])
  end
end
