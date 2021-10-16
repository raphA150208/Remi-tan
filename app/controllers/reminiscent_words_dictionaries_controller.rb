class ReminiscentWordsDictionariesController < ApplicationController

  def search
    @q = ReminiscentWordsDictionary.ransack(params[:q])
    @reminiscent_words_dictionaries = ReminiscentWordsDictionary.all
    if params[:q]
      @search_word = params[:q]
      @results = @q.result
    end
  end
end
