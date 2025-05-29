# produces an output value named "space_heroes"
output "breakingbadqoutes" {
  description = "API that returns why we need to cook jesse"
  value       = data.http.brokebad.response_body
}

# produces legal JSON output value named "space_heroes_json"
output "minerals_json" {
  description = "API that documents folks in space"
  value       = jsondecode(data.http.brokebad.response_body)    // note the jsondecode()
}    
