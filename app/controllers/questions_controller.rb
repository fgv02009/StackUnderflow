class QuestionsController < ApplicationController
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
    @question = Question.new(question_params)
    @question.user = User.find(1)
    @questions = Question.order(created_at: :desc).limit(10)
    
    render 'new' unless @question.save
  end

  def show
    @question = Question.find(params[:id])
    
      if @question.save
        render 'show'
    else
      render 'new'
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
    params.require(:question).permit(:content, :title)
  end
end