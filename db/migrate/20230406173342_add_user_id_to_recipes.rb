class AddUserIdToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :user, foreign_key: { to_table: :users }
  end
end
