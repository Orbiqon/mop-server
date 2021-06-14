class AddStateToGalleries < ActiveRecord::Migration[6.1]
  def change
    add_column :galleries, :state, :string
  end
end
