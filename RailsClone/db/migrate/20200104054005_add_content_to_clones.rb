class AddContentToClones < ActiveRecord::Migration[5.2]
  def change
    add_column :clones, :content, :string
  end
end
