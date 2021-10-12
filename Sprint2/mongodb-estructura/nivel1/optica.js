const MongoCliente = require("mongodb").MongoClient;
const url = 'mongodb://localhost/';

MongoCliente.connect(url, function (err, db) {
    if (err) throw err;

    var dbo = db.db('optica');
    dbo.dropDatabase();

    const gafas =
        [
            {
                "gafasId": 1,
                "marca": "Rayban",
                "graduacionDer": 1,
                "graduacionIzq": 0.75,
                "tipoMontura": "flotante",
                "colorMontura": "blanco",
                "colorVidrio": "negro",
                "precio": 120,
                "fechaVenta": new Date("2021-08-01"),
                "proveedorId": 1,
                "cliente": {
                    "id": 1,
                    "nombre": "Juan",
                    "cp": "08020",
                    "telefono": 612345678,
                    "email": "juan@gmail.com",
                    "fechaRegistro": "2021-01-01",
                    "clientAmigo": "",
                },
                "empleado": {
                    "id": 1,
                    "nombre": "pepe"
                }
            },
            {
                "gafasId": 2,
                "marca": "Guess",
                "graduacionDer": 2,
                "graduacionIzq": 1.5,
                "tipoMontura": "metalica",
                "colorMontura": "negro",
                "colorVidrio": "azul",
                "precio": 100,
                "fechaVenta": new Date("2021-09-12"),
                "proveedorId": 1,
                "cliente": {
                    "id": 2,
                    "nombre": "Pedro",
                    "cp": "01010",
                    "telefono": 623456781,
                    "email": "pedro@gmail.com",
                    "fechaRegistro": "2021-03-01",
                    "clienteAmigo": 1
                },
                "empleado": {
                    "id": 2,
                    "nombre": "maria"
                }
            }
        ]

    const proveedor =
        [
            {
                "proveedorId": 1,
                "nombre": "Opticalia",
                "telefono": 612345678,
                "fax": 912345678,
                "nif": "12345678S",
                "calle": "gran via",
                "ciudad": "barcelona",
                "cp": "08020",
                "pais": "españa"
            },
            {
                "proveedorId": 2,
                "nombre": "Affelou",
                "telefono": 634567812,
                "fax": 923456781,
                "nif": "23456782S",
                "calle": "av meridian",
                "ciudad": "barcelona",
                "cp": "08030",
                "pais": "españa"
            }
        ]

    dbo.collection("gafas").insertMany(gafas, function (err, res) {
        if (err) throw err;
    })

    dbo.collection("proveedor").insertMany(proveedor, function (err, res) {
        if (err) throw err;
        console.log('documentos insertados ok')
        db.close();
    });
});
