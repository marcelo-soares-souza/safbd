class Planta < ApplicationRecord
  extend FriendlyId
  friendly_id :nome, use: :slugged

  validates :nome, presence: true

  belongs_to :user
  has_many :experimento_plantas, dependent: :nullify
  has_many :experimentos, through: :experimento_plantas
  accepts_nested_attributes_for :experimento_plantas, allow_destroy: true

  has_attached_file :imagem, styles: { medium: "360x360>", thumb: "180x180>" }, default_url: "/assets/missing.png"
  validates_attachment_content_type :imagem, content_type: /\Aimage\/.*\z/

  protected
    def should_generate_new_friendly_id?
      nome_changed?
    end

    def self.search(search)
      where("nome ILIKE ?", "%#{search}%")
    end
end
