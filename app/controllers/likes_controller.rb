class LikesController < ApplicationController

  def create
    set_prototype
    @like = Like.create(like_params.merge( {user_id: current_user.id}) )
  end

  def destroy
    set_prototype
    @like = current_user.likes.find_by(prototype_id: params[:prototype_id])
    @like.destroy
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
  def like_params
    params.permit(:prototype_id)
  end
end
