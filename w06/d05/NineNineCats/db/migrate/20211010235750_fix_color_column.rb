class FixColorColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :cats, :colors, :color
  end

end
