class DropTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :nota
  end
end
