context("get_committee_electioneering_communications")

test_that("testing errors", {
  expect_error(get_committee_electioneering_communications(2016, 30002034), 'FEC_ID has to be character')
  expect_warning(expect_error(get_committee_electioneering_communications(1995, 'C30002034'), 'Incorrect cycle'))
  expect_warning(expect_error(get_committee_electioneering_communications(16, 'C30002034'), 'Incorrect cycle'), 'Cycle should be four-digit year')
})


