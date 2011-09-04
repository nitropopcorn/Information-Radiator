class NewsItem < ActiveRecord::Base

  IMAGES_DIRECTORY = "public/data"

  def save_image(data_file)
    name = data_file.original_filename || ""
    path = File.join(Rails.root, IMAGES_DIRECTORY, name)
    File.open(path, "wb") { |f| f.write(data_file.read) }

    File.delete(File.join(Rails.root, IMAGES_DIRECTORY, image)) if image && name != image
    self.image = name
    save
  end
  
end
