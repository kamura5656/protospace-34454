class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references  :user,          foreugn_key: true
      t.references  :prototype,     foreugn_key: true

      t.timestamps
    end
  end
end
