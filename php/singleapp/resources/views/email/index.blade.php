<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Email</title>
</head>
<body>

  <form action="{{route('email.create')}}" method="post">
    {{ csrf_field() }}
    <input type="text">
    <button type="submit">send</button>
  </form>

</body>
</html>