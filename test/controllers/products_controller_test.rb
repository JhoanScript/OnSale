require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @product_two = products(:two)
  end

  test "should get the products index" do
    get products_url
    assert_response :success
  end

  test "should get a new product form" do
    get new_product_url
    assert_response :success

    # Make sure the product form is in the body of the response.
    assert_select 'form'
  end

  test "should allow to create a new product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { description: @product.description, name: @product.name, price: @product.price } }
    end

    assert_redirected_to product_url(Product.last)
    assert_equal flash.notice, 'Product was successfully created.'
  end

  test "it should not allow to create a new product with empty fields" do
    assert_no_difference("Product.count") do
      post products_url, params: { product: { description: '', name: @product.name, price: @product.price } }
    end

    assert_response :unprocessable_entity
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success

    # Make sure the product attributes are in the body of the response.
    [@product.name, @product.description, @product.price.to_s].each do |attribute|
      assert_match attribute, @response.body
    end

  end

  test "should get a product edit form" do
    get edit_product_url(@product)
    assert_response :success

    assert_select 'form'
  end

  test "should update product" do
    patch product_url(@product), params: { product: { price: @product_two.price } }
    assert_redirected_to product_url(@product)

    assert_equal flash.notice, 'Product was successfully updated.'
  end

  test "it should not update product with invalid field" do
    patch product_url(@product), params: { product: { price: nil } }

    assert_response :unprocessable_entity
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
    assert_equal flash.notice, 'Product was successfully destroyed.'
  end
end
