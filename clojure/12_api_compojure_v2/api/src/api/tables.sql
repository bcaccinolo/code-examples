
DROP TABLE friends;

CREATE TABLE friends 
(
    id SERIAL PRIMARY KEY,
    nom VARCHAR,
    prenom VARCHAR
);

insert into friends(nom, prenom)  values('benoit', 'coucou');

INSERT INTO friends (nom, prenom) VALUES ('benoit', 'coucou')
