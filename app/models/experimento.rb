class Experimento < ApplicationRecord
  extend FriendlyId
  friendly_id :nome, use: :slugged

  belongs_to :sistema

  has_attached_file :imagem, styles: { medium: "360x360>", thumb: "180x180>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imagem, content_type: /\Aimage\/.*\z/

  protected
  def should_generate_new_friendly_id?
    nome_changed?
  end
end
