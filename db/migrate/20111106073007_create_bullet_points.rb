class CreateBulletPoints < ActiveRecord::Migration
  def self.up
    create_table :bullet_points do |t|
      t.string :header
      t.text :bullet_point_content
      t.integer :lesson_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bullet_points
  end
end
