class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :set_question_types, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :taker?, except: [:show, :thank_you]
  before_action :taken?, only: [:edit]
  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.where(author_id: session[:id])
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  def results
    @survey = Survey.find(params[:id])
  end

  # @taker = Taker.create
  #     params[:answer_for_question].each do |question_id , answer_text|
  #       Answer.create!(text: answer_text, question_id: question_id, taker_id: @taker.id)
  #     end


  def thank_you
    should_i_render = false
    params[:answer_for_question].each do |question_id , answer_text|
      if answer_text.blank? && Question.find(question_id).required
        should_i_render = true
      end
    end
    if should_i_render
      @survey = Survey.find(params[:id])
      render :show
    else
      @taker = Taker.create
      params[:answer_for_question].each do |question_id , answer_text|
        Answer.create!(text: answer_text, question_id: question_id, taker_id: @taker.id)
      end
    end
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @survey.questions.build
    @survey.questions.each do |q|
      q.options.build
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey.questions.build
    @survey.questions.each do |q|
      q.options.build
    end
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    @survey.author_id = current_user.id
    if @survey.save
      redirect_to @survey, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    if @survey.update(survey_params)
      redirect_to @survey, notice: 'Survey was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
      redirect_to surveys_url, notice: 'Survey was successfully destroyed.'
  end

  private
    # def check_logged_in
    #   redirect_to sessions_
    # end
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def set_question_types
      @question_types = QuestionType.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:title, :description, :author_id,
            questions_attributes: [:id, :text, :description, :order_number, :question_type_id, :required, :_destroy,
              options_attributes: [:id, :name, :order_number, :question_id, :_destroy,
                results_attributes: [:survey_id]]])
    end

    def taken?
      if @survey.answers.any?
        redirect_to surveys_path
      end
    end
end
