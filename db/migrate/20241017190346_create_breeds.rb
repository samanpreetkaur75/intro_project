class CreateBreeds < ActiveRecord::Migration[7.2]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :sub_breed

      t.timestamps
    end
  end
end
