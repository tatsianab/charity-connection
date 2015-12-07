#Day 1:

##set up models and associations for:
	- [x] business
	- [x] charity
	- [x] admin
	- [x] category
	- [x] cart
	- [x] line-item
	- [x] item
	- [x] order
##sets up methods for:
	- [x] cart
	- [x] order

#Day 2:
	- [X] set up database
	- [X] migrate database
	- [X] set up validation
	- [X] set up User Resources
	- [X] set up signup form
	- [X] adds list controller
	- [X] sets up item new and show routes and views

#Day 3:
	- [X] item and user test validation and associations
	- [X] login page
	- [X] Login upon signup
	- [X] welcome page
	- [X] Edit item
	- [X] Delete item
	- [X] cart controller
	- [X] cart show page
	- [X] Create Item resources

#Day 4:
	- [X] Build header (login, logout, items, sign in, signup, cart, home, category)
	- [X] destroy line item, cart, order
	- [X] set up order controller
	- [ ] order history
	- [X] order page (upon successful cart submission)
	- [ ] business/charity permission
	- [ ] revisit flow (with Lesly)
##Minor Fixes
- [] remove extra button tag in order page
- [X] add business hidden field to item
- [] show items that business has submitted
- [] deleting items after order is successfull
- [X] fix errors with submitting blank forms
- [] do we want businesses to see all items (if yes separate business items from all, if no only show business items) - view object?

# Features
- [ ] action-mailer
	- [] send one email to charity upon order confirmation
	- [] send one email to business after charity has accepted their item
- [ ] google maps
	-[] add map of business location to items index
	-[] add google maps to charity/business home pages
	-[] add google maps to order success page showing order locations

#Ember & Javascript/Ajax
- [] ajax for carts controller
- [] lazy loader

#Refactoring
- [ ] routing constraints?

##This Weekend:
Tatiana: action-mailer
Austin: google maps
Natalie: fix cart/checkout system + begin admin page
Lesley: Search controller

Weekend:
-[] completes cart checkout process
-[] adds business_id hidden field to items forms and admin_id field to category forms
-[] begins adding admin functionality
-[] fixes business/charity permissions
- [X] search controller? (maybe ember week)