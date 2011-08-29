class NewsItem < ActiveRecord::Base
  
  def self.save(upload, id)
    
    name = upload['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path = File.join(Rails.root, directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    return name.to_s
    
  end
  
end
