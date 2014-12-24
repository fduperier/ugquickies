class QuickiesController < ApplicationController
  before_action :set_quickie, only: [ :show, :edit, :update, :destroy, :up, :down ]
  after_action :verify_authorized, except: [ :up, :down ]

  respond_to :html

  def show
    authorize @quickie
    commontator_thread_show(@quickie)

    respond_with(@quickie)
  end

  def new
    @quickie = Quickie.new
    authorize @quickie

    respond_with(@quickie)
  end

  def edit
    authorize @quickie
  end

  def create
    @quickie = Quickie.new(quickie_params)
    @quickie.creator = current_user

    authorize @quickie

    if @quickie.save
      flash[:notice] = "Quickie created."
      respond_with(@quickie)
    else
      render :new, :alert => "Unable to create quickie."
    end
  end

  def update
    authorize @quickie

    if @quickie.update(quickie_params)
      flash[:notice] = "Quickie updated."
      respond_with(@quickie)
    else
      render :show, :alert => "Unable to update quickie."
    end
  end

  def destroy
    authorize @quickie

    @quickie.destroy
    redirect_to root_path, :notice => "Quickie deleted."
  end

  # Votes
  def up
    @quickie.liked_by current_user
    render 'vote_changed'
  end

  def down
    @quickie.unliked_by current_user
    render 'vote_changed'
  end

  private
    def set_quickie
      @quickie = Quickie.find(params[:id])
    end

    def quickie_params
      params.require(:quickie).permit(:title, :description, :date, :user_group_id)
    end
end
