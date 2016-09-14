![](https://travis-ci.org/piedoom/tumblr-crystal.svg)

# tumblr

The unofficial Tumblr client for Crystal

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  tumblr:
    github: piedoom/tumblr-crystal
```


## Usage


```crystal
require "tumblr"
```

Currently, only the unauthenticated V1 API is beginning to be implemented.
You can get a blog's feed like so:

```cr
a = Tumblr::Simple::Client.get_all("staff")
puts a.inspect
```

## Contributing

1. Fork it ( https://github.com/piedoom/tumblr-crystal/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [doomy](https://github.com/[your-github-name]) - creator, maintainer
