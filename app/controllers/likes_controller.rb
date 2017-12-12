class LikesController < ApplicationController

  def create
    like = Like.new(like_params.merge( {user_id: current_user.id}) )
    if like.save
        redirect_to( controller: :prototypes, action: :show, id: params[:prototype_id] )
    else
      render :root
    end
  end

  def delete

  end

  private
  def like_params
    params.permit(:prototype_id)
  end
end
