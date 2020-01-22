class CreateListsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
    end
  end
end
