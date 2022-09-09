class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :caption, :location, :date, :image
  has_one :user

  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image, only_path: true)
      }
    end

  end
end
