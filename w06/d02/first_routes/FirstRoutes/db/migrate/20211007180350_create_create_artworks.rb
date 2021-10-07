class CreateCreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :create_artworks do |t|

      t.timestamps
    end
  end
end
