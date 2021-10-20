class AnswerWordsController < ApplicationController
  # before_action :set_answer_word, only: %i[ select_best_answer ]

  def create
    @answer_word = AnswerWord.find(params[:id])
    #ベストアンサーを選択
    @answer_word.best_answer_flg = true
    #アンサーワード更新
    @answer_word.update
    #ベストアンサーのしっくりくる言葉と紐付いた回答を代入
    @answer = Answer.find(@answer_word.answer_word_id)
    #@answerに紐付いた質問を代入
    binding.pry
    @question = Question.find(@answer.question_id)
    #質問のステータスを解決済(1)にする
    @question.status = 1
    #質問データ更新
    @question.update
    #@questionに紐付いた連想ワードを代入
    @reminiscent_words = @question.reminiscent_words
    #@answerに紐付いたしっくりくる言葉を代入
    @answer_words = @answer.answer_words
    #nil宣言
    @reminiscent_words_dictionaries = nil
    #連想ワード(keyword)としっくりくる言葉候補(candidate)から連想ワード辞書テーブルの連想ワード(reminiscent_word)としっくりくる言葉候補(answer_word)を作って保存する
    @reminiscent_words.each{ |rw|
        @answer_words.each{ |aw|
            @reminiscent_words_dictionary = ReminiscentWordsDictionary.new
            @reminiscent_words_dictionary.reminiscent_word = rw.keyword
            @reminiscent_words_dictionary.answer_word = aw.candidate
            #ベストアンサーに選んだしっくりくる言葉と連想ワード辞書に作成したしっくりくる言葉が等しかったら、ベストアンサーフラグを立てる
            if @answer_word.candidate == aw.candidate
                @reminiscent_words_dictionary.best_answer_flg = true
            end
            #nil宣言した配列に生成した連想ワード辞書インスタンス追加
            @reminiscent_words_dictionaries.push(@reminiscent_words_dictionary)
        }
    }
    #出来上がった連想ワード辞書を保存
    @reminiscent_words_dictionaries.each{|rwd| rwd.save }
    #質問投稿詳細画面に遷移
    redirect_to question_path(@question)
    # 質問詳細画面へ遷移する処理
  end

  private
  def set_answer_word
  end
end