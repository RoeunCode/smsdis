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
        <h1>អ្នកគ្មានសិទ្ធប្រប្រើប្រាសមុខងារនេះទេ !</h1>
        <h1>You Don't Have Permission To Continue !</h1>
{{--        <h3>The Web Developer Has Been Notified</h3>--}}
        <img src="https://media.giphy.com/media/3HAYjf9agsx7U3aXKXm/giphy.gif" alt="">
        <br>
        <h4>
            <a class="dropdown-item" href="{{ route('home') }}"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;<h3>Go Back</h3></a>
        </h4>
    </div>
</div>
</body>
</html>