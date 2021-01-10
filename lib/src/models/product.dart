enum UNIT{
  KG,
  PIECE,

}

enum CATEGORY{
  FRUITS,
  VEGETABLES,
  MEATS,
  DRIED_CHILIES,
  DAIRY,
  CANDIES
}

class Product{
  String id;
  String name;
  String description;
  double price;
  UNIT unit;
  CATEGORY category;
  List<String> images;
  String background;

  Product(this.id,this.name,this.description,this.price,
    this.unit,this.category,this.images,this.background
  );

}


// List<Product> listProducts = [
//   Product("Tomate", "Tomate de primera", 13.00, UNIT.KG, CATEGORY.VEGETABLES, 
//   ["https://res.cloudinary.com/dta9fmprx/image/upload/v1601768588/fruit%20store/verduras/tomate_wk6lni.png","",""], "0xF1AEAF"),
//   Product("Pollo", "Pollo fresco", 55.00, UNIT.KG, CATEGORY.MEATS, 
//   ["0","",""], "0xF1AEAF"),
//   Product("Queso", "Queso", 20.00, UNIT.PIECE, CATEGORY.DAIRY, 
//   ["0","",""], "0xF1AEAF"),
//   Product("Panditas", "Gominola en forma de panditas", 5.00, UNIT.PIECE, CATEGORY.CANDIES, 
//   ["0","",""], "0xF1AEAF"),
// ];


List<Product> fruitsList=[
  Product("1","Platano", "Platano Tabasco", 13.00, UNIT.KG, CATEGORY.FRUITS, 
  ["https://res.cloudinary.com/dta9fmprx/image/upload/v1601768564/fruit%20store/frutas/platano_lmvkto.png",
  "https://res.cloudinary.com/dta9fmprx/image/upload/v1608073603/fruit%20store/frutas/Banana-Transparent_ehogvk.png"
  ],
   "#F1E69C"),
  Product("2","Mandarina", "Mandarina de temporada", 10.00, UNIT.KG, CATEGORY.FRUITS, 
  ["https://res.cloudinary.com/dta9fmprx/image/upload/v1601768560/fruit%20store/frutas/mandarina_iwutrs.png"],
  "#ECBB86"),
  Product("3","Sandia", "Sandia", 10.00, UNIT.KG, CATEGORY.FRUITS, 
  ["https://res.cloudinary.com/dta9fmprx/image/upload/v1601768552/fruit%20store/frutas/sandia_zaof0t.png"], 
  "#F66B50"),
  Product("4","Naranja", "Naranja", 10.00, UNIT.KG, CATEGORY.FRUITS, 
  ["https://res.cloudinary.com/dta9fmprx/image/upload/v1601768552/fruit%20store/frutas/naranja_iwhxn9.png"], 
  "#FBE33B "),
  
];
