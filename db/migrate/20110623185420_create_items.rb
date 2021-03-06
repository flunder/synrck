class CreateItems < ActiveRecord::Migration
  def self.up
    create_table   :items do |t|
      t.string     :url
      t.string     :title
      t.integer    :price
      t.string     :site
      t.text       :desc
      t.string     :brand
      t.text       :imageSrc      
      t.string     :photo_file_name
      t.string     :photo_content_type
      t.integer    :photo_file_size      
      t.datetime   :expires      
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
