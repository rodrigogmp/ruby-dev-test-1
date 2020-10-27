json.id @directory.id
json.name @directory.name
json.subrepositories @directory.subdirectories.each do |sr|
  json.id sr.id
  json.name sr.name
end 

json.archives @directory.archives.each do |archive|
  json.name archive.name
  json.attachment archive.attachment
end