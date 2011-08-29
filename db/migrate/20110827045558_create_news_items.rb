class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :url
      t.integer :time

      t.timestamps
    end
  end

  def self.down
    drop_table :news_items
  end
end
