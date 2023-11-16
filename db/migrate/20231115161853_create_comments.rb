class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commentor
      t.references :article, foreign_key:true, index:true, null:false
      t.text :body
      t.timestamps
    end
  end
end
