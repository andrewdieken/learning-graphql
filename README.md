# README

## GraphQL Install Instructions

#### References
- https://www.howtographql.com/graphql-ruby/0-introduction/
- https://graphql-ruby.org/fields/introduction.html
- https://medium.com/@UnicornAgency/you-should-be-using-graphql-a-ruby-introduction-9b1de3b001dd
- https://medium.com/shakuro/building-apis-with-graphql-and-ruby-on-rails-dbcc2e00bd99

#### Step 1: add gems
- Add the `graphql` to your  `Gemfile`
```ruby
gem 'graphql', <version_here>
```

#### Step 2: install gems
- Run the following commands to update your gems
```shell
$ bundle install
$ bundle exec rails generate graphql:install
$ bundle install
```
*NOTE: the second bundle install automatically adds another gem  `graphiql-rails`*

#### Optional Step (if you don't have a model set up)
- Now is the time to generate a model for you app
```shell
$ rails generate model <MODEL_NAME> <ALL_FIELDS>
$ rails db:migrate
```

#### Step 3: creating types
- Through Ruby
```shell
$ rails generate graphql:object <OBJECT_NAME>
```
*NOTE: This will generate a file within your Ruby app with a path of `app/graphql/types/<OBJECT_NAME>.rb`*

- Through file system
Add a file to the folder `app/graphql/types` with the name `<OBEJECT_NAME>.rb`

#### Step 4: define a type
- Add the following to your file your created in `Step 3`
```ruby
module Types
  class <OBJECT_NAME>Type < BaseObject
    field :<OBJECT_FIELD>, <OBJECT_FIELD_TYPE>, null: <false || true>
  end
end
```
*NOTE: specify all the fields your object type has defined in your DB*

#### Step 5: create query resolver
- Now that your types are defined, you have to write our type resolvers which are functions that the GraphQL server uses to fetch the data for a specific query

- All GraphQL queries start from a root type called  `Query`

- Update the `app/graphql/types/query_type.rb` file
*NOTE: this file gets auto generated for you when your install graphql onto your app*
```ruby
module Types
  class QueryType < BaseObject
    field :<QUERY_NAME>, [<QUERY_OBJECT_TYPE>], null: <false || true>

    def <QUERY_NAME>
      <DB_QUERY>
      # Ex. Movie.all
    end
  end
end
```

#### Step 5: testing
- Time to test!

- Go to `localhost:3000/graphiql`

- Test our your query
```text
{
  <QUERY_NAME> {
    <OBJECT_FIELD>
    <OBJECT_FIELD>
    .
    .
    .
    <OBJECT_FIELD>
  }
}
```
