class ClonesController < ApplicationController

  def index
    @clones = Clone.all
  end

  def new
    @clone = Clone.new
  end

  def create
    Clone.create(clone_params)
    redirect_to new_clone_path
  end

  private

  def clone_params
    params.require(:clone).permit(:content)
  end

end
