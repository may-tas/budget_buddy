class AppValidator {
  validateApp() {
    return (value) {
      if (value == null || value.isEmpty) {
        return "Password can't be empty";
      }
      return null;
    };
  }
}
