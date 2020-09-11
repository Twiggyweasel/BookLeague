class ClubsController < ApplicationController
  before_action :set_club, only: %w[show edit update destroy]

  def index
    # TODO: add pagination
    @clubs = Club.public_clubs
  end

  def show; end

  def new
    @club = Club.new
  end

  def create
    @club = Club.create(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: "Club was successfully created." }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: "Club was successfully updated." }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @club.destroy

    respond_to do |format|
      format.html { redirect_to clubs_url, notice: "Club was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    # TODO: Add permitable params
    params.require(:club).permit(:name, :founded, :description)
  end
end
