######################################################################################
# required variables
######################################################################################


######################################################################################
# optional variables
######################################################################################
variable "accounts_to_import" {
  type        = map(map(string))
  description = "map of account(s) to import to tf state"

  default = {
    "590183719401" = {
      acct_email = "dsgreene713+dummy11@gmail.com"
      acct_name = "dummy11"
    }
  }
}