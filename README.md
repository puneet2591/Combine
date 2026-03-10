🚀 **iOS CI Pipeline with Combine**

This project demonstrates how to implement a Continuous Integration (CI) pipeline for an iOS application using GitHub Actions. The pipeline automatically builds the app and runs unit tests whenever code is pushed to the repository.
The goal of this project is to showcase how CI improves code quality, reliability, and development speed in modern iOS projects.


📱 **Project Overview**

This repository contains an iOS sample project that uses Combine along with a CI pipeline to automate build and test verification.
Every commit triggers the CI workflow which:

* Builds the iOS project
* Runs unit tests
* Validates code stability
* Ensures the project compiles successfully

This helps detect issues early and maintain a stable codebase.


⚙️ **Continuous Integration Workflow**

The CI pipeline is implemented using GitHub Actions.


**Workflow Steps**

* Trigger CI on every push or pull request
* Set up the macOS environment
* Install Xcode dependencies
* Build the iOS project
* Run unit tests
* Report success or failure

This ensures that every code change is automatically verified before merging.


🛠 **Tech Stack**

* Swift
* Combine Framework
* Xcode
* GitHub Actions
* iOS Unit Testing (XCTest)


📊 **Why CI is Important**

Implementing CI provides several benefits:

✅ Detects build failures early
✅ Automatically runs tests on every commit
✅ Improves collaboration in team environments
✅ Prevents broken code from reaching the main branch
✅ Increases confidence in code changes

CI helps maintain a production-ready codebase at all times.


🧪 **Running the Project Locally**

* Clone the repository
* git clone https://github.com/puneet2591/Combine.git
* Open the project
* cd Combine
* open Combine.xcodeproj


**Run the project**

* Open in Xcode
* Select an iOS Simulator
* Press Run (⌘ + R)


**Run tests**

Press: **⌘ + U**


🔁 **CI Workflow Location**

The CI workflow configuration can be found here:
.github/workflows/ci.yml
This file defines the automated build and test pipeline.


🚀 **Future Improvements**

* Add Fastlane integration
* Implement code coverage reporting
* Add SwiftLint for code quality
* Automate TestFlight deployment
* Expand unit and UI test coverage


👨‍💻 **Author**

Puneet Mahajan

Senior iOS Engineer | Swift | SwiftUI | CI/CD | Mobile Architecture

GitHub:
https://github.com/puneet2591
