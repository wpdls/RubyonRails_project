require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success

    # the next four: want to verify that the response contains our layout, our product 
    # information, and our number formatting

    #looks for an element named 'a' that's contained in a nav element that 
    # has the class side_nav. This test verifies that a minimum of four such elements
    # are present
    assert_select 'nav.side_nav a', minimum: 4 

    # next three verifies that all of our products are displayed
    # first one verifies that there are 3 li element
    assert_select 'main ul.catalog li', 3
    # verifies that ther's an h2 element with the title of the Ruby book
    assert_select 'h2', 'Programming Ruby 1.9'
    # verifies that the price is formatted correctly
    assert_select '.price', /\$[,\d]+\.\d\d/ #value that contains $ followed by any numnber(but at least one), commas, or digits; followed by a decimal point; followed by two digits
    # **** these assertions are based on the test data that we put inside our FIXTURES
    #*** IF THE PARAMETER IS A NUMBER = QUANTITY. STRING = EXPECTED RESULT
  end

end
