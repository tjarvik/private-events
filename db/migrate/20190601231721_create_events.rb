class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :time
      t.string :description
      t.belongs_to :host_id

      t.timestamps
    end
  end
end
