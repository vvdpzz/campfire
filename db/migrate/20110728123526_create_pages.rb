class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.references :user
      t.references :channel
      t.string :title
      t.text :content
      t.text :markdown

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
