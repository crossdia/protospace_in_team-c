class LikesController < ApplicationController

  def create
    like = Like.new(like_params.merge( {user_id: current_user.id}) )
    if like.save
        redirect_to( controller: :prototypes, action: :show, id: params[:prototype_id] )
    else
      render :root
    end
  end

  def destroy
    prototype = Prototype.find(params[:prototype_id])
    like = current_user.likes.find_by(prototype_id: params[:prototype_id])
    if like
      like.destroy
    end
    redirect_to( controller: :prototypes, action: :show, id: params[:prototype_id] )
  end

  private
  def like_params
    params.permit(:prototype_id)
  end
end
