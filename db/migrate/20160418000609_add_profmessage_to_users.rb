class AddProfmessageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profmessage, :text
  end
end
