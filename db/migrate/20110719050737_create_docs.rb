class CreateDocs < ActiveRecord::Migration
  def self.up
    create_table :docs do |t|
      t.references :user
      t.references :channel
      t.string :src

      t.timestamps
    end
  end

  def self.down
    drop_table :docs
  end
end
