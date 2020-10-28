json.archives @archives.each do |archive|
  json.id archive.id
  json.name archive.name
  json.attachment archive.attachment
end