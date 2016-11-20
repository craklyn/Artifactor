class AddDelayedJob < ActiveRecord::Migration
  def change
    create_table :delayed_jobs do |t|
      t.integer :priority, default: 0
      t.integer :attempts, default: 0
      t.text :handler
      t.text :last_error
      t.timestamp :run_at
      t.timestamp :locked_at
      t.timestamp :failed_at
      t.timestamp :locked_by
      t.string :queue
      t.timestamps
    end
  end
end
