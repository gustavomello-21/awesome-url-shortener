class CreateUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :urls do |t|
      t.string :url
      t.string :token

      t.timestamps
    end
  end
end
