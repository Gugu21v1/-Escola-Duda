class AddEmailToAlunos < ActiveRecord::Migration[7.0]
  def change
    add_column :alunos, :email, :string
  end
end
