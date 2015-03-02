class AnswersController < ApplicationController
  respond_to :html, :js


  def index
    #will render index form and send 10 most recently created pics to views
    @answers = Answer.order(created_at: :desc).limit(10)
  end

  def new
    #will render new form
    @question = Question.find(params[:question_id])
    @answer = Answer.new(question: @question)
  end

  def create
    # puts "Params IN ANSWER: #{params}"
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    # @answer.question = Question.find(params[:question_id])
    render 'new' unless @answer.save
  end

  def show
    @answer = Answer.find(params[:id])
    @answers = @answer.answers
    #will render answer show form
  end

  def edit
    @answer = Answer.find(params[:id])
    
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    render "index"
  end


  def answer_params
    #get attributed from db
    params.require(:answer).permit(:content, :question_id)
  end



end
