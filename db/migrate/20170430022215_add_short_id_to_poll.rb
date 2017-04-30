class AddShortIdToPoll < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, "short_id", :string, limit: 6, default: "", null: false
    add_index :polls, "short_id"
  end
end
