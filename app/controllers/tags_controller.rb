class TagsController < ApplicationController

def index
end

def new
  @tags = Tag.new(tag_params)
end

def create
  @tags = Tag.new(tag_params)
    if @prototype.save && @tags.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: :new }), alert: 'prototype was unsuccessfully created'
end

def show
end

def edit
end

def update
end

def delete
end

private

def set_prototype
end

def tag_params
  params.require(:tag).permit(
    :name, ).merge(tag_ids: [])
end

end
