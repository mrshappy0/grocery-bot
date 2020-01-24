# grocery-bot
<!-- Short Description -->
## Welcome to Grocery-Bot!
Grocery-bot is a minimalistic approach to terminal applications. We wanted an app that could create, delete, update, and access grocery lists. We are excited so share our work. Grocery-bot was intended to be simple yet functional, intuitive, and pleasing to the eye. Our database was built using ActiveRecord. Our ERD is built with three tables: List, List_item (join table), and Items. The list represent literally a list for shopping at a grocery store. The items represent each grocery item you might find at the store. And lastly, the list_item simple is our join table creating a many-to-many relationship between list and items. 

We would like to note that currently we wanted to focus our efforts on CRUD and have not yet implemented a grocery API. Due to this decision we seeded our database with 15 popular grocery items you might find at the store. Future version of this application would implement a Grocery API or Recipe Finder API. This would provide access to thousands of grocery items. The structure our of application makes this next feature very compatible!
<!-- Install instructions -->
## Install Instructions
In order to run this application fork and/or clone this repo.
Make sure to migrate and seed database with following lines in your terminal.

```
rake db:migrate

rake db:seed
```
#### Requirements: Ruby Installation on Computer


<!-- Contributors Guide -->
## Contributors Guide
<ul>
    <li>[Zachary Jacobs](https://github.com/zprogrammer-code)</li>
    <li>[Adam Shappy](https://github.com/mrshappy0)</li>
</ul>