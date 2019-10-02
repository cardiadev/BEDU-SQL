db.getCollection("users").insert([
  {
    name: "Carlos",
    lastname: "Diaz",
    cellphone: "3316309019",
    email: "hola@cjdiaz.com",
    password: "abcd123",
    hobbies: ["Cinema", "Bike Riding", "Traveling", "Reading", "Gaming"],
    address: {
      street: "Av. Siempre Viva",
      extNumber: 419,
      postalCode: 44750,
      city: "Guadalajara"
    }
  },
  {
    name: "Axel",
    lastname: "Licea",
    cellphone: "4485678234",
    email: "alicea@hotmail.com",
    password: "qwerty123",
    hobbies: ["Fishing", "Singing", "Study", "Reading", "Gaming"],
    address: {
      street: "Av. Chapultepec",
      extNumber: 4489,
      postalCode: 44860,
      city: "Guadalajara"
    }
  },
  {
    name: "Valeria",
    lastname: "Mojica",
    cellphone: "3221572293",
    email: "vmojicota@gmail.com",
    password: "valemoji2345",
    address: {
      street: "Abedules",
      extNumber: 785,
      postalCode: 44600,
      city: "Guadalajara"
    }
  },
  {
    name: "Roberto",
    lastname: "Gomez",
    cellphone: "3345637829",
    email: "robertobb@gmail.com",
    password: "robertbebe"
  },
  {
    name: "Sofia",
    company: "HP"
  }
]);

db.getCollection("users").insert({
  name: "Roberto",
  lastname: "Gomez",
  age: 30
});

// Buscar dentro de Address -> Ciudad que coincida con 'Guadalajara'
db.getCollection("users").find({ "address.city": "Guadalajara" });

// Buscar algo especifico en algun campo
db.getCollection("users").find({
  "address.city": "Guadalajara",
  "address.street": { $regex: "Av" }
});

// Expresion Regular con $regex
db.getCollection("users").find({ email: { $regex: /\w+\@\w+\.\w+/ } });

// Buscar e insertar si cumplen con cierta busqueda
db.getCollection("users").updateMany(
  { name: { $regex: "e" } },
  {
    $set: {
      age: 26
    }
  }
);

// Borrar campos que solo contentengan
db.getCollection("users").find({ hobbies: { $in: ["Gaming"] } });
db.getCollection("users").delete({ hobbies: { $in: ["Gaming"] } });
