class ChangeColumnToQuestion < ActiveRecord::Migration[5.2]
  def change
    change_column_null :questions, :content, false
    change_column_null :questions, :status, false
    change_column_default :questions, :status, from: nil, to:0
  end
end
