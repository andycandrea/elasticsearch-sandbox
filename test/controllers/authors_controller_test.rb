require('test_helper')

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test 'gets index' do
    get authors_url
    assert_response :success
  end

  test 'gets new' do
    get new_author_url
    assert_response :success
  end

  test 'creates author' do
    assert_difference('Author.count') do
      post authors_url, params: { author: { first_name: @author.first_name, last_name: @author.last_name } }
    end

    assert_redirected_to author_url(Author.last)
  end

  test 'shows author' do
    get author_url(@author)
    assert_response :success
  end

  test 'gets edit' do
    get edit_author_url(@author)
    assert_response :success
  end

  test 'updates author' do
    patch author_url(@author), params: { author: { first_name: @author.first_name, last_name: @author.last_name } }
    assert_redirected_to author_url(@author)
  end

  test 'destroys author' do
    assert_difference('Author.count', -1) do
      delete author_url(@author)
    end

    assert_redirected_to authors_url
  end
end
