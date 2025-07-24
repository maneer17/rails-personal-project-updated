class Fetcher
  attr_reader :backups_dir
  def initialize(backups_dir)
    @backups_dir = backups_dir
  end 

  def fetch
     Dir.glob(backups_dir).map do |file|
       { name: File.basename(file), value: file }
    end
  end

end 

