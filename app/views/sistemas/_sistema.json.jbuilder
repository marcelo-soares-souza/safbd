json.extract! sistema, :id, :nome, :slug, :descricao, :logradouro, :cidade, :uf, :cep, :latitude, :longitude, :user_id, :created_at, :updated_at
json.url sistema_url(sistema, format: :json)
