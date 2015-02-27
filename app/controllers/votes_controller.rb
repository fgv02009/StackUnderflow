class VotessController < ApplicationController
  respond_to :html, :js

  def new
    @vote = Vote.new
  end

  def create_question
    @vote = Vote.new
    @vote.user = current_user
    @vote.votable = 
  end

  def destroy_question
    @vote = Vote.new
    @vote.user = current_user
    @vote.votable = 
  end
end
