class TopController < ApplicationController
  def index
  end

  def g
  end

  def create
    image = Image.first
    mimage = Magick::ImageList.new
    mimage.from_blob(image.file)
    draw = Magick::Draw.new
    draw.annotate(mimage, 0, 0, 5, 5, params["message"]) do
      self.font      = 'vendor/fonts/SourceHanSansHW-Regular.otf'
      self.fill      = 'white'
      self.stroke    = 'transparent'
      self.pointsize = 100
      self.gravity   = Magick::CenterGravity
    end
    @image = "data:image/png\;base64,#{Base64.strict_encode64(mimage.to_blob)}"
  end

  def show_image
    @image = Image.first
    send_data @image.file, type: "image/png", disposition: "inline"
  end
end
