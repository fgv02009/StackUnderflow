class QuestionsController < ApplicationController
  respond_to :html, :js

  def index
    #will render index form and send 10 most recently created pics to views
    @questions = Question.order(created_at: :desc).limit(10)
    @user = User.new
  end

  def new
    #will render new form
    @question = Question.new
  end

  def create
      @question = Question.new(question_params)

    if submit_new_question?
      @question.user = current_user
      @questions = Question.order(created_at: :desc).limit(10)
      
      render 'new' unless @question.save

    else
      @content = markdown(params[:question][:content]).gsub("\n","<br>")
      p "in the create  "
      # binding.pry
      render :preview
    end
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

  # AJAX call for showing a preview markdown
  def preview
    puts "IN THE PREVIEW"
    # {markdown: markdown(params[:previewContent])}.to_json
  end

  def submit_new_question?
    params[:commit] == "Submit New Question"
  end

  def preview?
    params[:commit] == "Preview"
  end

  private
  def question_params
    #get attributed from db
    params.require(:question).permit(:content, :title)
  end

end
