--E.B.1: 

DROP TABLE IF EXISTS projects_navers; 
DROP TABLE IF EXISTS navers; 
DROP TABLE IF EXISTS projects; 

CREATE TABLE navers (
	id SERIAL UNIQUE NOT NULL,
	name TEXT NOT NULL,
	job_role TEXT NOT NULL,
  	birthdate DATE, 
  	admission_date DATE, 
  	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );
 
 CREATE TABLE projects (
   	id SERIAL UNIQUE NOT NULL, 
    name TEXT NOT NULL, 
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 );

CREATE TABLE projects_navers ( 
	id SERIAL UNIQUE NOT NULL,   
	naver_id INTEGER NOT NULL REFERENCES navers(id),
	project_id INTEGER NOT NULL  REFERENCES projects(id)
);

---------------------------------------------------------------

--E.B.2 

TRUNCATE navers, projects, projects_navers;


--INSERINDO NAVERS
INSERT INTO navers (name, job_role, birthdate, admission_date) 
VALUES ('Jean', 'Estagiario', '2001-03-02', '2021-04-02');

INSERT INTO navers (name, job_role, birthdate, admission_date) 
VALUES ('Caio', 'Estagiario', '2000-08-18', '2018-05-02');

--INSERINDO PROJETOS
INSERT INTO projects (name) 
VALUES ('Secreto');

INSERT INTO projects (name) 
VALUES ('Ultra Secreto');

--INSERINDO NAVERS EM PROJETOS

--Jean ESTÁ EM DOIS PROJETOS
INSERT INTO projects_navers (naver_id, project_id) 
VALUES (1, 1);
INSERT INTO projects_navers (naver_id, project_id) 
VALUES (1, 2);

--Caio ESTÁ EM UM PROJETO
INSERT INTO projects_navers (naver_id, project_id) 
VALUES (2, 1);

---------------------------------------------------------------

--E.B.3

SELECT 
	* 
FROM 
	navers 
ORDER BY 
	admission_date ASC;

---------------------------------------------------------------

--E.B.4
SELECT 
	project_id, array_agg(projects_navers.naver_id) as navers_id
FROM 
	projects_navers 
GROUP BY 
	project_id;
---------------------------------------------------------------


--E.B.5

SELECT 
	project_id, COUNT(naver_id)
	
FROM 
	projects_navers

GROUP BY 
	project_id;

---------------------------------------------------------------