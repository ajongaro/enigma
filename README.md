# Basic Ruby Project Template

This template has a basic Gemfile with three dependencies already installed and initialized:
- Rubocop, a static code analyzer
- RSpec, a robust testing framework
- SimpleCov, a testing coverage analyzer
- Pry-byebug, a debugger


## Instructions
1. When creating a new Github repo, select this ruby_project repo in the template dropdown menu, and then clone your project locally as usual.
2. Run `bundle install` in the directory to install the gems in `Gemfile`
3. Add the below code to the top of `spec_helper.rb` if it isn't there already
```
require 'simplecov'
SimpleCov.start
```

## Notes
- SimpleCov has already been added to the existing spec_helper.rb file, but double check it after running `bundle install`
- Add any additional gems you'd like into the Gemfile before running `bundle install`
- Please add suggestions on how to improve this starter repo by adding issues or comments.

Happy coding!
