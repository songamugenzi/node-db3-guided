select product.ProductName, supplier.CompanyName
from product
join supplier on product.supplierId = supplier.id

--list of products including the category name, organized by category. Show the category name first
select category.CategoryName, product.ProductName
from product
join category on product.CategoryId = category.Id
order by category.categoryName;

-- joining three tables
select c.CategoryName as Category
    , p.ProductName as Product
    , s.companyName as SuppliedBy
from product as p
join category as c 
    on p.CategoryId = c.Id
join supplier as s
    on p.supplierId = s.id
order by c.categoryName;

insert into users (username) values ('confucius'), ('aristotle'), ('kanye');

select p.contents as Quote, u.username as PostedBy 
from posts as p
join users as u on p.user_id = u.id;

-- Left Join
-- list all users and post information if available
select u.username as Writer, p.contents as Quote 
from users as u 
left join posts as p 
    on p.user_id = u.id;

--list all users that have posts, 
select distinct u.username as Writer 
from users as u 
left join posts as p 
    on p.user_id = u.id
where p.contents is not null;

--and all users that do not have posts
select u.username as Writer, p.contents as Quote 
from users as u 
left join posts as p 
    on p.user_id = u.id
where p.contents is null;

--list all users that have posts 
select distinct u.username
from users as u
inner join posts as p
    on u.id = p.user_id
order by u.username;

--and all users that do not have posts
select distinct u.username
from users as u
left join posts as p
    on u.id = p.user_id
where p.id is null
order by u.username;

select user_id, count(*) from posts
group by user_id; -- piling up coins per denomination

select denomination, sum(value) as total from coins
group by denomination; -- piling up coins per denomination



