class CreateSubscribers < ActiveRecord::Migration[8.0]
  def change
    create_table :subscribers do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.string :email
      subscriber = Subscriber.create(product_id: product.id, email: "test@example.com")

      t.timestamps
    end
  end
end
