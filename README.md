                                        CSC/ECE 517 (OO Design and Development)
                                                 Spring 2020
                                            Program 2: Ruby on Rails
                                           STORE MANAGEMENT SYSTEM


Welcome to the store management system !!!

Admin Credentials :-

email    : admin@gmail.com
password : pasword 


Following are the instructions to help you navigate our Store Management system.


If you are an Admin :

1) Log in with an email(admin@gmail.com) and password(pasword).
2) You can update your profile by clicing on Edit profile. The email attribute is read-only, therefore you can not update it.
3) You cannot delete admin's account.
4) View users : You can click on browse,that redirects to items page. Below the items there is a link provided for view users, it will take you to the list of all the registered users (login-> Browse-> View users)
5) Show user : Once you click on view users, you can see the list of users. Every user has a link (show) beside his name that will redirect to a page that provides all the users details.(login-> Browse-> View users -> show)
6) Edit/Delete user : Every user has a link (Edit/Delete) beside his name that will redirect to a page that enables you to Edit any of the users details or delete his/her account.(Browse -> View users -> Edit/Delete)
7) Edit/Delete items : The browse link on homepage will list out all the available items, each item has links Edit and X. The X button will delete the item, similarly Edit item wil let you edit the item.
8) Wishlist : On the Homepage, the Wishlist lists out all the items you added to you wishlist. 
9) Cart     : The Cart tab lists out all the items you added to your card waiting to be checed out. 
10) Orders  : The Orders tab lists out all the items you ordered post purchases. 
<br/>**Note:** Due to problems related to production database, the orders containing special items are not identified and this functionality throws a 500 error in our app.

11) Items Returned : It lists out all the items you requested to return with status tags(Ex : Approved by user, Pending Approval).
<br/>**Note:** Due to problems related to production database regarding handling returning items, the functionality throws a 500 error in our app.

12) Rejected Special Items : It lists out all the Special items you wished to buy, but dispproved by the admin.
<br/>**Note:** Due to problems related to production database, the special items are not identified and the functionality throws a 500 error in our app.

13) Return Requests  : It lists out all the return requests pending to be approved by the admin. 
<br/>**Note:** Due to problems related to production database, the functionality throws a 500 error in our app.

14) Special Requests : It lists out all the special requests pending to be approved by the admin.
<br/>**Note:** Due to problems related to production database, the functionality throws a 500 error in our app.

15) View Item and its FeedBack : Every item has a link show which redirects to a page that lists out all the details of the item and comments given to it by admin/user/visitor.

If you are a User :

1) Log in with your email or sign up.
2) You can update your profile by clicing on Edit profile.
3) You can delete your account on your edit profile page, with a link delete my account at the bottom of the page.
4) Wishlist : On the Homepage, the Wishlist lists out all the items you added to you wishlist. 
5) Cart     : The Cart tab lists out all the items you added to your card waiting to be checed out. 
6) Orders  : The Orders tab lists out all the items you ordered post purchases.
<br/>**Note:** Due to problems related to production database, the functionality throws a 500 error in our app.

7) Items Returned : It lists out all the items you requested to return with status tags(Ex : Approved by user, Pending Approval)
<br/>**Note:** Due to problems related to production database, the functionality throws a 500 error in our app.

8) Rejected Special Items : It lists out all the Special items you wished to buy, but dispproved by the admin.
<br/>**Note:** Due to problems related to production database, the functionality throws a 500 error in our app.

9) Give FeedBack : Every item has a link show which redirects to a page that lists out all the details of the item and you can give comment to the item.


Functional Flow :

1) Add to wishlist : Adds the item to wishlist.
2) X in wishlist : Deletes the item from the wishlist.
3) Add to Cart : Adds the item to wishlist.
4) Clear Cart : This clears all the items from your cart.
4) X in Cart : Deletes the item from the Cart.
5) Proceed for Payment : Redirects to the item checout page.
5) Make Payment : To purchase the item, it adds the item to your orders table.
6) Add to Subscription List : In case an item is not available at the time, you can get a notification to your e-mail whenever it is bac in the stock.


If You are Visitor :

1) Click on the browse on the homepage to see all the available items in the store.
2) Show : The link show beside items will take you to a page that lists out the details of the item and a field where you can give feedbac to the item.
3) click to register : This link will redirect you to the user sign up page 

Note : As a visitor, you'll not be able to buy an item without signing up, However you can provide your comment to the item.Please do sign up, to continue shopping. 


Additional Functinalities Implemented :

1) User gets notified when an item either requested for return or approval for special item purchase is acepted by the Admin.
2) User gets an e-mail for all the succesful trasactions.
3) User gets a OTP before making the payment for purchase.


Assumptions Made :

1) The credit card numbers does not start with 0 and must have 16 digits.
2) CCV cannot start with 0 and must have 3 digits.
3) **Special Item is used as popularity metric.**
 

  


