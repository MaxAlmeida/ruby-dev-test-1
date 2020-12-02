class Directory < ApplicationRecord
  #associations
  has_many :directories, class_name: "Directory", foreign_key: "directory_id"
  belongs_to :directory, optional: true
  
  #validations
  validates :name, presence: true

  #callbacks
  after_create :create_directory
  after_destroy :delete_directory

  mount_uploaders :files, FileUploader

  def path
    if directory.nil?
      return Rails.root.join("spec/support/storage/#{name}").to_s if Rails.env.test? 
      Rails.root.join("storage/#{name}").to_s
    else
      directory.path + "/#{name}"
    end
  end

  def ordered_itens
    directories_items = directories.map do |dir|
      {item_name: dir.name, type: 'folder'}
    end

    files_items = files.map do |file|
      file_name = file.send("identifier")
      {item_name: file_name, type: file_name.partition('.').last}
    end
    itens = []
    itens << directories_items
    itens << files_items

    itens.flatten.sort_by{ |k| k[:item_name]}
  end

  private

  def create_directory
    Dir.mkdir(path)
  end

  def delete_directory
    FileUtils.rm_rf("#{path}", secure: true)
  end
end
