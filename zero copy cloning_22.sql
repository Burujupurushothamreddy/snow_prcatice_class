create or replace database madanapalli

create or replace table madanapalli.public.movie_titles_copy
clone PURUSHOTHAM.PUBLIC.EMPLOYEES

select * from madanapalli.public.movie_titles_copy

\\cloning data into temporary to parmanent
create temporary table movie_title_temp
clone madanapalli.public.movie_titles_copy

select * from madanapalli.public.movie_titles_copy

create table msdhoni
clone madanapalli.public.movie_title_temp

\\we cannot clone data from temporary to parmanent;
  we can clone parmanent to temporary or temporary to temporary

create schema madanapalli.public_copy
clone madanapalli.public

drop schema madanapalli.public_copy

create database madanapalli_copy
clone madanapalli

swaping tables
-----------------------------------------
delete from MADANAPALLI_COPY.PUBLIC.MOVIE_TITLES_COPY where employee_id >=120

select * from MADANAPALLI_COPY.PUBLIC.MOVIE_TITLES_COPY-----20records

select * from MADANAPALLI.PUBLIC.MOVIE_TITLES_COPY----40records

alter table MADANAPALLI_COPY.PUBLIC.MOVIE_TITLES_COPY
swap with MADANAPALLI.PUBLIC.MOVIE_TITLES_COPY

_________________________