### Creating the Website for Robin Williams Theatre

##### Application Summary: 

This project is a web application that can be used by a movie theater owner or other administrative-level employee, so users can purchase tickets online and sales can be tracked. The requirements provided by the client are listed at the bottom. In addition, please see the following run-down of how I went about building this as well as future enhancements and roadblocks I ran into:

The first thing I did after receiving the list of requirements was sit down and consider what the main purpose of the application was and if there were any potential user stories/cases to consider outside the scope of the client requirements. Next, I went ahead and created a wire frame for how I thought the application should flow and feel. In addition, I also created my models and associations:

[Wireframes](drive.google.com/file/d/0B5ZU55Leu8RVNjBWSXVuNmVmNTg/view?usp=sharing)

[Models and associations](drive.google.com/file/d/0B5ZU55Leu8RVN192RGk4ZnplbUk/view?usp=sharing)

When I initially created this, I broke the elements out into 5 models: movies, ticket details, ticket purchases, viewings, and viewing rooms. The movie model contains relevant information for a movie goer such as the name and rating, but also includes some values for populating images as well as making a 3rd party API request to omdb. Ticket details contains the ticket type and price, to encompass current and future needs. Viewings lets the admin pick a movie and place it in a specific auditorium at a designated date & time. While viewings rooms allows the admin to set the auditorium number as well as seating capacity. Last, ticket purchases is where all the information lives when buying a ticket.

The main home/landing page shows the movie posters for what is currently playing in the theater as well as movies that will be coming soon. A user can click on the image of the movie poster and it will take them to a page with that movie's details such as plot, genre, showtimes, etc… From there the user can click on a button that takes them to ticket purchasing page. The user is then able to select all the pertinent information for the movie they want to go see and submit their ticket order. However, if they change their mind half-way through the page, they can select to cancel their order rather than submit it. If they choose to sumbit, their their order is passed over and saved the database. The user then will be taken to a purchase success page letting them know they will be receiving their email confirmation shortly.

Once that submission is sent, the users' information is compared with the validations in the ticket_purchase.rb model. Fields such as credit card, zip code, cvc, and email are tested against basic REGEXs and should trigger customized error messages if incorrect character types or lengths are entered. I used the generic VISA test credit card number of 4242424242424242. I intended to set-up a custom validation for verifying the age of the ticket purchaser, but ran into some complications with my booleans. I kept receiving error messages in the console that the format of my submission was being deprecated and thus being automatically set to “f”, which went to null. I attemped to create a model in my config initiliazers as well as installed a gem for boolean values, but was unsuccessful with all of the above.

However, that being said the user will receive a [confirmation email](https://www.dropbox.com/s/kv2seek38h5kvuk/RW%20Theatre%20-%20Enjoy%20the%20show%20%26%20don%27t%20forget%20the%20popcorn%21.pdf?dl=0) once their order is successfully submitted. I set up the emails to process through Sendgrid via the Heroku add-on. I didn't have a chance to style the html version of the email, but the messaging was created to be in line with the theme of the website.

The rest of the functioning pages on the app are the admin dashboard functionalities. I have a placeholder link for 'about us' as well as an admin 'login/logout' in the admin drop-down, which in theory would restrict access to the dashboard, but I didn't have time to complete those aspects of my design. The manage theatre link takes one to a page where all the movie related specifics can be managed. It is here that an admin can add/edit/ movies, ticket types, auditoriums, movie viewings. Within the sales dashboard, the admin can see a list of ticket purchases for all the movies.

##### Refactoring Opportunities, Fixes, & Roadblocks:

This list of items contains opportunities for improvement and/or enhancements that theoritically would be implemented in the next sprint and subsequent release of this application:

1. As I mention briefly above, I ran into a roadblock in regards to utilizing booleans and posting them properly to the database, esp. when attempting to include them in dropdowns or radio buttons. I think I fell down a rabbit hole of trying to figure this out via the Rails API, stack overflow + google in general and should have thrown in the towel sooner than my hack of using yes/no + text fields.
2. I didn't have time to research and teach myself enough rspec to properly test the work I was doing. We breezed through rails during the last week of classtime at General Assembly, so we didn't really go in depth on the framework in general much less touch testing for more than an hour overview. However, I very much believe in the necessity of TDD and figuring that out is on my shortlist.
3. I used bootstrap for styling to ensure the app would be responsive, but I had way less time for styling than I would have liked and did my best to make little tweaks to have it at least be palatable. 
4. I was able to successfully implement the ombd API to populate the movie details, but didn't have time to implemenet embedded youtube movie trailers like I wanted.
5. Complications with transference of data via hashes. This was another rabbit hole for me in regards to a few aspects of my functionality. As this was only the second rails application I have built, I had several occassions in which I knew the values I wanted/needed to pass to the next page, but was unable to properly pass that via the hash. In some instances, I was able to figure out how to send the proper variable, ex: showing moving name in my ticket purchase drop-down, but sending the movie id to the database and in other instances I was not, ex: finding proper id to pull specific showtimes for specific movie on the movie details page. In addition, I attempted another hack with figuring out seat selling out situation as I attempted to create a new hash for my tickets, but sadly did *not* finish & ran out of time trying to implement that. However, each showtime does have a limited number of seats.
6. Date/time formatting complications -- another item that I ran out of time with researching. I know there are ways to convert the values that I needed to, but in order to make the deadline, they are submitted in a non-graceful format, but do properly save to the database and can be found/retrieved.
7. Rookie mistake with the forms of not implementing partials. I realized well into this endeavor as I was researching form drop-downs that I could have been way more efficient and way more DRY with my code if I had implemented partials in my forms. Needless to say that is a mistake I will not be making again.

That being said, I had a lot of fun amongst the inevitable frustrations and learned so much from this experience. All of the previous projects I have worked on thus far were open-ended in regards to requirements and being able to apply concepts to an actual structured mock client experience was very beneficial!

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

However, we need the site to work on mobile, so keep that in mind.
