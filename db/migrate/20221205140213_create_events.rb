class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.bigint :creator_id, class_name: 'User', foreign_key: 'creator_id'

      t.timestamps
    end
  end
end
