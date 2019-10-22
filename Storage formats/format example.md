# Exemples de formats de fichier

## CSV

### CSV EN style - Date,Température,Humidité
2019-10-01,15.5,80
2019-10-02,12.1,50
2019-10-03,8.0,10

### CSV FR style - Année,Mois,Jour,Température,Humidité
2019;10;1;15,1;80
2019;10;2;12,1;50
2019;10;3;8,0;10

## Largeur fixe

à noter 3e ligne : le "0" de remplissage devant le "8"

201910011580
201910021250
201910030810


## JSON

cf. https://csvjson.com/csv2json

### JSON array

[
  {
    "Date": "2019-10-01",
    "Température": 15,
    "Humidité": 80
  },
  {
    "Date": "2019-10-02",
    "Température": 12,
    "Humidité": 50
  },
  {
    "Date": "2019-10-03",
    "Température": 8,
    "Humidité": 10
  }
]

### JSON hash

{
  "2019-10-01": {
    "Température": 15,
    "Humidité": 80
  },
  "2019-10-02": {
    "Température": 12,
    "Humidité": 50
  },
  "2019-10-03": {
    "Température": 8,
    "Humidité": 10
  }
}
