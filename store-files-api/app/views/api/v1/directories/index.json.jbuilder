json.directories @directories.each do |directory|
  json.id directory.id
  json.name directory.name
end