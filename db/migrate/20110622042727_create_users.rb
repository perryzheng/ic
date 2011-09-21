class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :esl
      t.string :country
      t.string :start_date
      t.string :end_date
      t.string :english_help
      t.string :living_help
      t.string :fun_help
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end