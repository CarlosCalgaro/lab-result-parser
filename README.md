# Parser

Simple parser that parses lab test results from multiple laboratories. Consists of a format conversor, that converts the results provided by the laboratory to mapped float values, a class LaboratoryTestResult to model the results of the tests and the parser, who reads the file and responds to mapped_results method.

# Dependencies

Install dependencies:
```
    bundle install
```

# Usage
Require parser.rb file in your project to start using it.

```Ruby
    file_path = "/path/to/file.txt"
    parser = Parser.new(file_path)
    parser.mapped_results # => [...]
```

# Tests
Tests were written using the rspec framework, you can run them by executing the following command:

```
    rspec 
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/parser/blob/master/CODE_OF_CONDUCT.md).


## License

The software is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Parser project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/parser/blob/master/CODE_OF_CONDUCT.md).
