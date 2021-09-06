#1
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo='alumno' ORDER BY apellido1, apellido2;

#2
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL;

#3
SELECT * FROM persona WHERE fecha_nacimiento LIKE '1999%';

#4
SELECT * FROM persona WHERE telefono IS NULL AND nif LIKE '%k'; 

#5
SELECT * FROM asignatura WHERE cuatrimestre='1' AND curso='3' AND id_grado='7';

#6
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento FROM persona p INNER JOIN profesor pf  ON p.id=pf.id_profesor INNER JOIN departamento d ON pf.id_departamento=d.id ORDER BY p.apellido1, p.nombre;

#7
SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM persona p INNER JOIN alumno_se_matricula_asignatura al ON p.id=al.id_alumno INNER JOIN asignatura a ON a.id=al.id_asignatura INNER JOIN curso_escolar c ON c.id=al.id_alumno WHERE p.nif='26902806M';

#8
SELECT DISTINCT dp.nombre FROM asignatura a INNER JOIN grado d ON a.id_grado=d.id INNER JOIN profesor p ON a.id_profesor=p.id_profesor INNER JOIN departamento dp ON p.id_departamento=dp.id WHERE d.nombre='Grado en Ingeniería Informática (Plan 2015)';

#9
SELECT DISTINCT p.* FROM alumno_se_matricula_asignatura asm  INNER JOIN persona p ON asm.id_alumno=p.id INNER JOIN curso_escolar c ON asm.id_curso_escolar=c.id WHERE tipo='alumno' AND c.anyo_inicio='2018'AND c.anyo_fin='2019';

#########clàusules LEFT JOIN i RIGHT JOIN.#########
#1
SELECT d.nombre, pe.apellido1, pe.apellido2, pe.nombre FROM departamento d LEFT JOIN profesor p ON d.id=p.id_departamento INNER JOIN persona pe ON p.id_profesor=pe.id ORDER BY d.nombre, pe.apellido1, PE.apellido2, pe.nombre;

#2
SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre AS Departamento FROM profesor p INNER JOIN persona pe ON p.id_profesor=pe.id LEFT JOIN departamento d ON p.id_departamento=d.id WHERE p.id_departamento IS NULL;

#3
SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre AS Departamento FROM profesor p INNER JOIN persona pe ON p.id_profesor=pe.id RIGHT JOIN departamento d ON p.id_departamento=d.id WHERE p.id_departamento IS NULL;

#4
SELECT pe.apellido1, pe.apellido2, pe.nombre, a.nombre AS Asignatura FROM profesor p INNER JOIN persona pe ON p.id_profesor=pe.id LEFT JOIN asignatura a ON p.id_profesor=a.id_profesor WHERE a.id IS NULL;

#5
SELECT pe.apellido1, pe.apellido2, pe.nombre, a.nombre AS Asignatura FROM profesor p INNER JOIN persona pe ON p.id_profesor=pe.id RIGHT JOIN asignatura a ON p.id_profesor=a.id_profesor WHERE a.id_profesor IS NULL;

#6
SELECT d.nombre AS Departamento, am.id_curso_escolar As CursoEscolar FROM departamento d LEFT JOIN alumno_se_matricula_asignatura am ON d.id=am.id_curso_escolar WHERE am.id_curso_escolar IS NULL; 



#########Consultes resum#########
#1
SELECT COUNT(*) FROM persona WHERE tipo='alumno';

#2
SELECT COUNT(tipo='alumno') FROM persona WHERE YEAR(fecha_nacimiento)=1999;

#3
SELECT d.nombre As Departamento, COUNT(*) AS NumeroDeProfesores FROM profesor p INNER JOIN departamento d ON p.id_departamento=d.id GROUP BY id_departamento ORDER BY COUNT(*);

#4
SELECT d.nombre, count(id_profesor) FROM departamento d LEFT JOIN profesor p ON d.id=p.id_departamento GROUP BY d.nombre;

#5
SELECT g.nombre As Grado, COUNT(a.nombre) AS NumeroAsignaturas FROM grado g LEFT JOIN asignatura a ON g.id=a.id_grado GROUP BY g.nombre ORDER BY COUNT(a.nombre) DESC; 

#6
SELECT g.nombre As Grado, COUNT(a.nombre) AS NumeroAsignaturas FROM grado g LEFT JOIN asignatura a ON g.id=a.id_grado GROUP BY g.nombre HAVING COUNT(a.nombre)>40; 

#7
SELECT g.nombre AS Grado, a.tipo, SUM(a.creditos) FROM grado g LEFT JOIN asignatura a ON a.id_grado=g.id GROUP BY g.nombre, a.tipo;

#8
SELECT ce.anyo_inicio, COUNT(am.id_alumno) AS AlumnosMatriculados FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura am ON ce.id=am.id_curso_escolar GROUP BY ce.id;

#9
SELECT a.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.id_profesor) AS NumeroAsignaturas FROM profesor p LEFT JOIN asignatura a ON p.id_profesor=a.id_profesor INNER JOIN persona pe ON p.id_profesor=pe.id GROUP BY p.id_profesor;

#10
SELECT *, MIN(fecha_nacimiento) FROM persona WHERE tipo='alumno';

#11
SELECT pe.nombre, pe.apellido1, pe.apellido2, d.nombre AS Departamento, a.nombre AS Asignatura FROM profesor p INNER JOIN persona pe ON p.id_profesor=pe.id INNER JOIN departamento d ON p.id_departamento=d.id LEFT JOIN asignatura a ON p.id_profesor=a.id_profesor WHERE a.id_profesor IS NULL;







