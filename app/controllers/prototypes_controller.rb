class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.all.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    @prototype.tags.new
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
    @like = current_user.likes.find_by(prototype_id: params[:id])
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.destroy
    end
  end

  def edit
    @capimgs = @prototype.captured_images
    @capimgs.each do |capimg|
      if capimg[:status] == 0
        @main_thumb = capimg
      end
    end
    @sub_thumb = @prototype.set_sub_thumbnails
    @tag_list = @prototype.set_tag_list
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
      captured_images_attributes: [:content, :status, :id],
      tags_attributes: [:name, :id]
    )
  end
end
