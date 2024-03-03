# stockine_api_task

This Flutter task was for an opportunity at Stockine.

## What does the Project do?

The project retrieves data from the given API and displays it in the form of a list.

Data is retrieved from the `v1/market/news` endpoint of the following API - https://rapidapi.com/sparior/api/yahoo-finance15

The following data is displayed in the application:
- title
- source
- pubDate
- link (Will redirect to the website link; more details below)

![App displaying content](https://github.com/SamragneeBose/stockine_api_task/assets/80643159/5d14a2f9-06c6-4d74-b368-41999bed27a4) ![App has no content](https://github.com/SamragneeBose/stockine_api_task/assets/80643159/4e8a720a-1182-43f1-a42c-bcbc00aba0bb) ![App when there is some error](https://github.com/SamragneeBose/stockine_api_task/assets/80643159/facb60d1-b0e5-4c80-985c-edf9ecc0a6ae)

### Additional Features

- Pressing the FloatingActionButton will refresh the app content (i.e., trigger an API call)

  ![Refresh Button](https://github.com/SamragneeBose/stockine_api_task/assets/80643159/c3f9f84d-29e9-47fc-b80d-f4eeaad92157)
- Pressing the 'Read More' button will redirect to the associated website link.

  ![Read More Buton](https://github.com/SamragneeBose/stockine_api_task/assets/80643159/657c190e-fc80-46aa-aaf2-01e1d6f59bde)

  ![Website Launch](https://github.com/SamragneeBose/stockine_api_task/assets/80643159/79b63ef1-f207-486d-81f7-0e1ccb66eb5f)

## How to run the Project?

- Clone the repository to your local system
- Replace 'API_Key' in home.dart file with your actual API key (API key should also be within single quotes)
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
- Navigate to the `Pricing` tab

  ![Tabs](https://github.com/SamragneeBose/stockine_api_task/assets/80643159/417678f6-2a8f-4925-b8c2-028e890f2511)
  
- Subscribe to any of the plans as per your use case (API Key will not work if you are not subscribed)

  ![Subscription Plans](https://github.com/SamragneeBose/stockine_api_task/assets/80643159/dc6bd795-e50c-47fa-8329-2f2f477a9eb4)
  
- Return to `Endpoints` tab
- Select the following Endpoint - `v1/market/news`

  ![Endpoints](https://github.com/SamragneeBose/stockine_api_task/assets/80643159/94fda5ce-b091-49b9-a379-7478490c3931)
  
- Copy the API key to your code

  ![API Key](https://github.com/SamragneeBose/stockine_api_task/assets/80643159/62ad9d4a-de97-4066-9c16-5a13c5c2fc18)

### Additional Information

In case there are changes in the URL, you may refer to the `(Node.js) Axios` sample code to get the URL, `X-RapidAPI-Key` and `X-RapidAPI-Host`.

**[Note:** This sample code snippet is _**NOT**_ required to run the code. I have added this as a reference for those who may struggle with API Integration **]**

![Sample Node.js code](https://github.com/SamragneeBose/stockine_api_task/assets/80643159/54ba5996-900f-4e3d-a6ef-590ec4fbf4cc)

## Packages used

- [http](https://pub.dev/packages/http) - For HTTP requests
- [url_launcher](https://pub.dev/packages/url_launcher) - To open website link in browser
