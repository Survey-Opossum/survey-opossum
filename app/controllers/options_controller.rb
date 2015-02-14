class OptionsController < ApplicationController
  def index
    @options = Option.all
  end

  def edit
  end

  def new
    @option = Option.new
  end

  def show
  end

  def create
    @option = Option.new(option_params)
    if @option.save
      reidrect_to root_path, notice: 'Option was successfully created.'
    else
      render :new
    end
  end

  def update
    if @option.update(option_params)
      redirect_to options_path, notice: 'Option was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @option.destroy
      redirect_to option_url, notice: 'Option was successfully destroyed.'
  end

  private
    def set_option
      @option = Option.find(paramsp[:id])
    end

    def option_params
      params.require(:option).permit(:name, :order_number, :question_id)
    end
end
