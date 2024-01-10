# Swift Property Wrappers Showcase

🚀 A simple Swift application demonstrating the use of custom property wrappers for managing persistent data with FileManager.



# Property Wrappers

1. FileManagerPropertyWrapper
Persist a simple String value with ease.

```swift
  @FileManagerPropertyWrapper("title") private var textFieldText: String = "Enter text"
```

2. FileManagerCodablePropertyWrapper
Persist Codable objects effortlessly with this property wrapper.

```swift
  @FileManagerCodablePropertyWrapper("user_profile") private var user: User?
```

3. FileManagerKeyPathPropertyWrapper
This property wrapper leverages a KeyPath to manage Codable objects.

```swift
  @FileManagerKeyPathPropertyWrapper(\.userProfileKeyPath) private var user
```


# Getting Started

1. Clone the Repository:
   * 🧬 Clone this repository to your local machine.
2. Open in Xcode:
   * 🚀 Open the project in Xcode.
3. Explore and Learn:
   * 🕵️‍♂️ Dive into the code to understand how custom property wrappers are implemented and utilized
4. Learn and Apply:
   * 🧪 Feel free to modify the wrappers, create new ones, and experiment with different data types.

# Contributions
Contributions and suggestions are welcome! Feel free to open issues or submit pull requests.
