class ExperimentoPlanta < ApplicationRecord
  belongs_to :experimento
  belongs_to :planta
  accepts_nested_attributes_for :experimento, allow_destroy: true
end
