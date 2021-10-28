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
  #   @q = ReminiscentWordsDictionary.ransack(params[:q])
  #   if params[:q]
  #     @search_word = params[:q]
  #     @results = []
  #     @results_colllection = []
  #     @search_words = params[:q]['reminiscent_word_matches_all'].split(/[ |　]/)
  #     @search_words_formatted = @search_words.map {|v| "%#{v}%"}
  #     @search_words_formatted.each do |swf|
  #       @search_words_hash = {}
  #       @search_words_hash['reminiscent_word_matches_all'] = swf
  #       @results_by_single_search_word = ReminiscentWordsDictionary.ransack(@search_words_hash).result
  #       @results_colllection.push(@results_by_single_search_word)
  #     end
  #     @results_answer_words = []
  #     @results_colllection.length.times do
  #       @tmp_rwd_array = @results_colllection.shift
  #       @tmp_rwd_array.each do |tmp_i_rwd|
  #         if @results_colllection[0].any? { |tmp_j_rwd| tmp_j_rwd.answer_word == tmp_i_rwd.answer_word }
  #           if results_answer_words.all? { |raw| raw != tmp_i_rwd.answer_word }
  #             @results.push(mp_i_rwd)
  #             @results_answer_words.push(tmp_i_rwd.answer_word)
  #           end
  #         end
  #       end
  #     end
  #   end
  # end
end