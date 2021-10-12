const MongoCliente = require("mongodb").MongoClient;
const url = 'mongodb://localhost/';

MongoCliente.connect(url, function (err, db) {
    if (err) throw err;

    var dbo = db.db('pizzeria');
    dbo.dropDatabase();

    const cliente =
        [
            {
                "clienteId": 1,
                "nombre": "Juan",
                "apellido": "Izquierdo",
                "telefono": 612345678,
                "direccion": "av aragon",
                "cp": "08020",
                "localidad": {
                    "nombre": "Barcelona",
                    "provincia": "Barcelona"
                }
            },
            {
                "clienteId": 2,
                "nombre": "Manuel",
                "apellido": "Palacios",
                "telefono": 623456781,
                "direccion": "av gran via",
                "cp": "01010",
                "localidad": {
                    "nombre": "Madrid",
                    "provincia": "Madrid"
                }
            }
        ]

    const tienda =
        [
            {
                "tiendaId": 1,
                "direccion": "av mallorca",
                "cp": 08020,
                "localidad": {
                    "nombre": "Barcelona",
                    "provincia": "Barcelona"
                },
                "empleado":
                    [
                        {
                            "empleadoId": 1,
                            "nombre": "pepe",
                            "apellido": "mendez",
                            "nif": "12345678S",
                            "telefono": 687654321,
                            "puesto": "cocinero"

                        },
                        {
                            "empleadoId": 2,
                            "nombre": "maria",
                            "apellido": "castro",
                            "nif": "34567821D",
                            "telefono": 654321678,
                            "puesto": "repartidor"

                        }
                    ]

            },
            {
                "tiendaId": 2,
                "direccion": "av mallorca",
                "cp": 08020,
                "localidad": {
                    "nombre": "Barcelona",
                    "provincia": "Barcelona"
                },
                "empleado":
                    [
                        {
                            "empleadoId": 3,
                            "nombre": "luis",
                            "apellido": "palacios",
                            "nif": "45678123F",
                            "telefono": 665432187,
                            "puesto": "cocinero"

                        },
                        {
                            "empleadoId": 4,
                            "nombre": "carlos",
                            "apellido": "lopez",
                            "nif": "67821345F",
                            "telefono": 632167845,
                            "puesto": "repartidor"

                        }
                    ]

            }
        ]

    const producto =
        [

            {
                "productoId": 1,
                "tipo": "pizza",
                "descripcion": "pizza hawaiana",
                "imagen": "img",
                "precio": 10,
                "categoria": "americana"
            },
            {
                "productoId": 2,
                "tipo": "bebida",
                "descripcion": "cocacola",
                "imagen": "img1",
                "precio": 2,
                "categoria": ""
            },
            {
                "productoId": 3,
                "tipo": "hamburguesa",
                "descripcion": "clasica",
                "imagen": "img2",
                "precio": 7,
                "categoria": ""
            }
        ]

    const pedido = [
        {
            "pedidoId": 1,
            "fechaPedido": new Date("2021-08-12"),
            "productoId": 1,
            "precio": 12,
            "cantidad": 1,
            "tiendaId": 1,
            "clienteId": 1,
            "delivery": "no",
            "fechaHoraEntrega": "",
            "empleadoId": 1
        },
        {
            "pedidoId": 2,
            "fechaPedido": new Date("2021-08-12"),
            "productoId": 2,
            "precio": 4,
            "cantidad": 2,
            "tiendaId": 2,
            "clienteId": 2,
            "delivery": "si",
            "fechaHoraEntrega": new Date("2021-09-21T18:00:00"),
            "empleadoId": 2
        }
    ]





    dbo.collection("cliente").insertMany(cliente, function (err, res) {
        if (err) throw err;
    })

    dbo.collection("tienda").insertMany(tienda, function (err, res) {
        if (err) throw err;
    });

    dbo.collection("producto").insertMany(producto, function (err, res) {
        if (err) throw err;
    })

    dbo.collection("pedido").insertMany(pedido, function (err, res) {
        if (err) throw err;
        console.log('documentos insertados ok')
        db.close();
    });
});
