# switchrole code here
# change pool-id with your cognito-pool-id
# change region with cognito-pool-region

aws cognito-idp list-users --user-pool-id pool-id --region region |
jq -r '.Users | .[] | .Username' |
while read user; do
  aws cognito-idp admin-delete-user --user-pool-id pool-id --region region --username $user
  echo "$user deleted"
done
