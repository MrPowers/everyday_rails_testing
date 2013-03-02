class AddLastnameToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :lastname, :string
  end
end
