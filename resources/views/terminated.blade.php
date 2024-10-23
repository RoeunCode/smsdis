<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Elite System</title>
    <link rel="apple-touch-icon" href="{{asset('theme/pic/logo.png')}}" />
    <link rel="icon" href="{{asset('theme/pic/logo.png')}}" />
    <link rel="stylesheet" id="css-bootstrap" href="{{asset('theme/dist/assets/css/bootstrap.css')}}" />
</head>
<body>
    <div class="container">
        <div class="row" style="margin-top: 20%; text-align: center">
            <h1>Sorry Your User Account Has Been Terminated !</h1>
            <h3>Please Login With Another Account Or Contact System Administrator</h3>
            <img src="https://media.giphy.com/media/7yLUuZxtWY8Fi/giphy.gif" alt="">
            <br>
            <h4><a class="dropdown-item" href="{{ route('logout') }}"
                   onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                    <i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;Go Back To Login
                </a></h4>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
        </div>
    </div>
</body>
</html>