class AddColumnsToSharedAndContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :favorite_contacts, :boolean, default: false
    add_column :contact_shares, :favorite_contacts, :boolean, default: false
  end
end
