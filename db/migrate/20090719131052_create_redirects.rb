class CreateRedirects < ActiveRecord::Migration
  def self.up
    create_table :redirects do |t|
      t.string :from
      t.string :status
      t.integer :target_id
      t.timestamps
    end
  end

  def self.down
    drop_table :redirects
  end
end
