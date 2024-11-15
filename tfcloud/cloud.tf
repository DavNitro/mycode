terraform { 
  cloud { 
    
    organization = "DavNitro" 

    workspaces { 
      name = "my-example" 
    } 
  } 
}
