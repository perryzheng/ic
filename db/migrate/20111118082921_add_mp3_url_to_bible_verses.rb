class AddMp3UrlToBibleVerses < ActiveRecord::Migration
  def self.up
    add_column :bible_verses, :mp3_url, :string
  end

  def self.down
    remove_column :bible_verses, :mp3_url
  end
end
