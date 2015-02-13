class AnswersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def answer_params
    params.require(:answer).permit(:text, :quesiton_id, :taker_id)
  end
end
