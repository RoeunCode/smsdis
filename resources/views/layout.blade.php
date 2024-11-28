<!DOCTYPE html>
<html class="app-ui">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Dewey International School</title>
    <meta name="description" content="Dewey International School" />
    <meta name="author" content="Sela" />
    <meta name="robots" content="noindex, nofollow" />
    <link rel="apple-touch-icon" href="{{asset('theme/pic/logo.png')}}" />
    <link rel="icon" href="{{asset('theme/pic/logo.png')}}" /><link rel="icon" href="{{asset('theme/pic/logo.png')}}" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,400italic,500,900%7CRoboto+Slab:300,400%7CRoboto+Mono:400" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css">
    <link rel="stylesheet" id="css-ionicons" href="{{asset('theme/dist/assets/css/ionicons.css')}}" />
    <link rel="stylesheet" id="css-bootstrap" href="{{asset('theme/dist/assets/css/bootstrap.css')}}" />
    <link rel="stylesheet" id="css-app" href="{{asset('theme/dist/assets/css/app.css')}}" />
    <link rel="stylesheet" id="css-app-custom" href="{{asset('theme/dist/assets/css/app-custom.css')}}" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />
    <link rel="stylesheet" href="{{asset('theme/dist/assets/js/plugins/select2/select2.min.css')}}" />
    <link rel="stylesheet" href="{{asset('theme/dist/assets/js/plugins/select2/select2-bootstrap.css')}}" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    {{--<link href="https://fonts.googleapis.com/css2?family=Battambang&display=swap" rel="stylesheet">--}}
    <style>
        @media print {
            body {
                -webkit-print-color-adjust: exact;
            }
            .pagebreak { clear: both;
                page-break-after: always; }
        }
        .test {
            background-color: blue;
            color: white;
        }
        @font-face {
            font-family: 'Battambang', cursive;
            {{--src: url('{{ public_path('fonts/KhmerOSbattambang.tff') }}');--}}
            src:url("https://fonts.googleapis.com/css2?family=Battambang&display=swap");
        }
        table > thead {
            background-color:#2A629C;
            color: white;
            font-size: 14px;
        }
    </style>
</head>
<style>
    ul {
        list-style-type: none;
    }
    table.dataTable thead .sorting:after {
        opacity: 0.2;
        content: "\e150";
        display: none;
    }
    table.dataTable thead .sorting_asc:after {
        content: "\e155";
        display: none;
    }
    .load {
        display: none;
        width: 200px;
        border: 1px solid black;
        position: absolute;
        top: 50%;
        left: 50%;
        padding: 2px;
        border: none;
        font-size: 16px;
        font-weight: bold;
        text-align: center;
        color: dimgrey;
        z-index: 999;
    }
    table.dataTable thead .sorting_desc:after {
        content: '\f35f';
        display: none;
    }
