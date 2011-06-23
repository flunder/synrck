class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string  :url
      t.string  :title
      t.text    :imageSrc
      t.integer :price
      t.string  :site
      t.text    :desc
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
