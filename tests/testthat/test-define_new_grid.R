test_that("define_new_grid works", {
  expect_is(define_new_grid(
    pt_0_geo = c(-108.51, 37.385),
    pt_0_grid = c(500, 500),
    name = "Great New Grid"
  ),
  "crs")
})
