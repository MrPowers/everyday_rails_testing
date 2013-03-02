class AddContactIdToPhoneNumber < ActiveRecord::Migration
  def change
    add_column :phone_numbers, :contact_id, :integer
  end
end
