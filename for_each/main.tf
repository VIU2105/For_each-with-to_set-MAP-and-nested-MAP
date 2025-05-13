

#first scienorio using for each with set of strings and if we are providing the value in map format in .tfvars file
resource "azurerm_resource_group" "resource_group" {
 for_each = var.rg_name #as it is list not set to convert the the list into set 
 name = "rg_viu"
 location = "East US"
 #name =each.value## it will take the value from the list and with same error
}
#Error : The given "for_each" argument value is unsuitable: the "for_each" argument must be a map, or set of strings, 
#and you have provided a value of type tuple

#=-----------------------------------------------------------------------------------------------------------

#second scienorio to create with same name(rg_viu) and location without providing the value from list or set
#set of strings
# rg_name=["rg-stg","rg-dev", "rg-prod","rg-stg"] - input passed in .tfvars file
# resource "azurerm_resource_group" "resource_group" {
#  for_each = toset(var.rg_name)
#  name = "rg_viu"
#  location = "East US"

# }

#=-----------------------------------------------------------------------------------------------------------

# #third scienorio to create with different name and same location so it is set/list of strings is passed so only 
# we give that value in argument 
# resource "azurerm_resource_group" "resource_group" {
#  for_each = toset(var.rg_name) # Here it is getting the value only from .tfvars file
#  #name = each.value
#  name= each.key
#  location = "East US"

# }
#specific instance of a resource = azurerm_resource_group.resource_group["rg-stg"]
#if we refer in for_each set of strings is having object with two value which each.value ,each.key 
# and both are same in this case

#now we are having the limitation that only single argument pass through for_each and another argument is hardcoded

#=-----------------------------------------------------------------------------------------------------------
# #fourth scienorio to create with different name and but same location with variable

# resource "azurerm_resource_group" "resource_group" {
#  for_each = toset(var.rg_name) # Here it is getting the value only from .tfvars file
#  name = each.value
# #  name= each.key
# #  count = length(var.rg_location)# we can't use the count and for_each together
#  location = var.rg_location[0]
# }

#=-----------------------------------------------------------------------------------------------------------
# #fifth Scienorio to using the for_each loop with map but not provided the value to arguments from map
# resource "azurerm_resource_group" "rg_names" {
#     for_each ={
#         "rg_map1" = "East US"
#         "rg_map2" = "West US"
#         "rg_map3" = "Central US"
#     }
#     name = "rg12"
#     location = "East US"
  
# }
#Three time loop will run as key value is 3 and value of rg will be same as "rg12" and location will be "East US"
# azurerm_resource_group.rg_names["rg_map1"]

#============================================================================================

#Sixth Scienorio to create with different name and but different location with variable
# MAP come into picture

# resource "azurerm_resource_group" "resource_group" {
#     for_each ={
#         "rg_map1" = "East US" #  Key is always string and value can be anything
#         "rg_map2" = "West US"
#         "rg_map3" = "Central US"
#         50 = "West US" 
#     }
#     name = each.key
#     location = each.value
# }

# resource "azurerm_resource_group" "resource_group" {
#     for_each ={
#         "East US" = "rg_map1"  #  Key is always string and value can be anything
#         "West US" ="rg_map2" 
#         "Central US" ="rg_map3" 
#         # 50 = "rg_map4"
#     }
#     name = each.value
#     location = each.key
# }

# MAP come into the picture 
# resource "azurerm_resource_group" "resource_group" {
#     for_each = var.rg_map
#     name = each.value
#     location = each.key
# }

#Nested Map (MAP inside MAP) - 2D map with storage account

# resource "azurerm_storage_account" "storage_acc" {
#     for_each = var.rg_map2
#     name = each.value.name
#     resource_group_name = each.value.resource_group_name
#     location = each.value.location
#     account_replication_type = each.value.ART 
#     account_tier = each.value.AT
# }

#3 Three MAP sab se jada complex hai  Nested Map (MAP inside MAP then also MAP) - 2D map

# resource "azurerm_resource_group" "resource_group" {
#     for_each = var.rg_map3
#     name = each.value.rg_name.name
#     location = each.value.rg_name.location
# }