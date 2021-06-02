require 'open-uri'
class ImageSavingJob < ApplicationJob
  queue_as :default

  def perform(path: )
    file = URI.open(path)
    image = Image.new
    image.file = file.read
    image.save
  end
end
