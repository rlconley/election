class VotersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :load_user, only: [:show, :update]
  before_filter :restrict_access_to_user, only: [:show, :update]

  # GET /voters/1
  # GET /voters/1.json
  def show
    @voter = Voter.find(params[:id])

    render json: @voter
  end

  # POST /voters
  # POST /voters.json
  @voter = Voter.new(person_params)
  if @voter.save
    render json: @voter.as_json(include_token: true), status: :created, location: voter_path(@voter)
  else
    render json: {errors: @voter.errors}, status: :bad_request
  end
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
    
    def voter_params
      params.require(:voter).permit(:name, :party)
    end
end
