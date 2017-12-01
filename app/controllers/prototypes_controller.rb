class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]


  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: :new }), alert: 'prototype was unsuccessfully created'
     end
  end

  def show
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.destroy
    end
  end

  def edit
  end

  def update
    @prototype.update(prototype_params) if @prototype.user_id == current_user.id
    redirect_to ({ action: :show }), notice: 'prototypes was successfully editted'
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:id, :content, :status]
    )
  end

  def update_data
  if @prototype.captured_images.nil?
    @prototype.captured_images.update
  end
end

end
