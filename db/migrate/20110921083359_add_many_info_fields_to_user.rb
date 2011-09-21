class AddManyInfoFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name,   :string
    add_column :users, :last_name,    :string
    add_column :users, :phone,        :string
    add_column :users, :esl,          :string
    add_column :users, :country,      :string
    add_column :users, :start_date,   :string
    add_column :users, :end_date,     :string
    add_column :users, :english_help, :string
    add_column :users, :living_help,  :string
    add_column :users, :fun_help,     :string    
    add_column :users, :notes,        :string
  end

  def self.down
  end
end