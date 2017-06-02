class CreateExperimentoPlantas < ActiveRecord::Migration[5.1]
  def change
    create_table :experimento_plantas do |t|
      t.references :experimento, foreign_key: true
      t.references :planta, foreign_key: true

      t.timestamps
    end
  end
end
