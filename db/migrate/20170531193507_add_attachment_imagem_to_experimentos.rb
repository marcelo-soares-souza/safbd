class AddAttachmentImagemToExperimentos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :experimentos do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :experimentos, :imagem
  end
end
