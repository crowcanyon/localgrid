test_that("define_legacy_grid works", {
  expect_is(define_legacy_grid(
    pt_0_geo = c(-108.51, 37.385),
    pt_0_grid = c(500, 500),
    pt_1_geo = c(-108.511, 37.384),
    pt_1_grid = c(360, 380),
    name = "Screwy Legacy Grid"
  ),
  "crs")
})
