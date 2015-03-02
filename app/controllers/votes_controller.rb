class VotesController < ApplicationController
  respond_to :html, :js

  def new
    @vote = Vote.new
  end

  def create_question
    @question = Question.find(params[:question_id])
    @vote = Vote.new(user: current_user, voteable: @question)
    if @vote.save
      # p @question.votes.count
      render 'question_upvotes', locals: {question: @question}
    else
      redirect_to '/'
    end
  end

  def destroy_question
    @question = Question.find(params[:question_id])
    @vote = Vote.find_by(user: current_user, voteable: @question)
    if @vote
      @vote.destroy
      render 'question_downvotes', locals: {question: @question}
    else
      redirect_to '/'
    end
  end

end
