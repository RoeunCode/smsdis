{{--@extends('layouts.app')--}}

{{--@section('content')--}}
{{--<div class="container">--}}
{{--    <div class="row justify-content-center">--}}
{{--        <div class="col-md-8">--}}
{{--            <div class="card">--}}
{{--                <div class="card-header">{{ __('Login') }}</div>--}}

{{--                <div class="card-body">--}}
{{--                    <form method="POST" action="{{ route('login') }}">--}}
{{--                        @csrf--}}

{{--                        <div class="form-group row">--}}
{{--                            <label for="username" class="col-md-4 col-form-label text-md-right">{{ __('UserName') }}</label>--}}

{{--                            <div class="col-md-6">--}}
{{--                                <input id="username" type="username" class="form-control @error('username') is-invalid @enderror" name="username" value="{{ old('username') }}" required autocomplete="username" autofocus>--}}

{{--                                @error('username')--}}
{{--                                    <span class="invalid-feedback" role="alert">--}}
{{--                                        <strong>{{ $message }}</strong>--}}
{{--                                    </span>--}}
{{--                                @enderror--}}
{{--                            </div>--}}
{{--                        </div>--}}

{{--                        <div class="form-group row">--}}
{{--                            <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>--}}

{{--                            <div class="col-md-6">--}}
{{--                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">--}}

{{--                                @error('password')--}}
{{--                                    <span class="invalid-feedback" role="alert">--}}
{{--                                        <strong>{{ $message }}</strong>--}}
{{--                                    </span>--}}
{{--                                @enderror--}}
{{--                            </div>--}}
{{--                        </div>--}}

{{--                        <div class="form-group row">--}}
{{--                            <div class="col-md-6 offset-md-4">--}}
{{--                                <div class="form-check">--}}
{{--                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>--}}

{{--                                    <label class="form-check-label" for="remember">--}}
{{--                                        {{ __('Remember Me') }}--}}
{{--                                    </label>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </div>--}}

{{--                        <div class="form-group row mb-0">--}}
{{--                            <div class="col-md-8 offset-md-4">--}}
{{--                                <button type="submit" class="btn btn-primary">--}}
{{--                                    {{ __('Login') }}--}}
{{--                                </button>--}}

{{--                                @if (Route::has('password.request'))--}}
{{--                                    <a class="btn btn-link" href="{{ route('password.request') }}">--}}
{{--                                        {{ __('Forgot Your Password?') }}--}}
{{--                                    </a>--}}
{{--                                @endif--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    </form>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}
{{--    </div>--}}
{{--</div>--}}
{{--@endsection--}}
        <!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="DIU Student Management System" />
    <meta name="author" content="KhmerDev" />
    <title>Dewey Student Management System</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="{{asset('theme/custom/login.css')}}">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <!------ Include the above in your HEAD tag ---------->
</head>
<style>
    @media only screen and (max-width: 990px) {
        #fadeshow1 {
            display: none;
        }
    }
    @media only screen and (max-width: 990px) {
        #spad {
            margin-left: 20px;
            margin-right: 20px;
        }
    }
    .login-sec h2 {
        margin-bottom: 30px;
        font-weight: 800;
        font-size: 45px;
        color: #3c763d;
    }
    .login-sec h2:after {
        content: " ";
        width: 100px;
        height: 5px;
        background: #ff6a00;
        display: block;
        margin-top: 20px;
        border-radius: 3px;
        margin-left: auto;
        margin-right: auto;
    }
</style>
<body>
<section class="login-block">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 login-sec shadow-lg animated slideInDown slow" style="border-radius: 2%;" id="spad">
                <h2 class="text-center">DEWEY SMS</h2>
                <form method="POST" action="{{ route('login') }}">
                    <div class="form-group">
                        @csrf
                        <label for="exampleInputEmail1" class="text-uppercase" style="color: #ff6a00">Username</label>
                        <input id="username" type="username"
                               class="form-control @error('username') is-invalid @enderror" name="username"
                               value="{{ old('username') }}" required autocomplete="username" autofocus>
                        @error('username')
                        <span class="invalid-feedback" role="alert">
                         <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1" class="text-uppercase"
                               style="color: #ff6a00">Password</label>
                        <input id="password" type="password"
                               class="form-control @error('password') is-invalid @enderror" name="password" required
                               autocomplete="current-password">

                        @error('password')
                        <span class="invalid-feedback" role="alert">
                         <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>


                    <div class="form-check">
                        {{--                        <label class="form-check-label">--}}
                        {{--                            <input type="checkbox" class="form-check-input">--}}
                        {{--                            <small>Remember Me</small>--}}
                        {{--                        </label>--}}
                        <button style="background: #3c763d" type="submit" class="btn btn-login float-right">Login</button>
                    </div>

                </form>
                <div class="copy-text">Developed by <a href="" style="color: #ff6a00">Dewey ICT Office</a></div>
            </div>
            <div class="col-lg-8 banner-sec animated slideInDown slow" id="fadeshow1">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        {{--                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>--}}
                        {{--                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>--}}
                    </ol>
                    <div class="carousel-inner shadow-sm" role="listbox" style="border-radius: 2%;">
                        <div class="carousel-item active">
                            <img class="d-block img-fluid"
                                 src="{{asset('theme/pic/5.jpg')}}"
                                 alt="First slide" height="100%" width="100%">
                            <div class="carousel-caption d-none d-md-block">
                                {{--                                <div class="banner-text">--}}
                                {{--                                    <h3>Elite Student Management System</h3>--}}
                                {{--                                    <p>ផ្ដល់ភាពងាយស្រួលក្នុងការគ្រប់គ្រងពិន្ទុ វត្តមាន និង របាយការណ៍និស្សិត</p>--}}
                                {{--                                </div>--}}
                            </div>
                        </div>
                        {{--                        <div class="carousel-item">--}}
                        {{--                            <img class="d-block img-fluid"--}}
                        {{--                                 src="{{asset('theme/pic/1.jpg')}}"--}}
                        {{--                                 alt="First slide" width="100%">--}}
                        {{--                            <div class="carousel-caption d-none d-md-block">--}}
                        {{--                                <div class="banner-text">--}}
                        {{--                                    --}}{{--                                    <h3>ប្រព័ន្ធគ្រប់គ្រងទិន្នន័យនិស្សិត</h3>--}}
                        {{--                                    --}}{{--                                    <p>ផ្ដល់ភាពងាយស្រួលក្នុងការគ្រប់គ្រងពិន្ទុ វត្តមាន និង របាយការ្យណ៍និស្សិត</p>--}}
                        {{--                                </div>--}}
                        {{--                            </div>--}}
                        {{--                        </div>--}}
                        {{--                        <div class="carousel-item">--}}
                        {{--                            <img class="d-block img-fluid"--}}
                        {{--                                 src="{{asset('theme/pic/2.jpg')}}"--}}
                        {{--                                 alt="First slide" width="100%">--}}
                        {{--                            <div class="carousel-caption d-none d-md-block">--}}
                        {{--                                <div class="banner-text">--}}
                        {{--                                    --}}{{--                                    <h3>ប្រព័ន្ធគ្រប់គ្រងទិន្នន័យនិស្សិត</h3>--}}
                        {{--                                    --}}{{--                                    <p>ផ្ដល់ភាពងាយស្រួលក្នុងការគ្រប់គ្រងពិន្ទុ វត្តមាន និង របាយការ្យណ៍និស្សិត</p>--}}
                        {{--                                </div>--}}
                        {{--                            </div>--}}
                        {{--                        </div>--}}
                    </div>

                </div>
            </div>
        </div>
</section>

</body>
</html>
