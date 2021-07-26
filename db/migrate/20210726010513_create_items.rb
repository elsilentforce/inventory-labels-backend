class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :storage, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
