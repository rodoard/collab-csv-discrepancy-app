class Uploads
  def self.get_uploaded files
    files.map {|file| file.read}
  end
end
