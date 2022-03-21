# Swift UI and Combine Framework Assignment 
## Login Screen: 
1. EmailID -> Text field -> Email validation -> Mandatory field 
1. Password -> secure field -> password validation -> Mandatory field  
1. Login -> Button 
1. Registration -> Button  

## User registration screen: 
1. Name -> Alpha numeric keyboard (mandatory) 
1. Gender -> Segment control (male/Female/Others) (Optional) 
1. EmailId -> Email keyboard (mandatory) 
1. Phone number -> Number keyboard with validation of minimum 10 numbers (mandatory) 
1. DOB -> Date picker (mandatory) 
1. Country -> Normal picker with some static data (Optional) 
1. Password -> Normal keyboard with validation of minimum 8 char (mandatory) 
1. Intro -> Text view with normal key board (Optional) 
1. Submit -> Button -> Do all the validation -> Store the details in any object/local store 
1. Reset -> Button -> All the data in each field will be cleared 

## Home screen: 
Need to use following API: 
https://jsonplaceholder.typicode.com/photos  

1. Initially user can see Album title with thumbnail image on each cell. 
1. On tap of each cell, it will show rest of album details with Photo (Need to implement expand and collapse on tap of each cell) 
1. Use List view, Table view cell and lazy loading for design the screen. Show loader while calling API 

<HR>

### Important points for the assignment: 
1. Use SwiftUI for all UI design 
1. Use MVVM design pattern 
1. Use Combine framework for all reactive and MVVM pattern 
1. Please do all the validation on each screen and show an alert text with appropriate message 
1. For storing user details, you may use anything which is comfortable for implementation 

### Functional flow: 
1. User land on Login screen when App lunch 
1. User need to register itself by going to registration screen 
1. After registration complete, user can able to login with submitted user emailId and password 
1. After successfully login, user land on Home screen 
