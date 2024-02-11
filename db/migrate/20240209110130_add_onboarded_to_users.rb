class AddOnboardedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :onboarded, :boolean
  end
end