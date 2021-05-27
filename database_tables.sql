
CREATE TABLE users(
	userid INT PRIMARY KEY NOT NULL UNIQUE,
	name TEXT NOT NULL
);


CREATE TABLE movies(
	movieid INT PRIMARY KEY NOT NULL UNIQUE,
	title TEXT NOT NULL
);


CREATE TABLE taginfo(
	tagid INT PRIMARY KEY NOT NULL UNIQUE,
	content TEXT NOT NULL
);


CREATE TABLE genres(
	genreid INT PRIMARY KEY NOT NULL UNIQUE,
	name TEXT NOT NULL
);

CREATE TABLE ratings(
	userid INT references users(userid) NOT NULL,
	movieid INT references movies(movieid) NOT NULL,
	rating NUMERIC CHECK(rating <= 5 and rating >= 0) NOT NULL,
	timestamp BIGINT DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	UNIQUE(userid, movieid)
);

CREATE TABLE tags(
	userid INT references users(userid) NOT NULL,
	movieid INT references movies(movieid) NOT NULL,
	tagid INT references taginfo(tagid) NOT NULL,
	timestamp BIGINT DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)
);

CREATE TABLE hasagenre(
	movieid INT references movies(movieid) NOT NULL,
	genreid INT references genres(genreid) NOT NULL
);