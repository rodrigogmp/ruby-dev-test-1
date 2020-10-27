class Directory < ApplicationRecord
  has_many :archives
  has_many :subdirectories, class_name: to_s
  belongs_to :directory, optional: true

  validates_presence_of :name
end
