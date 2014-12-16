class QuickiesController < ApplicationController
  before_action :set_quicky, only: [ :show, :edit, :update, :destroy, :up, :down ]

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
    @quicky.creator = current_user
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

  # Votes
  def up
    @quicky.liked_by current_user
    render 'vote_changed'
  end

  def down
    @quicky.unliked_by current_user
    render 'vote_changed'
  end

  private
    def set_quicky
      @quicky = Quickie.find(params[:id])
    end

    def quicky_params
      params.require(:quicky).permit(:title, :description, :date, :user_group_id)
    end
end
