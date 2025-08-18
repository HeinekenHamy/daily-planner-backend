class AddCategoryAndPriorityToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :category, :string, default: 'Personal'
    add_column :events, :priority, :string, default: 'Medium'
  end
end
