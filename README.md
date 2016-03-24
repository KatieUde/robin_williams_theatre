### Creating the Website for Robin Williams Theatre

##### Application Summary: This project is a web application that can be used by a movie theater owner or other administrative-level employee, so users can purchase tickets online and sales can be tracked. The requirements provided by the client are listed at the bottom. In addition, please see the following run-down of how I went about building this as well as future enhancements and roadblocks I ran into:

The first thing I did after receiving the list of requirements was sit down and consider what the main purpose of the application was and if there were any potential user stories/cases to consider outside the scope of the client requirements. Next, I went ahead and created a wire frame for how I thought the application should flow and feel. In addition, I also created my models and associations:

[Wireframes](drive.google.com/file/d/0B5ZU55Leu8RVNjBWSXVuNmVmNTg/view?usp=sharing)

[Models and associations](drive.google.com/file/d/0B5ZU55Leu8RVN192RGk4ZnplbUk/view?usp=sharing)

When I initially created this, I broke the elements out into 5 models: movies, ticket details, ticket purchases, viewings, and viewing rooms. The movie model contains relevant information for a movie goer such as the name and rating, but also includes some values for populating images as well as making a 3rd party API request to omdb. Ticket details contains the ticket type and price, to encompass current and future needs. Viewings lets the admin pick a movie and place it in a specific auditorium at a designated date & time. While viewings rooms allows the admin to set the auditorium number as well as seating capacity. Last, ticket purchases is where all the information lives when buying a ticket.

The main home/landing page shows the movie posters for what is currently playing in the theater as well as movies that will be coming soon. A user can click on the image of the movie poster and it will take them to a page with that movie's details such as plot, genre, showtimes, etc… From there the user can click on a button that takes them to ticket purchasing page. The user is then able to select all the pertinent information for the movie they want to go see and submit their ticket order. However, if they change their mind half-way through the page, they can select to cancel their order rather than submit it. If they choose to sumbit, their their order is passed over and saved the database. The user then will be taken to a purchase success page letting them know they will be receiving their email confirmation shortly.

Once that submission is sent, the users' information is compared with the validations in the ticket_purchase.rb model. Fields such as credit card, zip code, cvc, and email are tested against basic REGEXs and should trigger customized error messages if incorrect character types or lengths are entered. I intended to set-up a custom validation for verifying the age of the ticket purchaser, but ran into some complications with my booleans. I kept receiving error messages in the console that the format of my submission was being deprecated and thus being automatically set to “f”, which went to null. I attemped to create a model in my config initiliazers as well as installed a gem for boolean values, but was unsuccessful with all of the above.

However, that being said the user will receive a confirmation email once their order is successfully submitted. I set up the emails to process through Sendgrid via the Heroku add-on. I didn't have a chance to style the html version of the email, but the messaging was created to be in line with the theme of the website.

The rest of the functioning pages on the app are the admin dashboard functionalities. I have a placeholder link for 'about us' as well as an admin 'login/logout' in the admin drop-down, which in theory would restrict access to the dashboard, but I didn't have time to complete those aspects of my design. The manage theatre link takes one to a page where all the movie related specifics can be managed. It is here that an admin can add/edit/ movies, ticket types, auditoriums, movie viewings. Within the sales dashboard, the admin can see a list of ticket purchases for all the movies.

##### Refactoring Opportunities, Fixes, & Roadblocks:

##### Requirements provided by LPL that the client would like implemented:

Customers should be able to come to the site and see all movies playing with their showtimes.

Seating is limited for each theater so a particular showtime should only have a limited number of seats.

Once a show sells out, a customer should no longer be able to buy tickets.

Customers should only be able to buy one ticket at a time so don't worry about a shopping cart for this version.

When customers decide to buy their ticket, they should be able to checkout by entering their name, email, credit card, and expiration date.

We want to make sure we don't get any bogus orders, so please keep an eye out for any validations and make sure the user knows if there's a problem with the order.

We'll add a credit card processor later on, so you DON’T need to integrate with a credit card processor.

Once the customer purchases their tickets, they should receive an email receipt.

The theater owner needs a way to manage the movies playing and seating capacities – He/She should be able to add auditoriums and seating capacities.

In addition, the movies change all the time so our client should be able to set which movie is showing in which auditorium.

The theater owner also wants to keep track of her sales, so the order information should be saved to the database.

She wants to see a list of all orders and a list of orders for each movie. We don't need any authentication on the app for now.

We're not worried about custom visual design, so feel free to use any CSS framework, or roll your own.

However, we need the site to work on mobile, so keep that in mind
