# DubizzleClassified
This repo holds the code for Dubizzle & Bayut test App

## About App

This is a simple app which basically fetches item list from the given API, and parses the JSON response into models which are `Codable` structs & ultimately displaying it in a tableview. Every item is a product item which displays image, product name, product price. On tapping any of the item, user can get into the detail screen.

## Note for the Reviewers

**Covered all required activities**
- [x] Retrived data from the given endpoint 
- [x] Designed Homepage with product listings
- [x] Designed product details screen in Objective C **(Covered bonus point)**
- [x] Good UI approach - _(MVVM pattern followed)
- [x] Unit tests using XCTest
- [x] Simple UI tests using XCUITest
- [x] Implement an image caching mechanism **(Covered bonus point)**
- [x] Clear README.md that explains how the code and the test can be run

## Running the app

Once you have clonned the app to your local system, you can fire-up the app by opening _DubizzleClassified.xcodeproj_ file.


## universal support

- App also runs on iPad


## Unit Testing 

> _Since the app has no complex business logic to test as such, I've written a simple test case to cover the Asynchronous API call made to fetch the data from the server._

## Running Test cases

> Please run entire test cases by pressing Commad+U

**UI Test cases**
- Displaying the tableview and tap each cell and go back to home screen
