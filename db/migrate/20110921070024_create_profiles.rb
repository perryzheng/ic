class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.boolean :esl
      t.string :country
      t.string :start_date
      t.string :end_date
      t.boolean :english_help
      t.boolean :living_help
      t.boolean :fun_help
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
