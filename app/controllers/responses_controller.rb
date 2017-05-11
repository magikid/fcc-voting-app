class ResponsesController < ApplicationController
  before_action :set_poll

  def index
    @responses = @poll.responses.reduce(Hash.new(0)){|final, resp| final[resp.option.text] += 1; final}
  end

  # GET /responses/new
  def new
    @response = Response.new(poll: @poll)
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)
    @response.poll = @poll

    if @response.save
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
