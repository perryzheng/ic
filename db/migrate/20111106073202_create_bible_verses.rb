class CreateBibleVerses < ActiveRecord::Migration
  def self.up
    create_table :bible_verses do |t|
      t.text :verse_content
      t.string :label
      t.integer :bullet_point_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bible_verses
  end
end
