class AddAttachmentImagemToSistemas < ActiveRecord::Migration[5.1]
  def self.up
    change_table :sistemas do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :sistemas, :imagem
  end
end
