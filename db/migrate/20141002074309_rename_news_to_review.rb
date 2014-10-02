class RenameNewsToReview < ActiveRecord::Migration
  def change
    rename_table :news, :review
  end
end
