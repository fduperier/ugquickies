class QuickiesController < ApplicationController
  before_action :set_quicky, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @quickies = Quickie.all
    respond_with(@quickies)
  end

  def show
    respond_with(@quicky)
  end

  def new
    @quicky = Quickie.new
    respond_with(@quicky)
  end

  def edit
  end

  def create
    @quicky = Quickie.new(quickie_params)
    @quicky.save
    respond_with(@quicky)
  end

  def update
    @quicky.update(quickie_params)
    respond_with(@quicky)
  end

  def destroy
    @quicky.destroy
    respond_with(@quicky)
  end

  private
    def set_quicky
      @quicky = Quickie.find(params[:id])
    end

    def quicky_params
      params.require(:quicky).permit(:title, :description, :user_group_id, :creator_id)
    end
end
