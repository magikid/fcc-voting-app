class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: :show

  # GET /polls
  # GET /polls.json
  def index
    @polls = current_user.polls.includes(:options)
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    redirect_to new_poll_response_path(@poll) unless current_user == @poll.user
  end

  # GET /polls/new
  def new
    @poll = current_user.polls.new
    @poll.options << Option.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = current_user.polls.new(poll_params)
    @poll.save!

    if @poll.save
      redirect_to @poll, notice: 'Poll was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    if @poll.update(poll_params)
      redirect_to @poll, notice: 'Poll was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    redirect_to polls_url, notice: 'Poll was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      if params[:short_id]
        @poll = Poll.includes(:options).where(short_id: params[:short_id]).first
      else
        @poll = Poll.includes(:options).find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:title, :published, options_attributes: ["text"])
    end
end
