class PostToPosts < ActiveRecord::Migration[7.1]
  def change
    change_table :posts do |t|
      t.references :post, foreign_key: {to_table: :posts}
    end
  end
end
