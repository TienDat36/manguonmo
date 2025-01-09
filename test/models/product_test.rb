require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper
  fixtures :subscribers, :products
  test "sends email notifications when back in stock" do
    product = products(:tshirt)
    subscriber = subscribers(:david)
    # Set product out of stock
    product.update(inventory_count: 0)

    assert_emails 2 do
      product.update(inventory_count: 99)
    end
    assert_equal "david@example.org", subscriber.email
  end
end
