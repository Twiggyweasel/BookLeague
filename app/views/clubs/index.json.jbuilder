json.array! @clubs do |club|
  json.id club.id
  json.name club.name
  json.founded club.founded
  json.description club.description
  json.details do 
    json.admin_count club.memberships.admins.count
    json.member_count club.memberships.members.count
  end
end