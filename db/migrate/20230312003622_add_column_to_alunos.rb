class AddColumnToAlunos < ActiveRecord::Migration[7.0]
  def change
    add_column :alunos, :status, :string
  end
end
