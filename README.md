# World Clock+Weather

`Well this not too fancy stuff and just a basic app(yeah does use database or something, still learning that) that does exactly what the name says it shows the time and and weather of various cities throughout the world, the aim of this app was to like have an app that does what it says without much complexity and a good UI/UX(hopefully i have achieved this)    **heres a little secret, the app background changes according to the time**.`

## APK+Screenshots
+ The link for the apk file and the some screenshots of the app can be found here [Link](https://drive.google.com/drive/folders/1hLsH910utFAyXKvFFu1Bx8KID00DR6aQ?usp=sharing)

## API's USED
`This app uses 2 api's currently, one for the time(this one works super slow sometimes) and the other one for the weather, and i know there are better api's out there and there are those which provide both time and weather with just one api call but all of them were paid sooo you know......(alr i will say it, i am broke)`
+ This is the time api i used  [The API](http://worldtimeapi.org/)
+ This is the weather api i used  [The API](https://openweathermap.org/current)
+ This is a free api i found which provides both the weather and the time but the free version only supports "http" requests and not "https", so flutter did not support it  [The API](https://weatherstack.com/)

### A little more about the app
`The main core structure of the app consists of 4 pages`
+ Page 1 => `This is the loading page that pops up as soon as you start the app, needed this page so that could use this as a buffer while i grab data from the api.`
+ Page 2 => `This is home page which comes up after the loading is done, this is like the main page which shows the main info(the time,name and weather).`
+ Page 3 => `This is the locations page which contains the list of of various major cities throughout the world whose time and weather you can see, the page has a list view so you can scroll down to see more countries.`
+ Page 4 => `This is the wait page which acts as the buffer similar to the laoding page but this comes into play after you select location from the Page 3(locations page) so that you just don't keep sitting on the locations page thinking something broke lol.`

