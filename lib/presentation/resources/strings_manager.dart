class AppStrings {
  // Auth Strings
  static const String pets = 'Pets';
  static const String planet = 'Planet';
  static const String foodDelivery = 'FOOD DELIVERY';
  static const String desc =
      'Caring for Pet has never been easy, with Pet Planet you can get your pet supplier and services';
  static const String login = 'Login';
  static const String signUp = 'Sign Up';
  static const String createAnAccount = 'Create An Account';

  // Login Screen
  static const String addYourDetailsToLogin = 'Add your details to login';
  static const String yourEmail = 'Your Email';
  static const String password = 'Password';
  static const String forgotYourPassword = 'Forgot Your Password?';
  static const String doNotHavaAnAccount = 'Don\'t hava an account?';

  // Signup Screen
  static const String addYourDetailsToSignUP = 'Add your details to sign up';
  static const String name = 'Name';
  static const String email = 'Email';
  static const String mobileNumber = 'Mobile No';
  static const String address = 'Address';
  static const String alreadyHavaAnAccount = 'Already hava an account?';

  // Forgot Password Screen
  static const String resetPassword = 'Reset Password';
  static const String
      pleaseEnterYourEmailToReciveALinkToCreateANewPasswordViaEmail =
      'Please enter your email to recive a \n link to create a new password via email';
  static const String send = 'Send';

  static const String skip = 'Skip';
  static const String loading = 'Loading..';
  static const String empty = 'Empty';
  static const String ok = 'Ok';
  static const String profile = 'Profile';
  static const String home = 'Home';
  static const String logout = 'Logout';
  static const String cart = 'Cart';
  static const String wishlist = 'Wishlist';
  static const String checkout = 'Checkout';
  static const String someThingWentWrong = 'Some Thing Went Wrong';

  // Home Screen
  static const String search = 'Search';
  static const String searchForAProduct = 'Search for a Product';
  static const String addToCart = 'Add To Cart';
  static const String addToWishlist = 'Add To Wishlist';
  static const String openWishlist = 'Open Wishlist';
  static const String back = 'Back';

  // Cart Screen
  static const String subTotal = 'SUBTOTAL';
  static const String deliveryFee = 'DELIVERY FEE';
  static const String total = 'TOTAL';
  static const String goToWishlist = 'GO TO CHECKOUT';
  static const String yourCartIsEmpty = 'Your Cart is Empty!';
  static const String addedToYourCart = 'Added To Your Cart';
  static const String removedFromYourCart = 'Removed From Your Cart';
  static const String yourProductIsIncreasedByOne =
      'Your Product Is Increased By One';
  static const String yourProductIsDecreasedByOne =
      'Your Product Is Decreased By One';

  // Wishlist Screen
  static const String yourWishlistIsEmpty = 'Your Wishlist is Empty!';
  static const String aboutProduct = 'About Product';
  static const String addedToYourWishlist = 'Added To Your Wishlist';
  static const String removedFromYourWishlist = 'Removed From Your Wishlist';

// Checkout Screen
  static const String orderNow = 'ORDER NOW';
  static const String customerInformation = 'CUSTOMER INFORMATION';
  static const String deliveryInformation = 'DELIVERY INFORMATION';
  static const String fullName = 'Full Name';
  static const String city = 'City';
  static const String orderSummary = 'ORDER SUMMARY';

  // Order Confirmation Screen
  static const String orderConfirmation = 'Order Confirmation';
  static const String backToShopping = 'BACK TO SHOPPING';
  static const String thankYou = 'Thank You!';
  static const String yourOrderIsBeingProcessing =
      'Your order is now being processing.\n We will contact you soon.';

  // Profile Screen
  static const String editProfile = 'Edit Profile';
  static const String yourWishlist = 'Your Wishlist';
  static const String myInformation = 'MY INFORMATION';

  // Internet Messages
  static const String pleaseCheckYouInternet = 'Please check your internet';
  static const String yourInternetConnectionWasRestored =
      'Your internet connection was restored';
  static const String youAreCurrentlyOffline = 'You are currently offline';

// Edit Profile Screen
  static const String save = 'Save';
  static const String dataSuccessfullySaved = 'Data successfully saved';

  // Validation Phrases
  static const String emailAddressCanNotBeEmpty =
      'Email Address Can\'t be Empty!';
  static const String enterCorrectEmailAddress = 'Enter Correct Email Address';
  static const String passwordCanNotBeEmpty = 'Password Can\'t Be Empty!';
  static const String passwordCanNotBeLessThan_8Characters =
      'Password Can\'t Be Less Than 8 Characters!';
  static const String enterCorrectName = 'Enter Correct Name';
  static const String enterCorrectMobileNumber = 'Enter Correct Mobile Number';
  static const String nameCanNotBeEmpty = 'Name Can\'t Be Empty';
  static const String mobileNumberCanNotBeEmpty =
      'Mobile Number Can\'t Be Empty';
  static const String addressCanNotBeEmpty = 'Address Can\'t Be Empty';

  // Regular Expressions
  static const String emailAddressRegularExpression =
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String mobileNumberRegularExpression =
      r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  static const String nameRegularExpression = r'^[a-z A-Z]+$';
}
