class AddStateToAccountEntries < ActiveRecord::Migration
  def change
    add_column :account_entries, :state, :string
  end
end
