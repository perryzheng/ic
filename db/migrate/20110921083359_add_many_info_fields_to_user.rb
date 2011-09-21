class AddManyInfoFieldsToUser < ActiveRecord::Migration
  def self.up
    change_column :users, :first_name,   :string
    change_column :users, :last_name,    :string
    change_column :users, :phone,        :string
    change_column :users, :esl,          :string
    change_column :users, :country,      :string
    change_column :users, :start_date,   :string
    change_column :users, :end_date,     :string
    change_column :users, :english_help, :string
    change_column :users, :living_help,  :string
    change_column :users, :fun_help,     :string    
    change_column :users, :notes,        :string
  end

  def self.down
  end
end