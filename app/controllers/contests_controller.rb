class ContestsController < ApplicationController
  def show
    @contest = Contest.find(params[:id])
    render json: @contest
  end

  def index
    @contests = Contest.all
    render json: @contests
  end

  def create
    @contest = Contest.new(contest_params)
    if @contest.save
      render json: @contest
    else
      render json: @contest.errors, status: :bad_request
    end
  end

  def contest_params
    params.permit(:participant_1, :participant_2)
  end
end
