const MongoCliente = require("mongodb").MongoClient;
const url = 'mongodb://localhost/';

MongoCliente.connect(url, function (err, db) {
    if (err) throw err;

    var dbo = db.db('spotify');
    dbo.dropDatabase();

    const usuario = [
        {
            "usuarioId": 1,
            "premium": "si",
            "email": "user1@gmail.com",
            "password": "",
            "username": "user1",
            "fechaNacimiento": new Date("1990-01-01"),
            "sexo": "masculino",
            "pais": "España",
            "cp": 08020,
            "cancionFavorita": "",
            "albunFavorito": "",
            "artistaFavorito": "",
            "subscripcion": 
            {
                "susbcripcionId": 1,
                "fechaInicio": new Date("2021-01-01"),
                "fechaRenovacion": new Date("2022-01-01"),
                "pago": 
                {
                    "fechaPago": new Date("2021-01-01"),
                    "tarjetaCredito": "",
                    "paypalUsuario": "juan1"
                }
            }
        },
        {
            "usuarioId": 2,
            "premium": "si",
            "email": "user2@gmail.com",
            "password": "",
            "username": "user2",
            "fechaNacimiento": new Date("1980-10-11"),
            "sexo": "femenino",
            "pais": "España",
            "cp": 03010,
            "cancionFavorita": "",
            "albunFavorito": "",
            "artistaFavorito": "",
            "subscripcion": 
            {
                "susbcripcionId": 2,
                "fechaInicio": new Date("2021-04-01"),
                "fechaRenovacion": new Date("2022-04-01"),
                "pago": 
                {
                    "fechaPago": new Date("2021-04-01"),
                    "tarjetaCredito": "1233444657676",
                    "paypalUsuario": ""
                }
            }
        }    
    ]

    const cancion = [
        {
            "cancionId": 1,
            "titulo": "c1",
            "duracion": "3:20:00",
            "reproducciones": 10,
            "albun":
            {
                "albunId": 1,
                "titulo": "albun1",
                "publicacion": "",
                "fechaPublicacion": new Date("1993-12-23"),
                "imagenPortada": "im1.jpg",
            },
            "artista":
            {
                "artistaId": 1,
                "nombre": "arista1",
                "imagen": "f1.jpg",
                "artistaRelacionado": ""
            }
        },
        {
            "cancionId": 2,
            "titulo": "c2",
            "duracion": "4:20:00",
            "reproducciones": 4,
            "albun":
            {
                "albunId": 2,
                "titulo": "albun2",
                "publicacion": "",
                "fechaPublicacion": new Date("1999-02-12"),
                "imagenPortada": "imm.jpg",
            },
            "artista":
            {
                "artistaId": 2,
                "nombre": "arista2",
                "imagen": "f2.jpg",
                "artistaRelacionado": ""
            }
        }
    ]

    const playlist = [
        {
            "playlistId": 1,
            "titulo": "titulo1",
            "numeroCanciones": 3,
            "estado": "activa",
            "fechaCracion": new Date(2021-09-12),
            "fechaBorrado": "",
            "usuarioId": 1,
            "cancionId": [1, 2, 3],
            "compartida":{}
        },
        {
            "playlistId": 1,
            "titulo": "titulo1",
            "numeroCanciones": 3,
            "estado": "activa",
            "fechaCracion": new Date(2021-09-12),
            "fechaBorrado": "",
            "usuarioId": 1,
            "cancionId": [1, 2, 3],
            "compartida":
            {
                "fecha":new Date("2021-09-23"),
                "usuarioAgregaCanciones": 2,
                "cancionId": 1
            }
        }
    ]
            

    dbo.collection("usuario").insertMany(usuario, function (err, res) {
        if (err) throw err;
        //console.log('documento insertado ok');
    });
    
    dbo.collection("cancion").insertMany(cancion, function (err, res) {
        if (err) throw err;
        //console.log('documento insertado ok');
    })

    dbo.collection("playlist").insertMany(playlist, function (err, res) {
        if (err) throw err;
        console.log('documentos insertados ok')
        db.close();
    });
});
