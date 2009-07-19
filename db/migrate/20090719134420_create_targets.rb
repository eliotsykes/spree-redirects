class CreateTargets < ActiveRecord::Migration
  def self.up
    create_table :targets do |t|
      t.string :type
      t.string :url
      t.integer :product_id
      t.integer :taxon_id
      t.timestamps
    end
  end

  def self.down
    drop_table :targets
  end
end
