# Masak App

[<img src="https://play.google.com/intl/en_us/badges/images/generic/en-play-badge.png" alt="Get it on Google Play" height=
"80">](https://play.google.com/store/apps/details?id=id.hecolab.masak.app)

## Features

- Recipe by Category
- Search Recipe
- Detail Recipe

## 📸 Demo Android
<pre>
<img src="assets/screenshot/Splash-Page.png" width="200"> <img src="assets/screenshot/Home-Page.png" width="200"> <img src="assets/screenshot/Category-Recipe-Page.png" width="200"> <img src="assets/screenshot/Recipes-By-Category-Page.png" width="200"> <img src="assets/screenshot/Detail-Recipe-Page.png" width="200">
</pre>

## 📁 Direktori
    # Root Project
    .
    ├── app                    # Setup service locator.
    |
    ├── core                   # Logic File/class.
    │   └── model              # Model class.
    │   │   └── request        # Model for request http.
    │   │   └── response       # Model for json response.
    │   └── network            # Functional to send and request data to http.
    |
    ├── service                # Class like shared preference, http request, etc.
    |
    └── UI                     # UI File/class.
        ├── pages              # Page File/class.
        │   └── binding        # Class for binding controller, service to page.
        │   └── controller     # Class logic for page.        
        │   └── view           # Class UI for page.        
        |
        ├── shared             # Custom function, extension, etc which can be used repeatedly on each method.
        └── widgets            # Custom widget which can be used repeatedly.

## 📁 Git commit format
* Add
Use when add new feature
* Update
Use when update feature
* Fix
Use when fix some bug/error
* Remove
Use when remove some feature
#### Example :
    Add: Home page
    Fix: Layout not responsive
    Remove: Shadow on item list 
