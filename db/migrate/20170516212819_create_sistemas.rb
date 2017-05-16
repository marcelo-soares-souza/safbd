class CreateSistemas < ActiveRecord::Migration[5.1]
  def change
    create_table :sistemas do |t|
      t.string :nome
      t.string :slug
      t.text :descricao
      t.string :logradouro
      t.string :cidade
      t.string :uf
      t.string :cep
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
