<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Email</title>

  <link href="css/app.css" rel=stylesheet>
  <script src="js/app.js"></script>

</head>
<body>


<nav class="navbar navbar-default navbar-static-top">
  <div class="container">
    ...
  </div>
</nav>

<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>


<h1>Hello, world!</h1>

  @if(Session::has('flash_message'))
      <div class="alert alert-success">
        <em> {!! session('flash_message') !!}</em>
      </div>
  @endif

  <form action="{{route('email.create')}}" method="post">
    {{ csrf_field() }}
    <input type="text" name='email'>
    <button type="submit" class="btn btn-success navbar-btn">Sign in</button>
  </form>

</body>
</html>