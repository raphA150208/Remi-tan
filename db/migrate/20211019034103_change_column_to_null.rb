class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :answer_words, :candidate, true
  end
  def down
    change_column_null :answer_words, :candidate, false
  end
end
