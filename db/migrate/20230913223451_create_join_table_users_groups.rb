class CreateJoinTableUsersGroups < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :groups do |t|
      # You can add additional columns here if needed
      t.index [:user_id, :group_id]
      t.index [:group_id, :user_id]
    end
  end
end