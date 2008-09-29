class CreateGolfers < ActiveRecord::Migration
  def self.up
    create_table :golfers do |t|
      t.string :name
      t.integer :earnings

      t.timestamps
    end
  end

  def self.down
    drop_table :golfers
  end
end
