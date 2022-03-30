class AddColumnToExhibitions < ActiveRecord::Migration[6.1]
  def up
    add_column :exhibitions, :views, :integer, default: 0
  end

  def down
    remove_column :exhibitions, :views
  end
end
