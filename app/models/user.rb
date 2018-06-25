class User < ApplicationRecord

  def self.set_avatar_path(file)
    file_name = file.original_filename
    file_path = File.join(Rails.root,'public','avatars',file_name)
    File.open(file_path,'wb') do |f|
      f.write(file.read)
    end
    return file_name
  end

  def self.get_avatar_path(file_name)
   "/avatars/#{file_name}"
  end
end
