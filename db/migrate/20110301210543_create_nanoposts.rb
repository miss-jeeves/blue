class CreateNanoposts < ActiveRecord::Migration
  def self.up
    create_table :nanoposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :nanoposts
  end
end
