
#1. 
Select COUNT(distinct ad.user_id) as added_users, COUNT(distinct case
    WHEN (l.position_to - l.position_from) * 1.0 / ab.duration > 0.1 
    THEN l.user_id 
    END) AS listened_10_percent
FROM audiobooks ab
left join audio_cards ad on ab.uuid = ad.audiobook_uuid
left join listenings l on ab.uuid = l.audiobook_uuid
where ab.title = 'Coraline';


#2 
Select l.os_name, ab.title, count(distinct l.user_id) as users_count,
sum(l.position_to - l.position_from) / 3600.0 as total_hours
from listenings l
join audiobooks ab on ab.uuid = l.audiobook_uuid
where l.is_test = 0
group by l.os_name, ab.title
order by users_count desc;

#3
Select ab.title, count(distinct l.user_id) as user_count 
from audiobooks ab
join listenings l
on l.audiobook_uuid = ab.uuid
Group by ab.title
order by user_count
Limit 1;

#4
Select ab.title, count(distinct l.user_id) as completed_users
from audiobooks ab
join listenings l on l.audiobook_uuid = ab.uuid
where l.position_to >= ab.duration
group by ab.title
order by completed_users desc
limit 1;