class AddColumnTrimestreToHorarios < ActiveRecord::Migration[7.0]
  def change
    add_column :horarios, :trimestre, :string
  end
end
