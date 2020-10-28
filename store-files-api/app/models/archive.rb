class Archive < ApplicationRecord
  include Filterable

  belongs_to :directory

  validates_presence_of :name
  mount_uploader :attachment, AttachmentUploader

  scope :by_name, lambda { |name|
    return nil if name.nil?
    where("archives.name like concat('%', ?, '%') ", name.gsub(" ", "%"))
  }
end
