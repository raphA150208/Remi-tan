class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.text :sentence
      t.integer :status

      t.timestamps
    end
  end
end
