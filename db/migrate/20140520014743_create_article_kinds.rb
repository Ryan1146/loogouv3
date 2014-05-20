class CreateArticleKinds < ActiveRecord::Migration
  def change
    create_table :article_kinds do |t|
      t.integer :article_id
      t.integer :kind_id

      t.timestamps
    end
  end
end
