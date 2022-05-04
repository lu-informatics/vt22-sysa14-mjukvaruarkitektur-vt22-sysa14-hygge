/**
 * returns false if string is either empty or non-alphabetical.
 */
 function validateForm(form,field) {
  let x = document.forms[form][field].value;
  if (x == "" || !x.match(/^[A-Za-z]+$/)) {
    alert("Please fill out all fields, using alphabets only.");
    return false;
  }
}

/** USAGE EXAMPLE:
<form name="myForm" action="/action_page.php" onsubmit="return validateForm('myForm','fname')" method="post">
  Name: <input type="text" name="fname">
  <input type="submit" value="Submit">
</form>
 */
