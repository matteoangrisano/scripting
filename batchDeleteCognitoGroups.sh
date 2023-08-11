# switchrole code here
# change pool-id with your cognito-pool-id
# change region with cognito-pool-region

aws cognito-idp list-groups --user-pool-id pool-id --region region |
jq -r '.Groups | .[] | .GroupName' |
while read group; do
  aws cognito-idp delete-group --user-pool-id pool-id --region region --group-name $group
  echo "$group deleted"
done
