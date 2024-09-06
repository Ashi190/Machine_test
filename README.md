# Machine Test

## Description

The **Machine Test** project is a Flutter application designed to demonstrate various features and functionalities. This application includes multiple screens and is built using the Flutter framework. It aims to showcase your proficiency in developing cross-platform mobile applications with a custom UI layout, various interactive elements, and API integration.

## Features

- **Multi-Screen Navigation**: Navigate between different screens with smooth transitions.
- **Custom UI Layout**: Includes a logo placeholder, toggle buttons, and an input field.
- **User Interaction**: Features a phone number input field and a 'Send Code' button for user interaction.
- **Back Navigation**: Implemented an AppBar with a back button that navigates back to the previous screen.
- **API Integration**: Utilizes the `http` package to make network requests and interact with APIs.

## API Integration

The app interacts with an API to handle data operations. For testing purposes, ensure the API endpoint and any required keys or tokens are configured correctly in the app.

### API Endpoint

- **Base URL**: `https://api.example.com/`
- **Endpoint Example**: `/sendCode`
  
### Usage

- **POST** `/sendCode`
  - **Request Body**:
    ```json
    {
      "phoneNumber": "1234567890"
    }
    ```
  - **Response**:
    ```json
    {
      "status": "success",
      "message": "Code sent successfully."
    }
    ```

## Installation

To set up and run this project locally, follow these steps:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Ashi190/Machine_test.git
