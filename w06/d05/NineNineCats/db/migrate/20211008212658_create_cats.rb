class CreateCats < ActiveRecord::Migration[5.2]
  def change
    # validates :sex, limit: 1

    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :colors, null: false
      t.string :name, null: false
      t.string :sex, null: false, limit: 1
      t.text :description

      t.timestamps
    end
    add_index :cats, :name
  end
end
