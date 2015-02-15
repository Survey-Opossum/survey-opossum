class QuestionsController < ApplicationController
  before_action :taker?, except: [:show]
  
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @question.options.build
  end

  def edit
    @question.options.build
  end

  def show
  end

  def create
    @question = Question.new(question_params)
      if @question.save
        redirect_to root_path, notice: 'Question was successfully created.'
      else
        render :new
      end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
      redirect_to question_url, notice: 'Question was successfully destroyed.'
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:text, :description, :order_number, :survey_id, :question_type_id, :required,
            options_attributes: [:id, :name, :order_number, :question_id, :_destroy])
    end
end
