json.array!(@mirrors) do |mirror|
  json.extract! mirror, :id, :source, :frequency, :last_updated, :name, :notes, :mirrored_url
  json.url mirror_url(mirror, format: :json)
end
