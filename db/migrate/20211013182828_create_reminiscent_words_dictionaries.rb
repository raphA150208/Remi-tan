class CreateReminiscentWordsDictionaries < ActiveRecord::Migration[5.2]
  def change
    create_table :reminiscent_words_dictionaries do |t|
      t.string :answer_word, null: false
      t.string :reminiscent_word, null: false
      t.boolean :best_answer_flg, null: false, default: false
      t.timestamps
    end
  end
end
