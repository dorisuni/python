create table goods(
	 gid char(8) not null primary key,
	 title varchar(300) not null,
	 price int default 0,
     maker varchar(200),
     image varchar(300),
     regDate datetime default now()
);

desc goods;

select * from goods;

delete from goods where gid="b35d81de";

create table users(
	 uid varchar(20) not null primary key,
	 upass varchar(200) not null,
     uname varchar(20) not null,
     phone varchar(100),
     address1 varchar(300),
     address2 varchar(300),
     regDate datetime default now(),
     photo varchar(200)
);

create table purchase(
	pid char(13) not null primary key,
	uid varchar(20) not null,
	raddress1 varchar(300),
    raddress2 varchar(300),
    rphone varchar(100),
    purDate datetime default now(),
    status int default 0,
    purSum int default 0,
    foreign key (uid) references users(uid)
);

create table orders(
	oid int auto_increment primary key,
    pid char(13) not null,
	gid char(8) not null,
    price int default 0,
    qnt int default 0,
    foreign key (pid) references purchase(pid),
    foreign key (gid) references goods(gid)
);

select * from orders;
select * from purchase;

insert into orders (pid, gid) value("3f079c13-4db8","0f2f9973");

update users set uname=?, phone=?, photo=?, address1=?, address2=? where uid=aa;

insert into users(uid, upass, uname, phone, address1, address2) 
values('ps', '123', '강보라', '010-1111-1111', '인천서구한빛마을로12', '40동203호');
insert into users(uid, upass, uname, phone, address1, address2) 
values('asd', '1234', '강하늘', '010-2222-2222', '인천한나루로513번길', '21동1203호');

create view view_purchase as
select p.*, u.uname
from purchase p, users u
where p.uid=u.uid;

select * from view_purchase where uid = "asd";

select * from users;

select count(*) from purchase;

select * from orders where pid ='de460b8a-108e';

create view view_orders as
select o.*, title, image
from orders o, goods g
where o.gid = g.gid;

select * from view_orders;

alter table users add role int default 2;

select * from users;

insert into users(uid, upass, uname, role) values("admin", "pass", "관리자", 1);

create table reviews(
 rid int auto_increment primary key not null,
 uid varchar(20) not null,
 gid char(8) not null,
 revDate datetime default now(),
 content text,
 foreign key (uid) references users (uid),
 foreign key (gid) references goods (gid)
);

drop table reviews;

select * from reviews;

create view view_reviews as
select r.*, uname, photo
from reviews r, users u
where u.uid=r.uid;

select * from view_reviews;

create table favorite(
 uid varchar(20) not null,
 gid char(8) not null,
 regDate datetime default now(),
 primary key(gid, uid),
  foreign key (uid) references users (uid),
 foreign key (gid) references goods (gid)
);

insert into favorite(gid, uid) values('a27dca6a','asd');

select count(*) ucnt from favorite where gid='a27dca6a' and uid='asd';




create view view_goods as
select *,
(select count(*) from reviews where gid=g.gid) rcnt,
(select count(*) from favorite where gid=g.gid) fcnt
from goods g
order by regDate desc;