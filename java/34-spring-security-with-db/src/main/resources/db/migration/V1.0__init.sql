create table user (
    username varchar(50) not null primary key,
    password varchar(50) not null,
    enabled boolean default 1
);

create table authorities (
    username varchar(50) not null,
    authority varchar(50) not null,
    constraint fk_authorities_users foreign key(username) references user(username)
);

create unique index ix_auth_username on authorities (username,authority);
