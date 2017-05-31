json.extract! experimento, :id, :nome, :descricao, :slug, :experimento_id, :created_at, :updated_at
json.url experimento_url(experimento, format: :json)
