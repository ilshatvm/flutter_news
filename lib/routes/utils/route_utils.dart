enum PAGES {
  home,
  categories,
  bookmarks,
  profile,
  login,
  forgot,
  error,
}

extension AppPageExtension on PAGES {
  String get path {
    return switch (this) {
      PAGES.home => "/",
      PAGES.categories => "/categories",
      PAGES.bookmarks => "/bookmarks",
      PAGES.profile => "/profile",
      PAGES.login => "/login",
      PAGES.forgot => "/login/forgot",
      PAGES.error => "/error",
    };
  }

  String get name {
    return switch (this) {
      PAGES.home => "home",
      PAGES.categories => "categories",
      PAGES.bookmarks => "bookmarks",
      PAGES.profile => "profile",
      PAGES.login => "login",
      PAGES.forgot => "forgot",
      PAGES.error => "error",
    };
  }

  String get title {
    return switch (this) {
      PAGES.home => "Home",
      PAGES.categories => "Categories",
      PAGES.bookmarks => "Bookmarks",
      PAGES.profile => "Profile",
      PAGES.login => "Login",
      PAGES.forgot => "Forgot",
      PAGES.error => "Error",
    };
  }
}
