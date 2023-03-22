class DropTableMateria < ActiveRecord::Migration[7.0]
  def change
    drop_table :materia
  end
end
