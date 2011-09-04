require 'test_helper'

class NewsItemTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess

  setup do
    NewsItem::IMAGES_DIRECTORY = 'test/fixtures/files'
    @news_item = news_items(:one)
    FileUtils.touch(File.join(Rails.root, NewsItem::IMAGES_DIRECTORY, @news_item.image))
  end


  test "should remove the old image from the image store during update" do
    old_file = File.join(Rails.root, NewsItem::IMAGES_DIRECTORY, @news_item.image)
    file_to_upload = fixture_file_upload('files/new_image.png', 'image/png')

    @news_item.save_image(file_to_upload)

    assert !File.exist?(old_file), "Old image file not deleted"
    new_file = File.join(Rails.root, NewsItem::IMAGES_DIRECTORY, @news_item.image)
    assert File.exist?(new_file), "New image file not stored #{new_file}"
  end

  test "should not delete the image if the new image is of the same name" do
    old_file = File.join(Rails.root, NewsItem::IMAGES_DIRECTORY, @news_item.image)
    file_to_upload = fixture_file_upload('files/image.png', 'image/png')

    @news_item.save_image(file_to_upload)

    new_file = File.join(Rails.root, NewsItem::IMAGES_DIRECTORY, @news_item.image)
    assert File.exist?(new_file), "New image file not stored #{new_file}"
  end

end
