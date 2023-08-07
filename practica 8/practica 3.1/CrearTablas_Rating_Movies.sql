
/* Crear los esquemas de las tablas */

create table Movie
( mID    	number(3),
  title  	varchar2(30),
  year   	number(4),
  director  varchar2(30),
constraint pk_Movie primary key (mID)
);

create table Reviewer
( rID    	number(3),
  name  	varchar2(30) NOT NULL,
constraint pk_Reviewer primary key (rID)
);

create table Rating
( rID    	number(3),
  mID    	number(3),
  stars  	number(3),
  ratingDate   	date,
constraint pk_Rating primary key (rID,mID,ratingDate),
constraint fk_Rev foreign key (rID) references Reviewer on delete cascade,
constraint fk_Mov foreign key (mID) references Movie on delete cascade,
constraint ch_stars check (stars in(1,2,3,4,5))
);