class TagsController < ApplicationController

  before_action :destroy, only: [:index]

  def index
    @tags = Tag.all
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
  end

  def show
    @tag = Tag.find(params[:id])
    @tagname = Tag.find(params[:id]).name
    @tags = Tag.where(name: @tagname)
    @prototype_ids = []
    @tags.each do |tag|
      @prototype_ids += tag.prototypes
    end
    @prototypes = @prototype_ids
  end

  def edit
  end

  def update
  end

  def destroy
    @tags = Tag.all
    @tags.each do |tag|
      tag.destroy if tag.name == ""
    end
  end
end
