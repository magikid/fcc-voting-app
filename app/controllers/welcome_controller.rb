class WelcomeController < ApplicationController
  def index
    @all_polls = Poll.where(published: true).order(created_at: :desc).limit(50)
  end
end
