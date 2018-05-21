require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)

    Article.__elasticsearch__.import force: true
    Article.__elasticsearch__.refresh_index!
  end


  test 'gets index' do
    get articles_url
    assert_response :success
  end

  test 'gets search results' do
    get search_articles_url(q: 'mystring')
    assert_response :success
    assert_not_nil assigns(:articles)
    assert_equal 2, assigns(:articles).size
  end


  test 'gets new' do
    get new_article_url
    assert_response :success
  end

  test 'creates article' do
    assert_difference('Article.count') do
      post articles_url, params: { article: { content: @article.content, published_on: @article.published_on, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test 'shows article' do
    get article_url(@article)
    assert_response :success
  end

  test 'gets edit' do
    get edit_article_url(@article)
    assert_response :success
  end

  test 'updates article' do
    patch article_url(@article), params: { article: { content: @article.content, published_on: @article.published_on, title: @article.title } }
    assert_redirected_to article_url(@article)
  end

  test 'destroys article' do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
