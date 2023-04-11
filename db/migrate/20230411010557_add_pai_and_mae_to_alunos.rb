class AddPaiAndMaeToAlunos < ActiveRecord::Migration[7.0]
  def change
    add_column :alunos, :pai, :string
    add_column :alunos, :mae, :string
  end
end
