class AddChapterIdToLessons < ActiveRecord::Migration
  def self.up
    add_column :lessons, :chapter_id, :integer
  end

  def self.down
    remove_column :lessons, :chapter_id
  end
end
