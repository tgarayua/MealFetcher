# Recipe App README

## Steps to Run the App
1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Ensure your development environment is set to **Xcode 14+** and **iOS 16+**.
4. Build the project by selecting the correct scheme and pressing `Cmd + B`.
5. Run the app on a simulator or physical device by pressing `Cmd + R`.
6. The app will load a list of recipes from the provided API. You can search for recipes or refresh the list using the interface.

## Focus Areas
### What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
1. **Clean Architecture:**
   - I focused on separating concerns using MVVM to ensure the codebase is maintainable and scalable.
2. **Networking Efficiency:**
   - Implemented asynchronous API calls and lazy image loading to optimize bandwidth usage.
3. **User Experience:**
   - Added search functionality, pull-to-refresh, and a visually appealing UI to enhance usability.

These areas were prioritized because they directly contribute to a high-quality app that is both functional and maintainable.

## Time Spent
### Approximately how long did you spend working on this project? How did you allocate your time?
- **Total Time:** ~5 hours
  - **Research and Planning:** 1 hour
  - **API Integration and Networking:** 1 hour
  - **UI Design and Implementation:** 1 hour
  - **Testing and Debugging:** 1 hour
  - **Writing ReadMe Document:** 1 hour

## Trade-offs and Decisions
### Did you make any significant trade-offs in your approach?
1. **Image Caching:**
   - Used a simple `AsyncImage` approach for lazy loading and relied on its caching mechanism instead of implementing a custom image caching solution. This saved time but may not be as efficient as a fully custom implementation.
2. **Testing:**
   - Focused on testing for ViewModel and Service layers but did not include UI tests.

## Weakest Part of the Project
### What do you think is the weakest part of your project?
- The weakest part is the reliance on `AsyncImage` for image caching. While convenient, a custom solution could provide better control over disk caching and performance optimization.

## External Code and Dependencies
### Did you use any external code, libraries, or dependencies?
- The app does not use any third-party libraries. All functionality, including networking and image handling, was implemented using Swift's native libraries.

## Additional Information
### Is there anything else we should know? Feel free to share any insights or constraints you encountered.
- **API Constraints:** The API endpoints provided return varying levels of data quality (e.g., malformed or empty data). I accounted for these scenarios by adding error handling and displaying user-friendly messages.
- **Scalability:** While the app is designed for a single API endpoint, it can easily be extended to handle multiple endpoints or different data models in the future.
- **Future Improvements:** I would like to add more advanced caching and animations to make the app feel more polished.

