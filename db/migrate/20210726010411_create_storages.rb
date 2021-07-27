class CreateStorages < ActiveRecord::Migration[6.1]
  def change
    create_table :storages do |t|
      t.string :friendly_id
      t.string :description

      t.timestamps
    end
  end
end
