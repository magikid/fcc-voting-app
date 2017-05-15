class ResponsesController < ApplicationController
  before_action :set_poll

  def index
    @voted = cookies[:voted]
    @responses = @poll.responses.includes(:option).group(:option).count.map{|k,v| {k.text => v}}.reduce(&:merge)
  end

  # GET /responses/new
  def new
    if cookies[:voted]
      redirect_to poll_responses_path, notice: 'You already voted.'
    else
      @response = Response.new(poll: @poll)
    end
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)
    @response.poll = @poll

    if @response.save
      cookies[:voted] = true
      redirect_to poll_responses_path, notice: 'Response was successfully created.'
    else
      render :new
    end
  end

  private
    def set_poll
      @poll = Poll.includes(:options).find(params[:poll_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:option_id)
    end
end
