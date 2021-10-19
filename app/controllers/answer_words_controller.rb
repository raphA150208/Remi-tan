class AnswerWordsController < ApplicationController
  before_action :set_answer_word, only: %i[ select_best_answer ]

  def select_best_answer
    @answer_word.best_answer_flg = true
    @answer_word.save
    @answer = Answer.find(@answer_word.answer_word_id)
    @question = Question.find(@answer.question_id)
    @question.status = 1
    @question.save
    @reminiscent_words = @question.reminiscent_words
    @answer_words = @answer.answer_words
    @reminiscent_words_dictionaries = nil
    @reminiscent_words.each{ |rw|
        @answer_words.each{ |aw|
            @reminiscent_words_dictionary = ReminiscentWordsDictionary.new
            @reminiscent_words_dictionary.reminiscent_word = rw.keyword
            @reminiscent_words_dictionary.answer_word = aw.candidate
            if @answer_word.candidate == aw.candidate
                @reminiscent_words_dictionary.best_answer_flg = true
            end
            @reminiscent_words_dictionaries.push(@reminiscent_words_dictionary)
        }
    }
    @reminiscent_words_dictionaries.each{|rwd| rwd.save }

    # 質問詳細画面へ遷移する処理
  end

  private
  def set_answer_word
    @answer_word = AnswerWord.find(params[:id])
  end
end