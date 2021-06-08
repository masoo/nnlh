class TopController < ApplicationController
  def index
  end

  def s
  end

  def create
    if params[:s].present? && params[:s] == "small"
      pointsize = 60
    else
      pointsize = 100
    end
    mimage = Magick::ImageList.new("public/image.png")
    draw = Magick::Draw.new
    draw.annotate(mimage, 0, 0, 5, 5, params["message"]) do
      self.font      = 'vendor/fonts/SourceHanSansHW-Regular.otf'
      self.fill      = 'white'
      self.stroke    = 'transparent'
      self.pointsize = pointsize
      self.gravity   = Magick::CenterGravity
    end
    @image = "data:image/png\;base64,#{Base64.strict_encode64(mimage.to_blob)}"
  end
end
