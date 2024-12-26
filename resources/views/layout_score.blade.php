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
        .swal2-popup {
      font-size: 12px !important;

    }

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

    <main class="">
        <div class="container-fluid p-y-md">
            <div id="wait" class="load"><img src='{{asset('theme/pic/bmo.gif')}}' width="150"/><br>Loading...</div>
            @yield('content')
        </div>
    </main>


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
