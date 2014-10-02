class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :display_title
      t.string :headline
      t.text :summary_short
      t.string :suggested_link_text
      t.string :suggested_link_text_url
      t.string :image_url
      t.datetime :opening_date

      t.timestamps
    end
  end
end
