class AnswersControllerController < ApplicationController

  def index
    #will render index form and send 10 most recently created pics to views
    @answers = Answer.order(created_at: :desc).limit(10)
  end

  def new
    #will render new form
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params[:answer])
    
    respond_to do |format|
      if @answer.save
      format.html {redirect_to answers_path}
      format.js {render action: ''}
      #want to ajax
      else
        render 'new'
        #want to ajax
      end
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
    params.require(:answer).permit(:content, :id)
end




end
