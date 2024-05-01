
# I want to create 2 users in AWS IAM

resource "aws_iam_user" "tf-users" {
    # Set of strings
    for_each = toset(["siva", "maha"])
    # each.key and each.value
    name = each.key
    # name = each.value
}
