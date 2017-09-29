class CreateBrandsStoresTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands_stores) do |t|
      t.column(:brand_id, :int)
      t.column(:store_id, :int)
      t.timestamps()
    end
  end
end
