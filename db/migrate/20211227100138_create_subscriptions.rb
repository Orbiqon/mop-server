class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :package, foreign_key: true
      t.timestamp :start_date
      t.timestamp :end_date
      t.boolean :status, default: false
      t.boolean :renew, default: false
      t.boolean :on_trial, default: false
      t.string :charge_id
      t.string :job_id

      t.timestamps
    end
  end
end
