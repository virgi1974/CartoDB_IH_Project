# Map_Platform_Project

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

**Study case**
In this view user can see different renderings of the phenomena using torque visualizations.
**Shared maps**
In this view user can see other user´s maps, but only the ones the author shares.
You can share your maps by first logging.
**Creating a new map**
If you are a logged user you can access to "my Maps" view, in which you´ll be able to do your own searches.
You´ll go through a form with different inputs. 
At the moment all the info is in a table called "ufo"
At the moment all the info is in a table called "ufo"

[http://americanufo.herokuapp.com/shared]
