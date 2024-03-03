# stockine_api_task

This Flutter task was for an opportunity at Stockine.

## What does the Project do?

The project retrieves data from the given API and displays it in the form of a list.

Data is retrieved from the `v1/market/news` endpoint of the following API - https://rapidapi.com/sparior/api/yahoo-finance15

The following data is displayed in the application:
- title
- source
- pubDate
- link (Will redirect to the website link. Further details below.)

![App displaying content]() ![App with no content]() ![App when there is some error]()

### Additional Features

- Pressing the FloatingActionButton will refresh the app content (i.e., trigger an API call)
  ![Refresh Button]()
- Pressing the 'Read More' button will redirect to the associated website link.
  ![Read More Buton]() ![Website Launch]()

## How to run the Project?

- Clone the repo to your local system.
- Replace 'API_Key' in home.dart file with your actual API key. (API key should also be within single quotes.)
```dart
response = await http.get(
        Uri.parse('https://yahoo-finance15.p.rapidapi.com/api/v1/markets/news'),
        headers: {
          'X-RapidAPI-Key': 'API_Key', //Replace with actual API key
          'X-RapidAPI-Host': 'yahoo-finance15.p.rapidapi.com'
        }
    );
  ```

### How get API key?

- Login or Sign up to [Rapid API](https://rapidapi.com/hub)
- Go to https://rapidapi.com/sparior/api/yahoo-finance15
- Navigate to the `Pricing` tab ![Tabs]()
- Subscribe to any of the plans as per your use case (API Key will not work if you are not subscribed) ![Subscription Plans]()
- Return to `Endpoints` tab
- Select the following Endpoint - `v1/market/news` ![Endpoints]()
- Copy the API key to your code

### Additional Information

In case there are changes in the URL, you may refer to the `(Node.js) Axios` sample code to get the URL, `X-RapidAPI-Key` and `X-RapidAPI-Host`.
![Sample Node.js code]()

## Packages used

- [http](https://pub.dev/packages/http) - For HTTP requests
- [url_launcher](https://pub.dev/packages/url_launcher) - To open website link in browser
