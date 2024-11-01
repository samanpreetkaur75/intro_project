class AddSizeToBreeds < ActiveRecord::Migration[7.2]
  def change
    add_column :breeds, :size, :string
  end
end
