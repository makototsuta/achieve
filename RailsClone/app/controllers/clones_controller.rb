class ClonesController < ApplicationController

  def index
    @clones = Clone.all
  end

  def new
    @clone = Clone.new
  end

  def create
    @clone = Clone.new(clone_params)
    if @clone.save

      redirect_to clones_path, notice:"メッセージを投稿しました"
    else
      render:new
    end
  end

  private

  def clone_params
    params.require(:clone).permit(:content)
  end

end
