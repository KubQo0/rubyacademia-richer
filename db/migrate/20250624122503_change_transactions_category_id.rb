class ChangeTransactionsCategoryId < ActiveRecord::Migration[7.2]
  def change
    change_column_null :transactions, :category_id, false
  end
end
