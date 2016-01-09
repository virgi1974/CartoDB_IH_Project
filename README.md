# Map_Platform_Project

*App deployed in Heroku*
http://americanufo.herokuapp.com/shared

##Web App based on customized maps.  

**Some History**

*The data set used to create maps and different visualizations in this app has been the records corresponding to the reported UFO sigthings in USA.
Though initially I wanted to create a single page app with the UFO data + data related to the missing people records for USA, so a user could find the spatial interferences of both phenomena, in this first approach I portray the info of the first set.
In the future I`ll acomplish the second part and do the intgration of both data sets.
In the meantime I didn´t want to leave just few cool renderizations, so I developed the skeleton of the website thinking of letting users to store their own searches-maps, be able to see other users maps and leave comments.*


**Development process**

1. ```Scrapping data through several web pages in order to get .csv files 
with all the info related to UFO sigthings in USA since info recorded.```

2.  ```Import the .csv files to CartoDb platform.```

3.  ```Construction of the web app, by using the CartoDb JS Api`s to query the tables 
so I was able to customize my data visualization through Sql.```

###Using the app

**Study case**

```In this view user can see different renderings of the phenomena using torque visualizations.```

**Shared maps**

```In this view user can see other user´s maps, but only the ones the author shares.
You can share your maps by first logging.```

**Creating a new map**

```If you are a logged user you can get access to "my Maps" tab, in which you´ll be able to do your own searches.
You´ll go through a form with different inputs.```

  - *username*  ```If you are a CartoDB user you could get data from you own datasets through your username.
  By default if this field is empty the form will use my own user CartoDB username to access my ufo dataset through the their javascript Api```
  - *table_name*  ```At the moment all the info is in a table called "ufo", to be typed in the field.```
  - *city*  ```You might find matches for your search by a city from USA filling the city name in this field.```
  - *state*  ```you might find matches for your search by state from USA filling the field with the first 2 capitalized letters of the state.```
  - *description*  ```A description for your map is requested before saving it.```
  - *dates*  ```If you want to see the matches for your search for a specific date you fill one of the 2 datafields.
  If you want to find results between 2 specific dates, you must use both given form datefields.```
  - *shared*  ``You as a user of the platform are given the option of sharing maps, so anybody wether user of the platform or not could see you shared maps. By default the private feature is also given.```

```You can now get a preview of your map or store it.```


###Behind the scene Technology / Frameworks
```The platform`s backend is done with Ruby on Rails```

```The platform`s frontend is done with Bootstrap```

```The management of the authentication is done with Device Ruby Gem```

```The queries to the CartoDB datasets are done by using their Javascript Api in 2 ways:```

  - ```getting the parameters for the queries from forms.```
  - ```getting the parameters for the queries from the user maps stored parameters in the app dataBase and then reconstructed the sql in the front. ```
