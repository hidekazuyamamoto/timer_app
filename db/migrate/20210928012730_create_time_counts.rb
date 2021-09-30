class CreateTimeCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :time_counts do |t|
      t.timestamps
      t.references :timer_title, nill: false, foreign_key: true
      t.integer :time
    end
  end
end
