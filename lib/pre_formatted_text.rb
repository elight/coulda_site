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
