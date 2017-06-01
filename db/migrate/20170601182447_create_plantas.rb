class CreatePlantas < ActiveRecord::Migration[5.1]
  def change
    create_table :plantas do |t|
      t.string :nome
      t.text :descricao
      t.string :slug
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :plantas, :slug, unique: true
  end
end
