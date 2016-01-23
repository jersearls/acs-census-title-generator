require "test_helper"

require "tally"

class TestTally < TallyTest
  def test_abbreviate
    assert_equal Tally.abbreviate("total_including_population"), "tot_incl_pop"
    assert_equal Tally.abbreviate("total_fun_including"), "tot_fun_incl"
    assert_equal Tally.abbreviate("totality"), "totality"
  end
end
