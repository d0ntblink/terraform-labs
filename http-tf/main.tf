# The following example shows how to issue an HTTP GET request supplying
# an optional request header.
data "http" "brokebad" {
  url = "https://api.breakingbadquotes.xyz/v1/quotes/10"      // API to send HTTP GET to

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

