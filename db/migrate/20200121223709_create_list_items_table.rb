class CreateListItemsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :list_items do |t|
      t.references :list, foreign_key: true
      t.references :item, foreign_key: true
  end
end
end