</style>
<body class="app-ui layout-has-drawer layout-has-fixed-header" style="font-family: 'Battambang'">
<div class="app-layout-canvas">
    <div class="app-layout-container">
        <aside class="app-layout-drawer">
            <div class="app-layout-drawer-scroll">
                <div id="logo" class="drawer-header">
                    <a href="/"><img class="img-responsive" src="{{asset('theme/dist/assets/img/logo/dis2.png')}}" title="AppUI" alt="AppUI" /></a>
                </div>
                <nav class="drawer-main">
                    <ul class="nav nav-drawer">
                    <li class="nav-item nav-drawer-header">MAIN NAVIGATION</li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="fas fa-user-graduate"></i>@lang('layout.m1')</a>
                            <ul class="nav nav-subnav">
                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('student.create')}}">Register Student</a>
                                </li>
                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('stdd')}}">@lang('layout.m1_s2')</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="fas fa-university"></i>Class & Grade</a>
                            <ul class="nav nav-subnav">
                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('class.index')}}">View All Class</a>
                                </li>

                                <li class="nav-item">
                                    <a href="{{route('classroom.index')}}">Create ClassRoom</a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('grade.index')}}">Create Grade</a>
                                </li>

                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="fas fa-clipboard-list"></i>Score [ C C ]</a>
                            <ul class="nav nav-subnav">
                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('cambodia-curriculum.index')}}">Primary Score</a>
                                </li>

                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('secondary-curriculum.index')}}">Secondary</a>
                                </li>
                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('uppersecondary.index')}}">Upper Secondary</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="fas fa-clipboard-list"></i>Report</a>
                            <ul class="nav nav-subnav">
                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('cambodia-curriculum.index')}}">Score Primary CC By Month</a>
                                </li>



                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="fas fa-sticky-note"></i>Attandacne</a>
                            <ul class="nav nav-subnav">
                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('attendance.index')}}">Create Attandance</a>
                                </li>


                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="fas fa-university"></i>Academic Year</a>
                            <ul class="nav nav-subnav">
                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('academic_year.index')}}">Create Academic</a>
                                </li>


                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="fas fa-chalkboard-teacher"></i>Teacher</a>
                            <ul class="nav nav-subnav">
                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('teacher.index')}}">Create Teacher</a>
                                </li>


                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="fas fa-cog"></i>Setting</a>
                            <ul class="nav nav-subnav">
                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('user.index')}}">Create User</a>
                                </li>
                                <li>
                                    {{--<a href="{{route('student.index')}}">@lang('layout.m1_s1')</a>--}}{{-- Sela URL--}}
                                    <a href="{{route('campus.index')}}">Campus</a>
                                </li>
                                <li>
                                    <a class="dropdown-item btn-link" href="{{ route('logout') }}"
                                    onclick="event.preventDefault();
                                              document.getElementById('logout-form').submit();">
                                   Logout
                                 </a>

                                 <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                     @csrf
                                 </form>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <div class="modal fade" id="acpw" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="card-header bg-blue bg-inverse">
                        <h4 id="modcap">Change Your Password</h4>
                        <ul class="card-actions">
                            <li>
                                <button data-dismiss="modal" type="button"><i
                                            class="ion-close"></i></button>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <div class="form-group">
                            <label>Old Password</label>
                            <input class="form-control" type="password" id="old">
                        </div>
                        <div class="form-group">
                            <label>New Password</label>
                            <input class="form-control" type="password" id="new">
                        </div>
                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input class="form-control" type="password" id="cf">
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-sm btn-app btn-app-blue" type="button"
                                    id="ccpw"><i class="ion-checkmark"></i>
                                Change
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <header class="app-layout-header">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar-collapse" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <button class="pull-left hidden-lg hidden-md navbar-toggle" type="button" data-toggle="layout" data-action="sidebar_toggle">
                            <span class="sr-only">Toggle drawer</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <span class="navbar-page-title">
                  @yield('header')
                </span>
                    </div>
                    <div class="collapse navbar-collapse" id="header-navbar-collapse">
                        <ul class="nav navbar-nav navbar-right navbar-toolbar hidden-sm hidden-xs">
                            <li class="dropdown dropdown-profile">
                                <a style="margin-top: 13px;" href="javascript:void(0)" data-toggle="dropdown">
                                    <span class="m-r-sm bg-gray-lighter btn btn-pill">{{ucfirst(\Illuminate\Support\Facades\Auth::user()->username)}}<span class="caret"></span></span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right">
                                                                        <li class="dropdown-header">
                                                                            Pages
                                                                        </li>
                                    <li>
                                        <button data-toggle="modal" data-target="#acpw" type="button" class="btn-link" id="pw">&nbsp;&nbsp;<i class="fas fa-lock"></i>&nbsp;&nbsp;Change Password</button>
                                    </li>
                                    <li>
                                        <a class="dropdown-item btn-link" href="{{ route('logout') }}"
                                           onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                            <i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;Logout
                                        </a>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            @csrf
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right navbar-toolbar hidden-sm hidden-xs">
                            <li class="dropdown dropdown-profile">
                                <a style="margin-top: 13px;" href="javascript:void(0)" data-toggle="dropdown">
                                    <span class="m-r-sm bg-gray-lighter btn btn-pill">@lang('layout.langu')<span class="caret"></span></span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li class="dropdown-header">
                                        Languages
                                    </li>
                                    <li>
                                        <a href="{{route('switchln','en')}}"><img class="img-circle" height="30px" src="{{asset('theme/pic/gb.svg')}}" alt=""> English</a>
                                        <a href="{{route('switchln','kh')}}"><img class="img-circle" height="30px" src="{{asset('theme/pic/kh.svg')}}" alt=""> ភាសារខ្មែរ</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <!-- .navbar-right -->
                    </div>
                </div>
            </nav>
        </header>
        <main class="app-layout-content">
            <div class="container-fluid p-y-md">
                <div id="wait" class="load"><img src='{{asset('theme/pic/bmo.gif')}}' width="150"/><br>Loading...</div>
                @yield('content')
            </div>
        </main>

    </div>
