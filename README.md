# Ruby on Rails and Elasticsearch: Example application

This application is an example of integrating the [Elasticsearch](http://www.elasticsearch.org)
search engine with the [Ruby On Rails](http://rubyonrails.org) web framework.

For the most part, this was generated with Elastic's templates available at
https://github.com/elasticsearch/elasticsearch-rails/tree/master/elasticsearch-rails/lib/rails/templates.
If you run into https://github.com/elastic/elasticsearch-rails/issues/751 like I
did, you'll need to run the following instead:

```
rails new searchapp --skip --skip-bundle --template https://raw.githubusercontent.com/elastic/elasticsearch-rails/c601bcce04974726411509e69310c5480fa89b44/elasticsearch-rails/lib/rails/templates/01-basic.rb
rails new searchapp --skip --skip-bundle --template https://raw.github.com/elastic/elasticsearch-rails/master/elasticsearch-rails/lib/rails/templates/02-pretty.rb
rails new searchapp --skip --skip-bundle --template https://raw.github.com/elastic/elasticsearch-rails/master/elasticsearch-rails/lib/rails/templates/03-expert.rb
```

In addition, commit `a9afba683ec58d586b9ac6fd8e8adf4d546b5afc` fixes a bug that
prevented the application from running.

Note: elasticsearch and Kibana were both installed via Homebrew.

## Local setup (macOS)

```
bundle
bundle exec rake db:setup
bundle exec rake environment rake elasticsearch:import:all
```

## [1] Basic

The `basic` version provides a simple integration for a simple Rails model, `Article`, showing how
to include the search engine support in your model, automatically index changes to records,
and use a form to perform simple search require 'requests.'


## [2] Pretty

The `pretty` template builds on the `basic` version and brings couple of improvements:

* Using the [Bootstrap](http://getbootstrap.com) framework to enhance the visual style of the application
* Using an `Article.search` class method to customize the default search definition
* Highlighting matching phrases in search results
* Paginating results with Kaminari


## [3] Expert

The `expert` template changes to a complex database schema with model relationships: article belongs
to a category, has many authors and comments.

* The Elasticsearch integration is refactored into the `Searchable` concern
* A complex mapping for the index is defined
* A custom serialization is defined in `Article#as_indexed_json`
* The `search` method is amended with facets and suggestions
* A [Sidekiq](http://sidekiq.org) worker for handling index updates in background is added
* A custom `SearchController` with associated view is added
* A Rails initializer is added to customize the Elasticsearch client configuration
* Seed script and example data from New York Times is added

