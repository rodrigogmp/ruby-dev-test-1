class Directory < ApplicationRecord
  include Filterable

  has_many :archives, dependent: :destroy
  has_many :subdirectories, class_name: to_s, dependent: :destroy
  belongs_to :directory, optional: true

  validates_presence_of :name
  validates_uniqueness_of :name

  accepts_nested_attributes_for :archives

  scope :by_name, lambda { |name|
    return nil if name.nil?
    where("directories.name like concat('%', ?, '%') ", name.gsub(" ", "%"))
  }
end
