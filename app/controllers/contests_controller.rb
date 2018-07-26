class ContestsController < ApplicationController
  def show
    @contest = Contest.find(params[:id])
    render json: @contest
  end
end
