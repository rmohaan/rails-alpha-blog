class ChangeUsersModelsToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :users_models, :users
  end
end
