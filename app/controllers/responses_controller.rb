class ResponsesController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  # GET /responses/new
  def new
    @response = Response.new
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_poll
      @poll = Poll.includes(:options).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.fetch(:response, {})
    end
end
