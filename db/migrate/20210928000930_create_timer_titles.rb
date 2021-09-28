class CreateTimerTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :timer_titles do |t|

      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.string :timer_title
    end
  end
end