</div>
<div class="app-ui-mask-modal"></div>
<script src="{{asset('theme/dist/assets/js/core/jquery.min.js')}}"></script>
<script src="{{asset('theme/dist/assets/js/core/bootstrap.min.js')}}"></script>
<script src="{{asset('theme/dist/assets/js/core/jquery.slimscroll.min.js')}}"></script>
<script src="{{asset('theme/dist/assets/js/core/jquery.scrollLock.min.js')}}"></script>
<script src="{{asset('theme/dist/assets/js/core/jquery.placeholder.min.js')}}"></script>
<script src="{{asset('theme/dist/assets/js/app.js')}}"></script>
<script src="{{asset('theme/dist/assets/js/app-custom.js')}}"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
<script src="{{asset('theme/dist/assets/js/plugins/select2/select2.full.min.js')}}"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script>
    function vali(arr) {
        var i = 0;
        var str = '';
        for (i = 0; i < arr.length; i++) {
            // alert('hero'+i+'')
            var input = $('#' + arr[i] + '').val()
            if (input == "") {
                str += arr[i] + " is required ";
            }
        }
        var st = false;
        if (str === '') {
            st = true
        } else {
            st = false
        }
        return st
    }
</script>
   @yield('footer')
<script>
    // function end(){
    //     setTimeout(function () {
    //         $("#wait").css("display", "none");
    //     },0)
    // }
    //
    // $(document).ajaxStart(function () {
    //     $("#wait").css("display", "block");
    // });
    //
    // $(document).ajaxComplete(function () {
    //     // $("#wait").css("display", "none");
    //     end();
    // });
</script>
<script>
    $('#ccpw').click(function () {
        var arr = ['old','new','cf'];
        if(!vali(arr)){
            Swal.fire(
                'Error',
                'Please Enter All Required Information !',
                'error'
            )
        }else{
            var op = $('#old').val();
            var np = $('#new').val();
            var cp = $('#cf').val();
            if(np == cp){
                $.ajax({
                    url:'{{route("uchangepw")}}',
                    type:'POST',
                    data:{'_token':'{{csrf_token()}}','old':op,'new':np},
                    success:function (r) {
                        if (r == 1) {
                            Swal.fire(
                                'Success !',
                                'Password Updated Successfully',
                                'success'
                            ).then(function () {
                                location.reload()
                            })
                        }else{
                            Swal.fire(
                                'Failed !',
                                'Old Password Is Invalid Please Try Again !',
                                'error'
                            )
                        }
                    }
                })
            }else{
                Swal.fire(
                    'Warning',
                    'Passwords Don\'t Match !',
                    'warning'
                )
            }
        }
    })
</script>
</body>
</html>

