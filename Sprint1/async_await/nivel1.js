"use strict";

let employees = [
  {
    id: 1,
    name: "Linux Trovalds",
  },
  {
    id: 2,
    name: "Bill Gates",
  },
  {
    id: 3,
    name: "Jeff Bezos",
  },
];

let salaries = [
  {
    id: 1,
    salary: 4000,
  },
  {
    id: 2,
    salary: 1000,
  },
  {
    id: 3,
    salary: 2000,
  },
];
/**
 *  Exercici 1
Donats els objectes Employees i Salaries, creu una arrow function getEmpleado que retorni una Promise efectuant la cerca en l'objecte pel seu id.
Creu una altra arrow function getSalario que rebi com a paràmetre un objecte Employee i retorni el seu salari.
 */

const getEmpleado = (id) => {
  return new Promise((resolve, reject) => {
    let retornaEmpleado;

    if ((retornaEmpleado = employees.find((empleado) => empleado.id === id))) {
      resolve(retornaEmpleado);
    } else {
      reject("Empleado no encontrado");
    }
  });
};

const getSalario = (empleadoObj) => {
  let retorna;
  return new Promise((resolve, reject) => {
    if ((retorna = salaries.find((empleado) => empleado.id === empleadoObj.id))) {
      resolve(retorna.salary);
    } else {
      reject("Empleado no encontrado");
    }
  });
};

getEmpleado(1)
  .then((res) => {
    console.log(res.name);
    getSalario(res).then(console.log);
  })
  .catch(console.error);

/**
 * - Exercici 2
Creu una funció asíncrona que, rebent un id d'empleat, imprimeixi per pantalla el nom de l'empleat i el seu salari
 */

async function empleado(id) {
  try {
    let empObj = await getEmpleado(id);
    console.log("atraves de sync away: ", empObj.name);

    let salario = await getSalario(empObj);
    console.log("atraves de sync away: ", salario);
  } catch (err) {
    console.error("atraves de sync away: ", err);
  }
}

empleado(1);
