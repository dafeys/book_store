class ChangeNullValues < ActiveRecord::Migration[7.1]
  def change
    change_column_null :books, :title, false
    change_column_null :books, :author, false
    change_column_null :books, :isbn, false
  end
end
