class CreateExperimentos < ActiveRecord::Migration[5.1]
  def change
    create_table :experimentos do |t|
      t.string :nome
      t.text :descricao
      t.string :slug
      t.references :sistema, foreign_key: true

      t.timestamps
    end
    add_index :experimentos, :slug, unique: true
  end
end
