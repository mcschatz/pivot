require 'omniauth'
require 'ostruct'

RSpec.configure do |config|
  
  config.backtrace_exclusion_patterns = []
  config.backtrace_exclusion_patterns << /.*\/gems\/.*/
    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
      Rails.application.load_seed # loading seeds
    end

    config.after(:suite) do
      DatabaseCleaner.clean
    end

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OpenStruct.new({
      'provider' => 'twitter',
      'uid' => '123545',
      'info' => OpenStruct.new({
        'name' => "Test User"
      }),
      'credentials' => OpenStruct.new({
        'token' => '123abc',
        'secret' => 'secret123'
      })
    })

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:identity] = OpenStruct.new({
      'uid' => '123545',
      'provider' => 'identity',
      'info' => OpenStruct.new({
        'name' => "user name"
      })
    })

    def login_admin!
      #creates user as admin
      visit signin_or_signup_path
      click_on "twitter-link"
      click_on "Logout"
      user = User.last
      user.role = "admin"
      user.save
      #then signs in again now that they are admin
      visit signin_or_signup_path
      click_on "twitter-link"
    end

    def admin_logout!
      click_on "Logout"
      user = User.last
      user.role = "user"
      user.save
    end

    def login_user!
      visit signin_or_signup_path
      click_on "twitter-link"
    end

    def fill_cart
      visit '/signin_or_signup'
      click_link_or_button("twitter-link")
      visit '/items'
      click_link_or_button('pencil')
      click_link_or_button("Add to Cart")
      visit '/cart'
    end

    def address
    OpenStruct.new(full_name: "Abraham Lincoln",
      add_1: "123 Main St.",
      add_2: "Unit 7",
      city: "Springfield",
      state: "IL",
      zip: "12345"
    )
    end

    def create_order
      visit '/signin_or_signup'
      click_link_or_button("twitter-link")
      visit '/items'
      click_link_or_button('pencil')
      click_link_or_button("Add to Cart")
      visit '/cart'
      click_link_or_button("Checkout")
      fill_in 'Full Name', with: address.full_name
      fill_in 'Address First Line', with: address.add_1
      fill_in 'Address Second Line', with: address.add_2
      fill_in 'City', with: address.city
      fill_in 'State', with: address.state
      fill_in 'Zip', with: address.zip
      click_link_or_button("Proceed to Payment")
      click_link_or_button("Place Order")
    end

  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://myronmars.to/n/dev-blog/2014/05/notable-changes-in-rspec-3#new__config_option_to_disable_rspeccore_monkey_patching
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end
