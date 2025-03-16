terraform init
terraform plan
terraform apply <- DANGER!! Will apply changes on the Azure tenant

# Creating groups and users
Creates users from users.csv file and assignes groups listed in the file
Passwords are auto-generated and added to the outputs

# Retrieving Auto-Generated Passwords
After running terraform apply, you can retrieve the auto-generated passwords using the terraform output command:

## terraform output user_passwords

Example output:
{
  "Alice@webbats.com" = "abc123!XYZ"
  "Ismoil@webbats.com" = "def456!UVW"
  "John@webbats.com" = "ghi789!RST"
  "Piotr@webbats.com" = "jkl012!OPQ"
}