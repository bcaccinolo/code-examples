-- User user/pass
INSERT INTO users (username, password, enabled) values ("user", "$2a$11$daNfEzv/LybQ6lHIJbf2mOiboISKh/kr3zMETq6MEftg8Ddmt07sy", 1);
INSERT INTO authorities (username, authority) values ("user", "ROLE_USER");
