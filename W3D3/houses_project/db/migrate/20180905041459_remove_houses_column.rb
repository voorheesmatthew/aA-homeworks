class RemoveHousesColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :houses, :person_id
  end
end
