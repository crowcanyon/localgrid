test_that("translations work", {
  expect_type(
    as_wgs84(
      x = c(720446.8, 4140492.5),
      crs = 6341
    ),
    "double"
  )

  expect_identical(c(-108.51, 37.385), as_wgs84(c(-108.51, 37.385), 4326))
})
