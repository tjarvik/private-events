class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :time
      t.string :description
      t.references :host
      
      t.timestamps
    end
  end
end
