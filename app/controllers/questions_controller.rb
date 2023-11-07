class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    @questions = Question.all.order(created_at: :desc)
    if params[:search_status].present?
      @questions = Question.search_status(params[:search_status])
    end
  end

  def show
    @answer_word = AnswerWord.new
  end

  def new
    @question = Question.new
    @reminiscent_words = @question.reminiscent_words.build
  end

  def edit
    if current_user != @question.user
      redirect_to questions_path, alert: '他のユーザーの質問投稿は編集できません'
    end
  end

  def create
    @question = current_user.questions.build(question_params)
    if params[:back]
      render :new
    else
      respond_to do |format|
        if @question.save
          format.html { redirect_to @question, notice: "質問を投稿しました" }
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
      # 解決済の質問の場合は更新させない
      if @question.status == 1
        redirect_to @question, alert: '解決済みの質問は編集できません。'
      elsif @question.update(question_params)
        format.html { redirect_to @question, notice: "質問投稿を編集しました" }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # 解決済の質問の場合は削除させない
    if @question.status == 1
      redirect_to @question, alert: '解決済みの質問は削除できません。'
    else
      @question.destroy
      respond_to do |format|
        format.html { redirect_to questions_url, notice: "質問投稿を削除しました" }
        format.json { head :no_content }
      end
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
