General
=====================
The code should be commented pretty thouroughly. If anything is unclear, please let me know. The goal of these examples is to make it much easier to start testing with rspec. These are not perfect tests nor are they exhaustive. You will want to write beter tests than these that covers more test cases. This is a great start though, and the other test cases should be trivial.

Testing concept examples
=====================
- Models
  - spec/models/car_spec.rb
- Controllers
  - spec/controllers/cars_controller_spec.rb
- Helpers
  - spec/helpers/cars_helper_spec.rb
- Misc classes
  - spec/extras/example_custom_class_spec.rb
- Stubs (mocha)
  - spec/controllers/cars_controller_spec.rb
- Mocks (mocha)
  - spec/helpers/cars_helper_spec.rb
- Devise
  - spec/controllers/static_pages_controller_spec.rb
    - Not using the before_action authenticate! option they have. It caused issues with the tests. Writing a filter to the same affect was easy. If you can figure out how to make the tests with before_authenticate work, please be my guest and tell me how.
- REST API
  - spec/requests/car_spec.rb

Rspec testing resources
=====================
- Official Rspec-rails Docs: 
-- https://github.com/rspec/rspec-rails/blob/master/README.md (I will not repeat what is already in this documentation.)
- A great tutorial for understanding some of the basics of testing with rspec and getting a general understanding:
-- http://everydayrails.com/2012/03/12/testing-series-intro.html (There are five parts).
- A great tutorial for understanding mocking and stubbing concepts. (Very outdated in the syntax, etc. but the concepts are very relevant)
-- http://www.calicowebdev.com/2007/05/03/testing-mocking-stubbing-and-rails-oh-my/
--- Notice though that he uses the old "should" style as opoosed to "expect().to"
- Official mocha Docs:
-- https://github.com/freerange/mocha
- Rspec mocha docs:
-- https://relishapp.com/rspec/rspec-core/v/2-14/docs/mock-framework-integration/mock-with-mocha
