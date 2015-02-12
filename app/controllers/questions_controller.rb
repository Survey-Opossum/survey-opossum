class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def edit
  end

  def new
    @question = Question.new
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
      params.require(:question).permit(:text , :description, :order_number, :survey_id, :question_type_id)
    end
end
