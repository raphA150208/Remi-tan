class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  def index
    @questions = Question.all.order(created_at: :desc)
    if  params[:search_status].present?
      @questions = Question.search_status(params[:search_status])
    end
  end

  def show
    # @answer = @question.answers.find(params[:id])
    @answer_word = AnswerWord.new
  end

  def new
    @question = Question.new
    @reminiscent_words = @question.reminiscent_words.build
  end

  def edit
  end

  def create
    @question = current_user.questions.build(question_params)
    if params[:back]
      render :new
    else
      respond_to do |format|
        if @question.save
          format.html { redirect_to @question, notice: "Question was successfully created." }
          format.json { render :show, status: :created, location: @question }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :sentence, :status, reminiscent_words_attributes: [:id, :keyword, :_destroy])
  end
end
