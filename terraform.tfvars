tenant_id = ""

users = {
  user1 = {
    user_principal_name = "user1@yourdomain.com"
    display_name        = "User One"
    mail_nickname       = "user1"
    password            = "P@ssw0rd!"
  }
}

groups = {
  group1 = {
    display_name = "Subscription-Admins"
  }
}

group_memberships = {
  membership1 = {
    group_key = "group1"
    user_key  = "user1"
  }
}