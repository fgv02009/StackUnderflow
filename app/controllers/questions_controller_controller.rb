class QuestionsControllerController < ApplicationController

  respond_to :html, :js

  
  def index
    #will render index form and send 10 most recently created pics to views
  @questions = Question.order(created_at: :desc).limit(10)
  end

  def new
    #will render new form
    @question = Question.new

  end

  def create
    @question = Question.new(question_params[:question])
    
    if @question.save
    format.html {redirect_to questions_path}
    format.js {render action: ''}
    #want to ajax
    else
      render 'new'
      #want to ajax`
    end
  end

  def show
    @question = Question.find(params[:id])
    
    respond_to do |format|
      if @question.save
      format.html {redirect_to questions_path}
      format.js {render action: ''}
      #want to ajax
      else
        render 'new'
        #want to ajax
      end
  end

  def edit

    @question = Question.find(params[:id])
    
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render "index"
  end


  def question_params
    #get attributed from db
    params.require(:question).permit(:content)
end
