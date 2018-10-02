library(earthEngineGrabR)

context("Download functionalities")


  test_file <- "test-download_mean.geojson"
  #test_file <- "test_SRTM.geojson"
  test_dir <- get_temp_path()
  
  

# googledrive::drive_download("test_SRTM.geojson", path = file.path(test_dir, "test_SRTM.geojson"), overwrite = T) 


test_that("Test that download_data downloads test file from google drive", {
  skip_test_if_not_possible()
  activate_environments()

  # googledrive::drive_find(test_file, verbose = F)

  download_data(test_file,
    clear = F)
  
  test <- grep(test_file, list.files(test_dir)) 
  expect_is(test, "integer")
  #unlink(test_dir, recursive = T)

})


test_that("Test that import_data import data to R", {
  skip_test_if_not_possible()
  activate_environments()
  
  data <- import_data(productList = test_file, 
              clean = T)
  
  expect_is(data, "data.frame")
  # googledrive::drive_find(test_file, verbose = F)
  # unlink(test_dir, recursive = T)
  
})




#   
# 
#   list.files(test_dir)
#   unlink(test_dir, T)
#   