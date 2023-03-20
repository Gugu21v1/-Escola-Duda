class RenameTableHorario < ActiveRecord::Migration[7.0]
  def change
    rename_table :horario, :horarios
  end
end
