module ApplicationHelper
  def random_image_from_folder(folder)
    images = Dir[Rails.root.join("app/assets/images/#{folder}/*.jpg")]
    return nil if images.empty?
    random_image = images.sample
    File.basename(random_image)
  end
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end
end
