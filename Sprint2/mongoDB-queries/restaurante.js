//1
show collections

//2
db.restaurante.find({},{restaurant_id:1, name:1, borough:1, cuisine:1}).pretty()   

//3
db.restaurante.find({},{_id:0,restaurant_id:1, name:1, borough:1, cuisine:1}).pretty()

//4
db.restaurante.find({},{_id:0, address:{zipcode:1}, restaurant_id:1, name:1, borough:1, cuisine:1}).pretty()

//5
> db.restaurante.find({"borough":"Bronx"}).pretty()

//6
db.restaurante.find({"borough":"Bronx"}).limit(5).pretty()

//7
db.restaurante.find({"borough":"Bronx"}).skip(5).limit(5).pretty

//8
> db.restaurante.find({"grades.score":{$gt:90}},{ name:1}).pretty()

//9
db.restaurante.find({grades:{$elemMatch:{score:{$gt:80, $lt:100}}}},{name:1,grades:1}).pretty()

//10
db.restaurante.find({"address.coord.0":{$lt:-95.754168}},{name:1, address:1}).pretty()

//11
db.restaurante.find({$and:[{cuisine:{$ne:"American "}},{"grades.score":{$gt:70}},{"address.coord.0":{$gt:-65.754168}}]}, {name:1,address:1,cuisine:1,grades:1}).pretty()   

//12
db.restaurante.find({$nor:[{cuisine:"American "},{"grades.score":{$lt:70}},{"address.coord.0":{$lt:-65.754168}}]}, {name:1,address:1,cuisine:1,grades:1}).pretty()

//13
db.restaurante.find({$and:[{cuisine:{$ne:"American "}},{"grades.grade":"A"},{borough:{$ne:"Brooklyn"}}]}, {cuisine:1,borough:1,grades:1}).pretty()

//14
db.restaurante.find({name:{$regex:/^Wil/}}, {_id:0,restaurant_id:1,name:1,borough:1,cuisine:1}).pretty()
 
//15
db.restaurante.find({name:{$regex:/ces$/}}, {_id:0,restaurant_id:1,name:1,borough:1,cuisine:1}).pretty()

//16
db.restaurante.find({name:{$regex:/Reg/}}, {_id:0,restaurant_id:1,name:1,borough:1,cuisine:1}).pretty()  

//17
db.restaurante.find({$and:[{borough:"Bronx"},{cuisine:{$in:["American ", "Chinese"]}}]},{borough:1,name:1,cuisine:1}).pretty()

//18
db.restaurante.find({borough:{$in:["Staten Island","Queens","Bronxor","Brooklyn"]}},{restaurant_id:1,name:1,borough:1,cuisine:1}).pretty()

//19
db.restaurante.find({borough:{$nin:["Staten Island","Queens","Bronxor","Brooklyn"]}},{restaurant_id:1,name:1,borough:1,cuisine:1}).pretty()

//20
db.restaurante.find({"grades.score":{$lt:10}},{_id:0, restaurant_id:1,name:1,borough:1,cuisine:1 }).pretty()

//21 
db.restaurante.find({$or:[{cuisine:{$nin:["American ", "Chinese"]}},{name:{$regex:/^Wil/}}]},{restaurant_id:1,name:1,borough:1,cuisine:1}).pretty().count()

//22
db.restaurante.find({grades:{date:ISODate("2014-08-11T00:00:00Z"),grade:"A",score:11}},{_id:0,restaurant_id:1,name:1,grades:1}).pretty()

//23
db.restaurante.find({grades:{date:ISODate("2014-08-11T00:00:00Z"),grade:"A",score:9}},{_id:0,restaurant_id:1,name:1,grades:1}).pretty()

//24
db.restaurante.find({"address.coord.1":{$gt:42,$lt:52}},{_id:0,restaurante_id:1,name:1,address:1}).pretty()

//25
db.restaurante.find().sort({name:1}).pretty() 

//26
db.restaurante.find().sort({name:-1}).pretty()

//27
db.restaurante.find().sort({cuisine:1,borough:-1}).pretty().count()

//28
db.restaurante.find({"address.street":{$exists:true}},{_id:0,name:1,"address.street":1}).pretty()

//29
db.restaurante.find({"address.coord":{$size:2}},{_id:0,name:1,"address.coord":1}).pretty()

//30
db.restaurante.find({"grades.score":{$mod:[7,0]}},{_id:0,restaurante_id:1,name:1,grades:1}).pretty()

//31
db.restaurante.find({name:{$regex:/mon/}},{_id:0,name:1,borough:1,"address.coord":1,cuisine:1}).pretty()

//32
db.restaurante.find({name:{$regex:/^Mad/}},{_id:0,name:1,borough:1,"address.coord":1,cuisine:1}).pretty()
