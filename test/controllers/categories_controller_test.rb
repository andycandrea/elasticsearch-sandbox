require('test_helper')

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test 'gets index' do
    get categories_url
    assert_response :success
  end

  test 'gets new' do
    get new_category_url
    assert_response :success
  end

  test 'creates category' do
    assert_difference('Category.count') do
      post categories_url, params: { category: { title: @category.title } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test 'shows category' do
    get category_url(@category)
    assert_response :success
  end

  test 'gets edit' do
    get edit_category_url(@category)
    assert_response :success
  end

  test 'updates category' do
    patch category_url(@category), params: { category: { title: @category.title } }
    assert_redirected_to category_url(@category)
  end

  test 'destroys category' do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
