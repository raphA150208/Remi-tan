class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @my_questions = current_user.questions
    @my_answer_questions = Question.all.find_all{ |q|
      q.answers.any?{ |a| a.user_id == current_user.id }
    }

    # @my_answer_questions = nil
    # @all_questions = Question.all
    # @all_questions.each{ |q|
    #   @has_my_answer_flg = false
    #   q.answers.each{ |a|
    #     if a.user_id == current_user.id
    #       @has_my_answer_flg = true
    #     end
    #   }
    #   if @has_my_answer_flg
    #     @my_answer_questions.push(q)
    #   end
    # }
  end
end