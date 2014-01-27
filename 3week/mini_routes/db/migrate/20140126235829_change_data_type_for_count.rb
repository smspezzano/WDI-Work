class ChangeDataTypeForCount < ActiveRecord::Migration
 def self.up
    change_table :urls do |t|
      t.change :count, :integer
    end
  end
  def self.down
    change_table :urls do |t|
      t.change :count, :text
    end
  end
end