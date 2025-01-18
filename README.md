Flutter Appwrite Task
Overview
This project demonstrates a Flutter application integrated with Appwrite to fetch and display data. It includes setup for backend services, a structured database, and a responsive UI to showcase the data fetched from Appwrite.
Features
- Backend Integration: Appwrite is used for data storage and retrieval.
- Database Management: Includes a database with a collection and attributes for structured data.
- Flutter UI: Fetches and displays data in a user-friendly interface.
Prerequisites
Before running the project, ensure you have the following: - Flutter SDK: Installation Guide (https://flutter.dev/docs/get-started/install) - Appwrite Account: Sign Up Here (https://appwrite.io/) - A valid Appwrite Project configured with a database and collection.
Setup Instructions
1. Clone the Repository
```bash git clone https://github.com/mahmooooud/flutter_appwrite_task.git cd flutter_appwrite_task ```
2. Install Dependencies
Run the following command to install the required packages: ```bash flutter pub get ```
3. Configure Appwrite
Open the `lib/constants.dart` file. Update the following with your Appwrite project details: ```dart const String projectId = "your_project_id"; const String endpoint = "your_appwrite_endpoint"; const String collectionId = "your_collection_id"; ```
4. Run the Application
Use the following command to run the app on a connected device or emulator: ```bash flutter run ```
Appwrite Configuration
1. Database: - Created a database to store documents. 2. Collection: - Added a collection with the following attributes:   - title (String)   - description (String) - Set permissions to allow public access. 3. Dummy Data: - Added sample records for testing.
Dependencies
This project uses the following packages: - appwrite: For backend integration with Appwrite. - flutter/material: For building the user interface.
Contribution
Feel free to fork this repository, open issues, or submit pull requests to contribute to this project.
License
This project is licensed under the MIT License.
