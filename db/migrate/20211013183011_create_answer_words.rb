class CreateAnswerWords < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_words do |t|
      t.string :candidate, null: false
      t.boolean :best_answer_flg, null: false, default: false
      t.references :answer, foreign_key: true, null: false
      t.timestamps
    end
  end
end
