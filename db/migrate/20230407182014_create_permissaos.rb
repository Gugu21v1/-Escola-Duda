class CreatePermissaos < ActiveRecord::Migration[7.0]
  def change
    create_table :permissaos do |t|
      t.boolean :visivel, default: false
      t.timestamps
    end
  end
end
