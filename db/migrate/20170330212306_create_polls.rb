class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.string :title
      t.boolean :published
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
