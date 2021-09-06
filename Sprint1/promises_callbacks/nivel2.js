"use strict";
//Ejercicio 1

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
 * Donats els objectes employees i salaries, creu una arrow function getEmpleado que retorni una Promise 
   efectuant la cerca en l'objecte pel seu id.
 */

const getEmpleado = (id) => {
  let retornaEmpleado;
  return new Promise((resolve, reject) => {    
    if (retornaEmpleado = employees.find((empleado) => empleado.id === id)) {
      //console.log("Empleado encontrado");
      resolve(retornaEmpleado);
     
    } else {
      reject("Empleado no encontrado");
    }
  });
};

getEmpleado(1)
  .then(res => console.log('ejercicio1', res.name))
  .catch((error) => {
    console.error('ejercicio1', error);
  });
  


//Ejercicio 2
/**
 * Creu una altra arrow function getSalario que rebi com a paràmetre un objecte employee
 * i retorni el seu salari
 */

const getSalario = (empleadoObj) => {
  let retornaSalario;
  return new Promise((resolve, reject) => {
    if (retornaSalario = salaries.find((empleado) => empleado.id === empleadoObj.id)) {
      {
        resolve(retornaSalario.salary);
      }
    } else {
      reject("No hay datos");
    }
  });
};

getSalario(employees[1])
  .then((res) => console.log('ejercicio2', res))
  .catch((error) => console.error('ejercicio2', error));



//Ejercicio 3
/**
 * Invoqui la primera Promise getEmpleado i posteriorment getSalario,
 *  niant l'execució de les dues promises.
 */

getEmpleado(3)
  .then((res) => {
    console.log('ejercicio3', res.name);
    getSalario(res)
    .then((res) => {
      console.log('ejercicio3', res);
    });
  })
  .catch((error) => {
    console.error('ejercicio3', error);
  });
