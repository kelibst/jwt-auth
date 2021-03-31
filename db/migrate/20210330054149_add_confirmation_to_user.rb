class AddConfirmationToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email_confirmed, :boolean, null: false, default: false
    add_column :users,  :confirmation_token, :string
    add_column :users,  :confirmed_at, :datetime
    add_column :users,  :confirmation_sent_at, :datetime
  end
end
