class CreateReminiscentWords < ActiveRecord::Migration[5.2]
	def change
		create_table :reminiscent_words do |t|
			t.string :keyword, null: false
			t.references :question, foreign_key: true, null: false
      t.timestamps
    end
  end
end
