json.observations @observations do |observation|
  json.observation observation
  json.user observation.user
  json.photos observation.photos
end