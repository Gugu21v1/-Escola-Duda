class AddPasswordToAlunos < ActiveRecord::Migration[7.0]
  def change
    add_column :alunos, :password, :string
  end
end
