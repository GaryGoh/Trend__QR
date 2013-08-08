class Server < ActiveRecord::Base
  attr_accessible :CPU, :IDR, :IP, :MAC, :QR_code, :RAM, :Storage, :name, :image, :search
  has_many :cables, :dependent => :destroy


  ############################################
  # To give a simple search function
  ############################################

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])|
          where("QR_code = ?", search)
    else
      find(:all)
    end
  end


  ############################################################################
  # To constrain the data
  ############################################################################

  # Server name
  validates_presence_of :name, :message => "Must be provided a server name"

  # IP address
  validates_presence_of :IP, :message => "Must be provided a IP address"
  validates_format_of :IP, :with => /\A^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/, :message => "Please input correct IP address"

#  IDRACE
  validates_presence_of :IDR, :message => "Must be provided a IDRACE IP address"
  validates_format_of :IDR, :with => /\A^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/, :message => "Please input correct IP address"

  # MAC

  validates_format_of :MAC, :with => /^([0-9A-F]{2}[:-]){5}([0-9A-F]{2})$/, :if => :MAC_blank?

  def MAC_blank?
    if self.MAC.blank?
      return false
    else
      return true
    end
  end


  @@qr
  #To generate QR_Code
  def self.qr
    @@qr = (SecureRandom.hex 4).to_s
  end

## upload image ##
##  begin  ##
# writing image data to filesystem, after the image has been written to database
  after_save :store_image

#private
# To write the uploaded image to the filesystem
  def store_image
    if @file_data
      FileUtils.mkdir_p Img_Store
      File.open(image_filename, 'wb') do |f|
        f.write (@file_data.read)
      end
      @file_data = nil
    end
  end

# To assign image data and store the extension like .jpg, .png
  def image=(file_data)
    unless file_data.blank?
      @file_data = file_data
      self.extension = file_data.original_filename.split('.').last.downcase
    end
  end

# To indicate the path of folder that is used to store image
  Img_Store = File.join Rails.root, 'public', 'image_store'

# Where to write the image file to
  def image_filename
    File.join Img_Store, "#{id}.#{extension}"
  end

# To return a path we can use in HTML for the image
  def image_path
    "/image_store/#{id}.#{extension}"
  end

# To return a boolean value whether there is a photo
  def has_image?
    File.exists? image_filename
  end
end
##  end  ##