# Gym

This is a Rails project meant to simulate a gym that users can sign up for, maintain accounts, and track lessons that they want to take. User accounts persist when the user is not logged in, and securely hold passwords using BCrypt for future logins. The project has unchanging resources corresponding to trainers and fitness plans for the user to interact with.

## Installing
In order to host this project on a local server, first cd into the Gym directory and run 

```
bundle install
```
Next run the following two commands
```
rake db:migrate
rake db:seed
```
The project tree should now be ready to host a local server by running
```
rails s
```
Visit localhost:#### in your browser where the # symbols should be replaced with the port number specified by rails in your console. Commonly this number will be 3000.

## User Experience
If a user is not logged in, they may view the site home page, trainer profiles, lesson descriptions, and fitness plan descriptions. User profiles are blocked unless signed in.

A user without an account can sign up with their name, a username and password. All three of these fields must exist to create a valid user, and username must be unique. On signup, a user must also choose a fitness plan to purchase, and sign up for one lesson to get started. If there are any problems with the information presented on the sign up form, the user will be prompted with relevant error messages and asked to sign up again.

Once signed up, the user is automatically logged in and gains access to view other user profiles as well as edit their own. On their own profile they have the option to enroll in more classes if their plan limit has not been reached, or unenroll in any classes they currently have. They may also choose to upgrade their fitness plan to a higher tier in order to accommodate more simultaneous lesson enrollments. A user may change their password as long as they remember their current password. Finally, they may also downgrade their account or delete their account entirely. When downgrading, the user will be forced to remove themselves from any classes which would put them over the limit of the plan that they are downgrading to.

## Authors
* **Daniel Baamonde** - [dannyb21892](https://github.com/dannyb21892)
* **Mohammad Khan** - [vsparrow](https://github.com/vsparrow)

## Acknowledgements
This is a pair programming assignment at the Flatiron School. Thanks to instructors Howard, Tashawn and Garry for their help along the way.
