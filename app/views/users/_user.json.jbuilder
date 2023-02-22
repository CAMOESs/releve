json.extract! user, :id, :nom, :prenom, :lecture, :commecri, :anglais, :math, :pct, :svt, :hisgeo, :created_at, :updated_at
json.url user_url(user, format: :json)
