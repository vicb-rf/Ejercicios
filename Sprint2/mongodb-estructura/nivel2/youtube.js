const MongoCliente = require("mongodb").MongoClient;
const url = 'mongodb://localhost/';

MongoCliente.connect(url, function (err, db) {
    if (err) throw err;

    var dbo = db.db('youtube');
    dbo.dropDatabase();

    const video = [
        {
            "videoId": 1,
            "titulo": "video1",
            "descripcion": "describe video",
            "tamañoMb": 100,
            "nombreArchivo": "v1.mp4",
            "duracion": "5:21:0",
            "thumbail": "t1.png",
            "reproduciones": 5,
            "estado": "publico",
            "numeroLikes": 2,
            "numeroDisklike": 5,
            "fechaCreacion": new Date("2021-08-12"),
            "usuarioId": 1,
            "etiqueta": "futbol",
            "likes":
                [
                    {
                        "usuarioId": 2,
                        "fechaHora": new Date("2021-08-22T12:00:00")
                    },
                    {
                        "usuarioId": 3,
                        "fechaHora": new Date("2021-08-24")
                    }

                ],
            "comentario": [
                {
                    "texto": "mal video",
                    "fechaHora": new Date("2021-09-22T16:00:00"),
                    "usuarioId": 2,
                    "like":
                    {
                        "like:": "si",
                        "usuarioId": 1,
                        "fechaHora": new Date("2021-09-22T16:00:00")
                    }
                }
            ]



        },
        {
            "videoId": 2,
            "titulo": "video2",
            "descripcion": "video",
            "tamañoMb": 140,
            "nombreArchivo": "v2.mp4",
            "duracion": "5:01:0",
            "thumbail": "t2.png",
            "reproduciones": 10,
            "estado": "privado",
            "numeroLikes": 1,
            "numeroDisklike": 0,
            "fechaCreacion": new Date("2021-09-01"),
            "usuarioId": 2,
            "etiqueta": "f1",
            "likes": [],
            "comentario": []
        }
    ]

    const usuario =
        [
            {
                "usuarioId": 1,
                "canal": "ch1",
                "email": "user1@gmail.com",
                "password": "xxxxxx",
                "username": "user1",
                "fechaNacimiento": new Date("1977-09-06"),
                "sexo": "Masculino",
                "pais": "España",
                "cp": 08020,
                "canalSubscrito": 2
            },
            {
                "usuarioId": 2,
                "canal": "ch2",
                "email": "user2@gmail.com",
                "password": "xxxxxx",
                "username": "user2",
                "fechaNacimiento": new Date("1980-01-26"),
                "sexo": "Femenino",
                "pais": "España",
                "cp": 01010,
                "canalSubscrito": 1
            }
        ]

    const playlist =
        [
            {
                "playlistId": 1,
                "nombre": "pl1",
                "fechaCreacion": new Date("2021-08-12"),
                "estado": "publico",
                "usuarioId": 1,
                "videoId": 1,
                "compartido": "si",
                "videosAgregados":[
                    {
                        "usuarioId": 1,
                        "videoId": 2
                    }
                ]
            },
            {
                "playlistId": 2,
                "nombre": "pl2",
                "fechaCreacion": new Date("2021-08-21"),
                "estado": "publico",
                "usuarioId": 2,
                "videoId": 2,
                "compartido": "no",
                "videosAgregados":[]
            }
        ]


    dbo.collection("video").insertMany(video, function (err, res) {
        if (err) throw err;
       // console.log('documento insertado ok')
        db.close();
    });

    dbo.collection("usuario").insertMany(usuario, function (err, res) {
        if (err) throw err;
        //console.log('documento insertado ok');
    })

    dbo.collection("playlist").insertMany(playlist, function (err, res) {
        if (err) throw err;
        console.log('documentos insertados ok')
        db.close();
    });
});
