class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.string :type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
