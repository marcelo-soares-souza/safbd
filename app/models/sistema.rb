class Sistema < ApplicationRecord
  extend FriendlyId
  friendly_id :nome, use: :slugged

  validates :nome, presence: true
  validates :cidade, presence: true
  validates :uf, presence: true
  validates :imagem, presence: true

  has_many :experimentos
  has_many :plantas, through: :experimentos
  belongs_to :user

  # geocoded_by :localization
  # after_validation :geocode

  has_attached_file :imagem, styles: { medium: "360x360>", thumb: "180x180>" }, default_url: "/assets/missing.png"
  validates_attachment_content_type :imagem, content_type: /\Aimage\/.*\z/

  protected
    def should_generate_new_friendly_id?
      nome_changed?
    end

    def localization
      self.cidade + ", " + self.uf + ", " + self.cep
    end

    def self.search(search)
      where("nome || cidade ILIKE ?", "%#{search}%")
    end

    UF = [ "Acre" => "AC", "Alagoas" => "AL" ]

    def self.search(search)
      where("nome ILIKE ?", "%#{search}%")
    end
end
