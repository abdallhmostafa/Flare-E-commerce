#Flare E-Commerce App 🛒
An E-Commerce app built with Flutter using Firebase for backend services and implementing Clean Architecture principles. This app provides users with seamless browsing, shopping, and secure transactions in an intuitive mobile interface.

##Features ✨
User Authentication (Sign up, login, logout) with Firebase Auth.
Product Catalog: Browse products by categories and apply filters.
Shopping Cart: Add, edit, and remove products from the cart.
Wishlist: Save favorite products for later.
Order Management: Place orders and track their status.
Real-Time Database: Sync user data (cart, wishlist, orders) with Firebase Firestore.
Cloud Storage: Store product images.
Push Notifications for order updates (Firebase Cloud Messaging).
##Tech Stack 🛠️
Flutter for cross-platform app development.
Firebase for backend services.
Clean Architecture for scalable and maintainable code.
BLoC"Cubit" for state management.
Dart as the programming language.
##Project Structure 📂
The app follows the Clean Architecture principles, organized into three layers:

Data Layer:

Handles data sources and repositories.
Integrates with Firebase services (Firestore, Auth, Storage).
Domain Layer:

Defines the business logic and use cases.
It contains repository interfaces to interact with data sources.
Presentation Layer:

Manages the UI components and user interactions.
Organized into modules/screens for easier navigation and testing.
