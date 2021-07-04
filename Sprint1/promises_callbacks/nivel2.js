//Nivel 2 - Ejercicio 1

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
  return new Promise((resolve, reject) => {
    if ((retorna = employees.find((empleado) => empleado.id === id))) {
      resolve(retorna);
    } else {
      reject("Empleado no encontrado");
    }
  });
};

/*getEmpleado(9)
  .then((res) => {
    return res;
  })
  .catch((error) => {
    console.error(error);
  });
  */

//Nivel 2 - Ejercicio 27
/**
 * Creu una altra arrow function getSalario que rebi com a paràmetre un objecte employee
 * i retorni el seu salari
 */

const getSalario = (empleadoObj) => {
  return new Promise((resolve, reject) => {
    if (
      (retorna = salaries.find((empleado) => empleado.id === empleadoObj.id))
    ) {
      resolve(retorna.salary);
    } else {
      reject("Empleado no encontrado");
    }
  });
};

/*getSalario(employees[1])
  .then((res) => console.log(res))
  .catch((error) => console.error(error));
*/
//Nivel 2 - Ejercicio 3
/**
 * Invoqui la primera Promise getEmpleado i posteriorment getSalario,
 *  niant l'execució de les dues promises.
 */

getEmpleado(3)
  .then((res) => {
    console.log(res.name);
    getSalario(res)
    .then((res) => {
      console.log(res);
    });
  })
  .catch((error) => {
    console.error(error);
  });
