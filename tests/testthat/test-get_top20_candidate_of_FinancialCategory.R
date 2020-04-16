context("get_top20_candidate_of_FinancialCategory")

test_that("expected errors", {
  expect_warning(expect_error(get_top20_candidate_of_FinancialCategory('pac-total', 1995), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_error(get_top20_candidate_of_FinancialCategory('pac-', 1996), "Incorrect Category")
})

test_that("expected lengths", {
  categories <- c('candidate-loan', 'contribution-total', 'debts-owed', 'disbursements-total', 'end-cash', 'individual-total', 
                  'pac-total', 'receipts-total', 'refund-total')
  expect_length(get_top20_candidate_of_FinancialCategory(categories[1], 1996), 6)
 
})

