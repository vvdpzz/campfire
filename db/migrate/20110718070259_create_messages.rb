class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.references :user
      t.string :body
      t.integer :uts
    end
  end

  def self.down
    drop_table :messages
  end
end
