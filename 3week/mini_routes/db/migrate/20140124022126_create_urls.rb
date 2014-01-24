class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :link
      t.string :random_string
      t.string :count

      t.timestamps
    end
  end
end
