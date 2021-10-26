class AddQuestionIdToReminiscentWordsDictionaries < ActiveRecord::Migration[5.2]
  def change
    add_reference :reminiscent_words_dictionaries, :question, foreign_key: true
  end
end
