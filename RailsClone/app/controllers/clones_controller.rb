class ClonesController < ApplicationController
  before_action :set_clone, only: [:show, :edit, :update, :destroy]

  def index
    @clones = Clone.all
  end

  def new
    @clone = Clone.new
  end

  def create
    @clone = Clone.new(clone_params)
    if params[:back]
      render :new
    else
      if @clone.save
        redirect_to clones_path, notice: "Tweetを投稿しました！"
      else
        render 'new'
      end
    end
  end

  def edit
    @clone = Clone.find(params[:id])
  end

  def update
    @clone = Clone.find(params[:id])
    if @clone.update(clone_params)
      redirect_to clones_path, notice: "Tweetを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @clone.destroy
    redirect_to clones_path, notice:"Tweetを削除しました！"
  end

  def confirm
    @clone = Clone.new(clone_params)
    render :new if @clone.invalid?
  end

  private

  def clone_params
    params.require(:clone).permit(:content)
  end

  def set_clone
    @clone = Clone.find(params[:id])
  end

end
