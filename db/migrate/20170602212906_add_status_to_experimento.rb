class AddStatusToExperimento < ActiveRecord::Migration[5.1]
  def change
    add_column :experimentos, :inicio, :date
    add_column :experimentos, :fim, :date
    add_column :experimentos, :fase, :string
  end
end
