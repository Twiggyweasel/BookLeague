module Clubs
  class MembershipsController < ApplicationController
    before_action :set_book, only: %w[show edit update delete]
    before_action :set_club

    def index
      @memberships = Membership.includes([:user]).where(club: @club)
      # @memberships = @club.memberships
    end

    def show; end

    def new
      @membership = Membership.new
    end

    def create
      @membership = Membership.new(membership_params)

      if @membership.save
        redirect_to club_memberships_path(@club)
      else
        render :new
      end
    end

    def edit; end

    def update
      if @membership.update(membership_params)
        redirect_to club_memberships_path(@club)
      else
        render :edit
      end
    end

    def delete
      @membership.delete
      redirect_to user_path(@membership.user)
    end

    private

    def set_membership
      @membership = Membership.find(params[:id])
    end

    def set_club
      @club = Club.find(params[:club_id])
    end

    def membership_params
      params.require(:membership).permit(:role, :user_id, :club_id)
    end
  end
end
