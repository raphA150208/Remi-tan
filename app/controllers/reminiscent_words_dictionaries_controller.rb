class ReminiscentWordsDictionariesController < ApplicationController
  before_action :authenticate_user!, only: [:search]
  def search
    @q = ReminiscentWordsDictionary.ransack(params[:q])
    @reminiscent_words_dictionaries = ReminiscentWordsDictionary.all
    if params[:q]
      @search_word = params[:q]
      @results = @q.result
    end
  end
  # def search
  #   @reminiscent_words_dictionaries = ReminiscentWordsDictionary.all
  #   @search_word_hash = {}
  #   @q = ReminiscentWordsDictionary.ransack(params[:q])
  #   if params[:q]
  #     @search_word = params[:q]['reminiscent_word_matches_all']
  #     @search_word = @search_word.map {|v| "%#{v}%"}
  #     @search_word_hash['reminiscent_word_matches_all'] = @search_word
  #     @q = ReminiscentWordsDictionary.ransack(@search_word_hash)
  #     @results = @q.result
  #   end
  # end
end
