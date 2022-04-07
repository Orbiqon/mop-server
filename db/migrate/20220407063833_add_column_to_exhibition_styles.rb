class AddColumnToExhibitionStyles < ActiveRecord::Migration[6.1]
  def up
    add_column :exhibition_styles, :slug, :string
    add_column :exhibition_styles, :description, :text
  end
end
