class AnswersController < ApplicationController
  before_action :set_question, only: [:create, :edit, :update]
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @answer.save
        format.js { render :index }
      else
        format.html { redirect_to question_path(@question), notice: 'コメントできませんでした...' }
      end
    end
  end
  def edit
    @answer = @question.answers.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end
  def update
    @answer = @question.answers.find(params[:id])
      respond_to do |format|
        if @answer.update(answer_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end
  private
  # ストロングパラメーター
  def answer_params
    params.require(:answer).permit(:question_id, :answer)
  end
  def set_question
    @question = Question.find(params[:question_id])
  end
end