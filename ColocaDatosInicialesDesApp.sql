USE controlpeliculas;
DELETE FROM actor;
DELETE FROM pelicula;
DELETE FROM usuario;
DELETE FROM genero_pelicula;
DELETE FROM reparto;
DELETE FROM bitacora_prestamo;

INSERT INTO actor VALUES (2,'Mark Hamill','1951-09-25','Concord, California, USA',NULL,NULL,'http://cf2.imgobject.com/t/p/original/bZbOmlwhOGVowB3MDqZyvfT9ZQT.jpg');
INSERT INTO actor VALUES (3,'Harrison Ford','1942-07-13','Chicago, Illinois, United States',NULL,NULL,'http://cf2.imgobject.com/t/p/original/53SsFcrPeijCrvv7TcRA4JHoKcj.jpg');
INSERT INTO actor VALUES (4,'Carrie Fisher','1956-10-21','Beverly Hills, Los Angeles, California, USA','2016-12-27',NULL,'http://cf2.imgobject.com/t/p/original/3YkbP3W8rxXqEq0hUqCFrs8qINX.jpg');
INSERT INTO actor VALUES (521,'Michael J. Fox','1961-06-09','Edmonton, AB Canada',NULL,'http://www.michaeljfox.org/','http://cf2.imgobject.com/t/p/original/lYD7RaJqi2aHza5YixWjlprhlSR.jpg');
INSERT INTO actor VALUES (1062,'Christopher Lloyd','1938-10-22','Stamford, Connecticut, USA',NULL,NULL,'http://cf2.imgobject.com/t/p/original/3SLhqK97wVQGt3A9v2VqXSvLl1z.jpg');
INSERT INTO actor VALUES (1063,'Lea Thompson','1961-05-31','Rochester, Minnesota, U.S.',NULL,NULL,'http://cf2.imgobject.com/t/p/original/jk4kSRSq3cRksxCDCNLZp1IGCVd.jpg');
INSERT INTO actor VALUES (1064,'Crispin Glover','1964-04-20','New York City, New York, USA',NULL,'http://www.crispinglover.com/','http://cf2.imgobject.com/t/p/original/pfUfSMEg6D5nnCRKvWJyBP7wN44.jpg');
INSERT INTO actor VALUES (1230,'John Goodman','1952-06-20','Affton, Missouri, U.S.',NULL,NULL,'http://cf2.imgobject.com/t/p/original/bpvJP5X2jKWgLpvoJRYa0IMn0g1.jpg');
INSERT INTO actor VALUES (7904,'Billy Crystal','1948-03-14','Long Beach, Long Island, New York, USA',NULL,NULL,'http://cf2.imgobject.com/t/p/original/22PBSROMN6GmD7uxHpTNb0Unftt.jpg');
INSERT INTO actor VALUES (7905,'Mary Gibbs','1996-01-01',NULL,NULL,NULL,'http://cf2.imgobject.com/t/p/original/cxnX6F7ZmfXmMKcdLuRXa7GKvGz.jpg');

INSERT INTO pelicula VALUES(11,'Star Wars: Episode IV - A New Hope','1977-05-25',121,'http://www.starwars.com','http://cf2.imgobject.com/t/p/original/tvSlBzAdRE29bZe5yYWrJ2ds137.jpg','2013-08-02');
INSERT INTO pelicula VALUES(105,'Back to the Future','1985-07-03',116,'http://www.bttfmovie.com/','http://cf2.imgobject.com/t/p/original/pTpxQB1N0waaSc3OSn0e9oc8kx9.jpg','2013-07-30');
INSERT INTO pelicula VALUES(585,'Monsters, Inc.','2001-11-02',92,'http://www.pixar.com/featurefilms/inc','http://cf2.imgobject.com/t/p/original/9uJf7GzX40P027Cugge5ebYvskA.jpg','2013-08-02');

INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(11,28);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(11,12);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(11,14);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(11,878);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(11,10751);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(105,12);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(105,35);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(105,878);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(105,10751);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(585,16);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(585,14);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(585,878);
INSERT INTO genero_pelicula(id_pelicula,id_genero) VALUES(585,10751);

INSERT INTO reparto(id_pelicula,id_actor,papel) VALUES(11,2,'Luke Skywalker');
INSERT INTO reparto(id_pelicula,id_actor,papel) VALUES(11,3,'Han Solo');
INSERT INTO reparto(id_pelicula,id_actor,papel) VALUES(11,4,'Leia Organa');
INSERT INTO reparto(id_pelicula,id_actor,papel) VALUES(105,521,'Marty McFly');
INSERT INTO reparto(id_pelicula,id_actor,papel) VALUES(105,1062,'Dr. Emmett Brown');
INSERT INTO reparto(id_pelicula,id_actor,papel) VALUES(105,1063,'Lorraine Baines McFly');
INSERT INTO reparto(id_pelicula,id_actor,papel) VALUES(105,1064,'George McFly');
INSERT INTO reparto(id_pelicula,id_actor,papel) VALUES(585,1230,'Sullivan');
INSERT INTO reparto(id_pelicula,id_actor,papel) VALUES(585,7904,'Mike');
INSERT INTO reparto(id_pelicula,id_actor,papel) VALUES(585,7905,'Mary Gibbs');

INSERT INTO usuario VALUES('SORR710721S9A','Roberto','Solís','Robles','rsolis@uaz.edu.mx','4921234567','Av. Ramón Lopez Velarde 801','Centro',32056,32,98000);
INSERT INTO usuario VALUES('VICJ681204X8C','Juan Luis','Villa','Cisneros','jlvilla@uaz.edu.mx','4927654321','Av. Las Flores 675','Agronomos',32056,32,98060);
INSERT INTO usuario VALUES('MARU980315','Uriel','Martínez','Rodríguez','umtzrod@hotmail.com','4928887772','Av. Colegio Militar 211','Centro',32017,32,98600);

INSERT INTO bitacora_prestamo(RFC,id_pelicula,fecha_prestamo,fecha_retorno) VALUES('SORR710721S9A',585,'2019-08-15','2019-08-17');
INSERT INTO bitacora_prestamo(RFC,id_pelicula,fecha_prestamo,fecha_retorno) VALUES('MARU980315',105,'2019-08-20','2019-08-24');
INSERT INTO bitacora_prestamo(RFC,id_pelicula,fecha_prestamo,fecha_retorno) VALUES('VICJ681204X8C',11,'2019-08-21',NULL);
INSERT INTO bitacora_prestamo(RFC,id_pelicula,fecha_prestamo,fecha_retorno) VALUES('SORR710721S9A',585,'2019-09-02',NULL);

