terraform { 
  cloud { 
    
    organization = "0wl-red" 

    workspaces { 
      name = "terraform-lab" 
    } 
  } 
}
