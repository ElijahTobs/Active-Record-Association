class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.timestamps
    end
    add_reference :events, :creator, foreign_key: true
    add_column :events, :description, :text_area
  end
end
