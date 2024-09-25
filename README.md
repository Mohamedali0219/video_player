Video Player App
The Video Player App is a simple yet powerful Flutter application that allows users to play videos from various sources seamlessly. Utilizing the VideoPlayer and Chewie packages, this app provides a robust interface for video playback, complete with controls for play, pause, fullscreen, and more.

Key Features
Versatile Video Playback: Stream videos from network sources with ease.
User-Friendly Interface: Built with the Chewie package, providing a sleek and intuitive UI for video controls.
State Management: Implements the Bloc pattern to handle the state of video loading and error handling effectively.
Loading Indicators: Displays a loading spinner while videos are buffering, enhancing user experience.
Error Handling: Clearly shows error messages in case video loading fails.
How It Works
The app is structured around a central VideoPlayerCubit, which manages the loading state of videos.
VideoPlayerView widget is responsible for rendering the video player and updating the UI based on the current state.
The main screen (VideoPlayersScreen) features a list of video players, starting with a sample video for demonstration.
Getting Started
To get started with the Video Player App:

Clone the repository and navigate to the project directory.
Install the necessary dependencies using Flutter's package manager.
Run the app on your device or emulator to experience seamless video playback.
This app serves as a great foundation for learning Flutter and understanding state management with the Bloc pattern while providing essential video playback functionalities.
