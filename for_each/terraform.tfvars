rg_name=["rg-stg","rg-dev", "rg-prod", "rg-stg"]
rg_location = ["East US", "West US", "Central US"]

rg_map = {
  "East US" = "rg-stg"
  "West US" = "rg-dev"
  "Central US" = "rg-prod"
}

rg_map3={
    "rg1" ={
        "rg_name" = {
            name = "rg_hello1"
            location = "East US"       
        }
        
    }
    "rg2" ={
        "rg_name" = {
            name = "rg_hello2"
            location = "West US"       
        }
        
    }
}

rg_map2 = {
  "stg1" = {
    name     = "stgtitu"
    resource_group_name = "rg_stg1"
    location = "East US"
    ART     = "LRS"
    AT  = "Standard"
  }
  "stg2" = {
    name     = "stgliku"
    location = "West US"
     resource_group_name = "rg_stg1"
    location = "East US"
    ART     = "GRS"
    AT  = "Standard"
  }
}