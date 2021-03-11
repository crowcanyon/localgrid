test_that("creates proj", {
  expect_is(as_proj(
    list(
      proj = "omerc",
      lat_0 = 37.385,
      lonc = -108.51,
      alpha = 0,
      gamma = 0,
      k_0 = 1,
      x_0 = 500,
      y_0 = 500
    )
  ),"character")
})
