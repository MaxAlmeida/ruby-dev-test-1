class Directory < ApplicationRecord
  has_many :directories, class_name: "Directory", foreign_key: "directory_id"
  belongs_to :directory, optional: true
  validates :name, presence: true
end
