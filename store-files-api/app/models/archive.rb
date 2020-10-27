class Archive < ApplicationRecord
  belongs_to :directory

  validates_presence_of :name
  mount_uploader :attachment, AttachmentUploader
end
