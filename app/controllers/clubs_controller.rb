class ClubsController < ApplicationController
  before_action :set_club, only: %w[show edit update destroy] 

  def index
    # TODO: add pagination
    @clubs = Club.all
  end

  def show; end

  def new
    @club = Club.new
  end

  def create
    @club = Club.create(club_params)

    if @club.save
      redirect_to club_path
    else
      render :new
    end

    respond_to do |format|
      if @wee.save
        format.html { redirect_to @wee, notice: 'Wee was successfully created.' }
        format.json { render :show, status: :created, location: @wee }
      else
        format.html { render :new }
        format.json { render json: @wee.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    if @club.update(club_params)
      redirect_to club_path
    else
      render :edit
    end

    respond_to do |format|
      if @wee.update(wee_params)
        format.html { redirect_to @wee, notice: 'Wee was successfully updated.' }
        format.json { render :show, status: :ok, location: @wee }
      else
        format.html { render :edit }
        format.json { render json: @wee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @club.destroy
    redirect_to clubs_path

    respond_to do |format|
      format.html { redirect_to wees_url, notice: 'Wee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_club
      @club = Club.find(params[:id])
    end
    
    def club_params
      # TODO: Add permitable params
      params.require(:club).permit()
    end
end
