class VotersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :load_user, only: [:show, :update]
  before_filter :restrict_access_to_user, only: [:show, :update]

  # GET /voters/1
  # GET /voters/1.json
  def create

  @voter = Voter.new(voter_params)

    if @voter.save
      render json: @voter.as_json(include_token: true), status: :created, location: voter_path(@voter)
    else
      render json: {errors: @voter.errors}, status: :bad_request
    end
  end

  def show
    @voter = Voter.find(params[:id])

    render json: @voter
  end

  # PATCH/PUT /voters/1
  # PATCH/PUT /voters/1.json
  def update
    @voter = Voter.find(params[:id])

    if @voter.update(voter_params)
      head :no_content
    else
      render json: @voter.errors, status: :bad_request
    end
  end


  private

  def load_user
    @voter = Voter.find(params[:id])
  end

  def restrict_access_to_user
    # authenticate_or_request_with_http_token do |token, options|
    #   @person.token == token
    # end

    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
  end


  def voter_params
      params.require(:voter).permit(:name, :party)
  end
end
