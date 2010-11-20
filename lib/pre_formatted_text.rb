MAIN_PAGE_CODE_SAMPLE = <<HERE
Feature "Define a feature" do
  in_order_to "write acceptance tests with less code"
  as_a "developer"
  i_want_to "use a simple internal DSL"

  Scenario "Demonstrate how coulda works" do
    Given "a pending prereq" do
      # Precondition code could go here
    end 

    When "something happens" do
      # Behavior to test invoked here
    end

    Then "expect something else" do
      # Assertions on result of behavior go here
    end
  end
end
HERE

MAIN_PAGE_PLAIN_TEXT_SAMPLE = <<HERE
Feature: Define a feature
In order to write acceptance tests with less code
As a developer
I want to use a simple internal DSL

Scenario: Demonstrate how coulda works
  Given a pending prereq
  When something happens
  Then expect something else
HERE

TEST_HELPER = <<HERE
    require 'rubygems'
require 'coulda'
include Coulda
HERE

PENDING_FEATURE = <<HERE
    require 'test_helper'

Feature "A pending feature"
HERE

PENDING_FEATURE_WITH_PURPOSE = <<HERE
    require 'test_helper'

Feature "A pending feature" do
  in_order_to "accomplish something else"
  as_a "user"
  i_want_to "do something"
end
HERE

PENDING_SCENARIO = <<HERE
    require 'test_helper'

Feature "A pending feature" do
  in_order_to "accomplsih something else"
  as_a "user"
  i_want_to "do something"

  Scenario "that is pending"
end
HERE

SCENARIO = <<HERE
    require 'test_helper'

Feature "Painfully obvious" do
  in_order_to "demonstrate a simple test"
  as_a "coulda developer"
  i_want_to "provide a straight-forward scenario"

  Scenario "Describing something obvious" do
    Given "something without a value" do
      @no_value = nil
    end

    When "I give it a value" do
      @no_value = true
    end

    Then "it should have a value" do
      assert(@no_value)
    end
  end
end
HERE

REUSE_VIA_METHODS = <<HERE
    require 'test_helper'

Feature "Painfully obvious" do
  in_order_to "demonstrate a simple test"
  as_a "coulda developer"
  i_want_to "provide a straight-forward scenario"

  def something_without_a_value
    @no_value = nil
  end

  Scenario "Describing something obvious" do
    Given "something without a value" do
      something_without_a_value
    end

    When "I give it a value" do
      @no_value = true
    end

    Then "it should have a value" do
      assert(@no_value)
    end
  end
end
HERE

REUSE_VIA_MIXIN = <<HERE
    require 'test_helper'
require 'coulda'
include Coulda

module MyMacros
  def given_something_without_a_value
    Given "something without a value" do
      @no_value = nil
    end
  end

  def assert_variable_has_a_value
    assert(@no_value)
  end
end

Feature "Painfully obvious" do
  extend MyMacros

  in_order_to "demonstrate a simple test"
  as_a "coulda developer"
  i_want_to "provide a straight-forward scenario"


  Scenario "Describing something obvious" do
    given_something_without_a_value

    When "I give it a value" do
      @no_value = true
    end

    Then "it should have a value" do
      assert_variable_has_a_value
    end
  end
end
HERE

RAILS_UNIT_TEST = <<HERE
    Coulda.default_test_case_class = ActiveSupport::TestCase
...
Feature "A Rails feature" do
  ...
end
HERE
