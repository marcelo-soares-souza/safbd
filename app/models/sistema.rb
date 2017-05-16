class Sistema < ApplicationRecord
  extend FriendlyId
  friendly_id :nome, use: :slugged

  validates :nome, :presence => true
  validates :cidade, :presence => true
  validates :uf, :presence => true

  belongs_to :user

  geocoded_by :localization
  after_validation :geocode

  has_attached_file :imagem, styles: { medium: "360x360>", thumb: "180x180>" }, default_url: "/images/:style/missing.png"
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
end
