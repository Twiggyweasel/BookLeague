json.club do
  json.id @club.id
  json.name @club.name
  json.founded @club.founded
  json.description @club.description
  json.admins @club.memberships.admins do |admin|
    json.admin_membership_id admin.id
    json.admin_id admin.user.id
    json.admin_name admin.user.name
  end
  json.moderators @club.memberships.moderators do |mod|
    json.mod_membership_id mod.id
    json.mod_id mod.user.id
    json.mod_name mod.user.name
  end
  json.members @club.memberships.members do |member|
    json.member_membership_id member.id
    json.member_id member.user.id
    json.member_name member.user.name
  end
end