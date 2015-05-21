class AddIndexEmployees < ActiveRecord::Migration
  def change
  	add_index :accounts, :employees 
  end
end
