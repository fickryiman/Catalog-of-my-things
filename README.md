<!-- PROJECT DESCRIPTION -->
# 📖 Catalog-Of-My-Things<a name="about-project"></a>
> This project is  a console app that will help us to keep a record of different types of things: books, music albums, movies, and games. Everything will be based on the UML class diagram presented below. The data will be stored in JSON files but we will also prepare a database with tables structure analogical to our program's class structure.

<!-- TABLE OF CONTENTS -->
# 📗 Table of Contents

- [📖 Catalog-Of-My-Things](#-catalog-of-my-things)
- [📗 Table of Contents](#-table-of-contents)
    - [How to build the "Catalog Of My Things" application?](#how-to-build-the-catalog-of-my-things-application)
    - [Projects list](#projects-list)
      - [Logic](#logic)
      - [User interface](#user-interface)
    - [Database](#database)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Tools i have used for this project ](#tools-i-have-used-for-this-project-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- > Describe your project in 1 or 2 sentences. -->
### How to build the "Catalog Of My Things" application?
"Catalog of my things" should be a simple console app that allows users to manage collections of the things they own. It should be based on the following UML class diagram.

<p align="center">
  <img src="./public/catalog_of_my_things.png" alt="catalog_of_my_things" width="700px" />
</p>

### Projects list
#### Logic

- Each class from the [UML class diagram](./public/catalog_of_my_things.png) should be created in a separate .rb file.
- All associations (1-to-many relationships) and aggregations (parent-child relationships) between classes should be implemented.
- All properties visible in the diagram should be defined and set up in the constructor method. _Exception: properties for the 1-to-many relationships should NOT be set in the constructor method. Instead, they should have a custom setter method created._
- All methods visible in the diagram should be implemented:
    - add_item method (in all classes that have that method)
        - should take an instance of the Item class as an input.
        - should add the input item to the collection of items.
        - should add self as a property of the item object (by using the correct setter from the item object).
    - can_be_archived?() in the Item class
        - should return true if published_date is older than 10 years.
        - otherwise, it should return false.
    - move_to_archive() in the Item class
        - should reuse can_be_archived?() method.
        - should change the archived property to true if the result of the can_be_archived?() method is true.
        - should do nothing if the result of the can_be_archived?() method is false.
    - can_be_archived?() in the Book class
        - should override the method from the parent class.
        - should return true if parent's method returns true OR if cover_state equals to "bad".
        - otherwise, it should return false.
    - can_be_archived?() in the MusicAlbum class
        - should override the method from the parent class.
        - should return true if parent's method returns true AND if on_spotify equals true.
        - otherwise, it should return false.
    - can_be_archived?() in the Game class
        - should override the method from the parent class.
        - should return true if parent's method returns true AND if last_played_at is older than 2 years.
        - otherwise, it should return false.
- Add unit tests for all implemented methods.

#### User interface

- Create a main.rb file that will serve as your console app entry-point.
- Your console app, at the start, should:
    - Present the user with a list of options to perform.
    - Let users choose an option.
    - If needed, ask for parameters for the option.
    - Have a way to quit the app.
- The following options should be available:
    - List all books
    - List all music albums
    - List of games
    - List all genres (e.g 'Comedy', 'Thriller')
    - List all labels (e.g. 'Gift', 'New')
    - List all authors (e.g. 'Stephen King')
    - Add a book
    - Add a music album
    - Add a game
 - All data should be preserved by saving collections in .json files.

### Database
- Create a schema.sql file with tables that will be analogical to the structure of the classes in your app. As you cannot implement inheritance in the database tables - add all properties and associations from the parent Item class as table columns to all tables based on the child classes. Thanks to that it can be used to store data in the future.


## 🛠 Built With <a name="built-with"></a>
### Tech Stack <a name="tech-stack"></a>

<!-- > Describe the tech stack and include only the relevant sections that apply to your project. -->
<details>
  <summary>Client Side / Front-End</summary>
  <ul>
    <li><a href="https://www.w3.org/html/">HTML</a></li>
    <li><a href="https://www.w3.org/Style/CSS/">CSS</a></li>
    <li><a href="https://www.javascript.com/">Javascript</a></li>
    <li><a href="https://create-react-app.dev/">React</a></li>
    <li><a href="https://reactrouter.com/">React Router</a></li>
  </ul>
</details>

<details>
  <summary>Server Side / Back-End</summary>
  <ul>
    <li><a href="https://www.json.org/json-en.html">JSON</a></li>
    <li><a href="https://nodejs.org/en/">Node.js</a></li>
    <li><a href="https://redux.js.org/">Redux</a></li>
    <li><a href="https://www.iqair.com/">Air Quality API</a></li>
  </ul>
</details>

<details>
    <summary>Package, Library, Framework</summary>
      <ul>
        <li><a href="https://jestjs.io/">Jest</a></li>
        <li><a href="https://axios-http.com/docs/intro">axios</a></li>
        <li><a href="https://redux-toolkit.js.org/">Reduxjs Toolkit</a></li>
      </ul>
  </details>

<!-- Features -->
### Tools i have used for this project <a name="tools"></a>
  <details>
    <summary>Code Convention, Code Analysis</summary>
      <ul>
        <li><a href="https://rubocop.org/">Rubocop</a></li>
        <li><a href="https://www.tutorialspoint.com/ruby/interactive_ruby.htm">IRB(Interactive Ruby Shell)</a></li>
      </ul>
  </details>
  <details>
    <summary>Version Control, CI/CD, Hosting Service</summary>
      <ul>
        <li><a href="https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow">GitFlow</a></li>
        <li><a href="https://github.com/features/actions">Github Actions</a></li>
        <li><a href="https://git-scm.com/">Git</a></li>
      </ul>
  </details>
  <details>
    <summary>IDE, Desktop Apps, Other Tools</summary>
      <ul>
        <li><a href="https://code.visualstudio.com/">Visual Studio Code</a></li>
        <li><a href="https://desktop.github.com/">Github Desktop</a></li>
        <!-- <li><a href="https://www.figma.com/">Figma</a></li> -->
      </ul>
  </details>

### Key Features <a name="key-features"></a>

- Store data in files
- Build interactive console apps

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## 💻 Getting Started <a name="getting-started"></a>

<!-- > Describe how a new developer could make use of your project. -->
To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:
- Operating System (Windows, Linux, Unix)
- Ruby installed
- install the dependencies

### Setup

Clone this repository to your desired folder:

```sh
  cd catalog-of-my-things
  git git@github.com:fickryiman/Catalog-of-my-things.git
```


### Install

Install this project with:

```sh
  cd catalog-of-my-things
  bundle install
```

### Usage

To run the project, execute the following command:

```sh
  cd catalog-of-my-things
  ruby main.rb
```
Runs the app in the irb mode.\
Open command prompt or terminal.

### Run tests

To run tests, run the following command:
Run Rspec Actions Test
```sh
  cd catalog-of-my-things
  rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->
## 👥 Authors <a name="authors"></a>

<!-- > Mention all of the collaborators of this project. -->

👤 **Fickry Bil Iman**
- GitHub: [fickryiman](https://github.com/fickryiman)
- Facebook: [fickry.bil.iman](https://www.facebook.com/fickry.bil.iman)
- LinkedIn: [Fickry Bil Iman](https://www.linkedin.com/in/fickry-bil-iman)

👤 **Andry Narson**
- GitHub: [rbd3](https://github.com/rbd3)
- Twitter: [Narson321](https://twitter.com/@Narson321)
- LinkedIn: [Andry Narson Rabedesana](https://www.linkedin.com/in/andry-rabedesana)

👤 **Md Sazzad Hossain**
- GitHub: [sazzad1q2](https://github.com/SAZZAD1Q2)
- Twitter: [SazzadShaikh11](https://twitter.com/MdHo5453)
- LinkedIn: [Md Sazzad Hossain](https://www.linkedin.com/in/sazzad3y/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->
## 🔭 Future Features <a name="future-features"></a>

<!-- > Describe 1 - 3 features you will add to the project. -->
- add login to user with social media auth or google auth

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [https://github.com/fickryiman/Catalog-of-my-things.git/issues](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->
## ⭐️ Show your support <a name="support"></a>

<!-- > Write a message to encourage readers to support your project -->

If you like this project please follow me on my GitHub: [@fickryiman](https://github.com/fickryiman) or connect on my LinkedIn: [@fickry-bil-iman](https://www.linkedin.com/in/fickry-bil-iman).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->
## 🙏 Acknowledgments <a name="acknowledgements"></a>

<!-- > Give credit to everyone who inspired your codebase. -->
Credits and Thanks to:
- Allah for the everythings, Alhamdulillah.
- My Families for all of the supports.
- My Pair Programming Partners
- Microverse for all of the experiences, lessons, projects.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

<!-- ## ❓ FAQ (OPTIONAL) <a name="faq"></a>

<!-- > Add at least 2 questions new developers would ask when they decide to use your project. -->

<!-- - **[Question_1]** -->

  <!-- - [Answer_1] -->

<!-- - **[Question_2]** -->

  <!-- - [Answer_2] -->

<!-- <p align="right">(<a href="#readme-top">back to top</a>)</p> -->

<!-- LICENSE -->
## 📝 License <a name="license"></a>

This project is [Creative Commons 1.0 Universal License](./LICENSE) licensed.

<!-- Creative Commons License - Start -->
<!-- Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg -->
<!-- Creative Commons License - End -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>
