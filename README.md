# DangApp
Another project of mobile weather appliaction but with a focus on presenting weather indexes (heat, UVI, air) and alerts. For people who want to know when the current weather is danger. Made with Flutter. 

![UI Image](https://github.com/Wojw99/dangerous-weather/blob/main/ui-image.png?raw=true)

### Functionality
- fetching weather data for the current time and user position
- fetching weather data for selected city
- view of weather index descriptions
- view of the danger index computed on the basis of the values of the other three indexes 
- switching the senior UI mode 

### Main UI feature
A progress bar has been assigned to each of the indexes. This solution is not so much to make the application look more attractive, but to contribute to a better understanding of individual indexes. The author of the repository assumed that the average user does not know enough about meteorology to remember when the index value signs a threat, and when it does not. After clicking one of the indexes, its description is displayed on a separate page with is also helpful.

### To-Do
In the event of further development of the application, more readings will be added to the UI, which are already downloaded from the API but have not been used. The option of saving weather readings is also to consider. The user could view at any time any exceptional conditions that have occurred on the previous day. 

### Summary of current app state
Writing unit tests allowed for a quick and efficient implementation of communication with the API, which was not a problem during the integration tests. Implementing the appearance of the application took the most time, and the most troublesome functionality was downloading the user's current location, which so far does not always work properly. 
