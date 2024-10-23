@extends('layout')
@section('content')
    <style>
        td {
            color: #5bc0de;
        }
    </style>
    <style>
        button.dt-button, div.dt-button, a.dt-button {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            color: white;
            background: #7dc855;
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #ccc;
            float: left;

        }

        .card > .nav-tabs > li > a:hover {
            color: #5bc0de;
            background-color: transparent;
            border-color: transparent;
        }

        .card > .nav-tabs.nav-stacked > li.active > a, .card > .nav-tabs.nav-stacked > li.active > a:hover, .card > .nav-tabs.nav-stacked > li.active > a:focus {
            box-shadow: inset -2px 0 #5bc0de;
        }
    </style>
    <!-- Page Content -->
    <div class="card card-profile">
        <div class="card-profile-img bg-img" style="background-image: url({{asset('theme/pic/cover.jpg')}});">
        </div>
        <div class="card-block card-profile-block text-xs-center text-sm-left">
            @php if($d->photo == ""){ $src = asset('theme/pic/nophoto.png');}else{$src = asset('uploads/photo/'.$d->photo.'');} @endphp
            <img class="img-avatar img-avatar-96" src="{{$src}}" alt=""/>
            <div class="profile-info font-500"> {{$d->kh_name}}
                <div class="small text-muted m-t-xs">{{$d->dob}}</div>
            </div>
            <div>
                <ul style="margin-top: -30px;"
                    class="nav navbar-nav navbar-right navbar-toolbar hidden-sm hidden-xs">
                    <li class="dropdown dropdown-profile">
                        <a href="javascript:void(0)" data-toggle="dropdown">
                            <span class="m-r-sm text-muted">@lang('student.st')<span class="caret"></span></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li>
                                <button style="color: #333333" class="btn btn-link" data-toggle="modal"
                                        data-target="#modal-fadein" type="button"><i class="fas fa-user"></i>&nbsp;&nbsp;@lang('student.pro')
                                </button>
                            </li>
                            <li>
                                <a href="{{route('student.edit',$d->id)}}"><i class="fas fa-edit"></i>&nbsp;&nbsp;@lang('student.edit')</a>
                            </li>
                            <li>
                                <button style="color: #333333" class="btn btn-link" data-toggle="modal"
                                        data-target="#modal-violin" type="button"><i class="fas fa-ban"></i>&nbsp;&nbsp;@lang('student.vio')
                                </button>
                            </li>
                            <li>
                                <a onclick="return confirm('Are You Sure You Want To Delete ?')" href="{{route('stdl',$d->id)}}"><i class="fas fa-trash"></i>&nbsp;&nbsp;@lang('student.del')</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    {{--Modal--}}
    <div class="modal fade" id="modal-fadein" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="card-header bg-blue bg-inverse">
                    <h4>@lang('student.pro')</h4>
                    <ul class="card-actions">
                        <li>
                            <button data-dismiss="modal" type="button"><i class="ion-close"></i></button>
                        </li>
                    </ul>
                </div>
                <form action="{{route('proup')}}" enctype="multipart/form-data" method="post">
                    <div class="card-block">
                        @lang('student.sel')
                        @csrf
                        <input type="hidden" name="id" value="{{$d->id}}">
                        <input class="form-control" name="photo" type="file" id="photo" onchange="loadFile(event)"
                               required>
                        <center>
                            <img style="max-height:100px;margin-top: 10px;" id="output"/>
                        </center>
                        <script>
                            var loadFile = function (event) {
                                var output = document.getElementById('output');
                                output.src = URL.createObjectURL(event.target.files[0]);
                            };
                        </script>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-sm btn-app-blue" type="submit"><i class="ion-checkmark"></i> @lang('student.sel_c')
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    {{--EndModal--}}
    {{--Modal Violation--}}
    <div class="modal fade" id="modal-violin" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="card-header bg-red bg-inverse">
                    <h4>@lang('student.m4')</h4>
                    <ul class="card-actions">
                        <li>
                            <button data-dismiss="modal" type="button"><i class="ion-close"></i></button>
                        </li>
                    </ul>
                </div>
                <div class="card-block">
                    <div class="form-group">
                        <input type="hidden" id="txtid" value="{{$d->id}}">
                        <label for="">@lang('student.v_add')</label>
                        <input class="form-control" id="desc" type="text">
                        <label for="">@lang('student.d')</label>
                        <input class="form-control" id="date" type="date">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-sm btn-app-blue" id="violin"><i class="ion-checkmark"></i> @lang('student.add')
                    </button>
                </div>
            </div>
        </div>
    </div>
    {{--EndModal Violation--}}
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <ul class="nav nav-tabs nav-stacked">
                    <li class="active">
                        <a href="#profile-tab1" data-toggle="tab">@lang('student.m1')</a>
                    </li>
                    <li>
                        <a href="#profile-tab2" data-toggle="tab">@lang('student.m2')</a>
                    </li>
                    <li>
                        <a href="#profile-tab3" data-toggle="tab">@lang('student.m3')</a>
                    </li>
                    <li>
                        <a href="#profile-tab4" data-toggle="tab">@lang('student.m4')</a>
                    </li>
                </ul>
                <!-- .nav-tabs -->
            </div>
            <!-- .card -->
        </div>
        <!-- .col-md-4 -->

        <div class="col-md-9">
            <div class="card">
                <div class="card-block tab-content">
                    <!-- Profile tab 1 -->
                    <div class="tab-pane fade in active" id="profile-tab1">
                        <h4 class="m-t-sm m-b">@lang('student.m1')</h4>
                        <table class="table">
                            <tr>
                                <th>Student ID :&nbsp;</th>
                                <td>{{$d->student_id}}</td>
                            </tr>
                            <tr>
                                <th>@lang('student.m1_name')</th>
                                <td>{{$d->kh_name}}</td>
                            </tr>
                            <tr>
                                <th>@lang('student.m1_sex')</th>
                                <td>{{$d->sex}}</td>
                            </tr>
                            <tr>
                                <th>@lang('student.m1_dob')</th>
                                <td>{{$d->dob}}</td>
                            </tr>
                            <tr>
                                <th>@lang('student.m1_pob')</th>
                                <td>ភូមិ {{$d->pob_v}} ឃុំ/សង្កាត់ {{$d->pob_c}} ស្រុក {{$d->pob_d}} ខេត្ត {{$d->pob_p}}</td>
                            </tr>
                            <tr>
                                <th>@lang('student.m1_add')</th>
                                <td>ភូមិ {{$d->cur_v}} ឃុំ/សង្កាត់ {{$d->cur_c}} ស្រុក {{$d->cur_d}} ខេត្ត {{$d->cur_p}}</td>
                            </tr>
                        </table>
                    </div>
                    <!-- End profile tab 1 -->
                    <!-- Profile tab 2 -->
                    <div class="tab-pane fade in" id="profile-tab2">
                        <h4 class="m-t-sm m-b">@lang('student.m2')</h4>
                        <table class="table">
                            <tr class="bg-blue bg-inverse">
                                <th colspan="2" style="text-align: center">@lang('student.m2_kh')</th>
                            </tr>
                            <tr>
                                <th>@lang('student.m2_id')</th>
                                <td>{{$d->old_id}}</td>
                            </tr>
                            <tr>
                                <th>@lang('student.m2_from')</th>
                                <td>{{$d->old_school}}</td>
                            </tr>
                            <tr>
                                <th>@lang('student.m2_grade')</th>
                                <td>{{$d->old_grade}}</td>
                            </tr>
                            <tr>
                                <th>@lang('student.m2_year')</th>
                                <td>{{$d->old_year}}</td>
                            </tr>
                            <tr class="bg-blue bg-inverse">
                                <th colspan="2" style="text-align: center">English School</th>
                            </tr>
                            <tr>
                                <th>Exchanged From :&nbsp;</th>
                                <td>{{$d->old_en_school}}</td>
                            </tr>
                            <tr>
                                <th>Grade :&nbsp;</th>
                                <td>{{$d->old_en_grade}}</td>
                            </tr>
                        </table>
                    </div>
                    <!-- End profile tab 2 -->
                    <!-- Profile tab 3 -->
                    <div class="tab-pane fade in" id="profile-tab3">
                        <h4 class="m-t-sm m-b">@lang('student.m3')</h4>
                        <table class="table">
                            <tr class="bg-blue bg-inverse">
                                <th class="bg-cyan" colspan="2" style="text-align: center">@lang('student.m3_fa')</th>
                                <th colspan="2" style="text-align: center">@lang('student.m3_mo')</th>
                            </tr>
                            <tr>
                                <th>@lang('student.kh')</th>
                                @foreach($fa as $f)
                                    <td>{{$f->kh_name}}</td>
                                @endforeach
                                <th>@lang('student.kh')</th>
                                @foreach($mo as $m)
                                    <td>{{$m->kh_name}}</td>
                                @endforeach
                            </tr>
                            <tr>
                                <th>@lang('student.en')</th>
                                @foreach($fa as $f)
                                    <td>{{$f->en_name}}</td>
                                @endforeach
                                <th>@lang('student.en')</th>
                                @foreach($mo as $m)
                                    <td>{{$m->en_name}}</td>
                                @endforeach
                            </tr>
                            <tr>
                                <th>@lang('student.dob')</th>
                                @foreach($fa as $f)
                                    <td>{{$f->dob}}</td>
                                @endforeach
                                <th>@lang('student.dob')</th>
                                @foreach($mo as $m)
                                    <td>{{$m->dob}}</td>
                                @endforeach
                            </tr>
                            <tr>
                                <th>@lang('student.m3_nat')</th>
                                @foreach($fa as $f)
                                    <td>{{$f->nat}}</td>
                                @endforeach
                                <th>@lang('student.m3_nat')</th>
                                @foreach($mo as $m)
                                    <td>{{$m->nat}}</td>
                                @endforeach
                            </tr>
                            <tr>
                                <th>@lang('student.m3_occ')</th>
                                @foreach($fa as $f)
                                    <td>{{$f->job}}</td>
                                @endforeach
                                <th>@lang('student.m3_occ')</th>
                                @foreach($mo as $m)
                                    <td>{{$m->job}}</td>
                                @endforeach
                            </tr>
                            <tr>
                                <th>@lang('student.m3_phone')</th>
                                @foreach($fa as $f)
                                    <td>{{$f->phone}}</td>
                                @endforeach
                                <th>@lang('student.m3_phone')</th>
                                @foreach($mo as $m)
                                    <td>{{$m->phone}}</td>
                                @endforeach
                            </tr>
                            <tr>
                                <th>Facebook</th>
                                @foreach($fa as $f)
                                    <td>{{$f->facebook}}</td>
                                @endforeach
                                <th>Facebook</th>
                                @foreach($mo as $m)
                                    <td>{{$m->facebook}}</td>
                                @endforeach
                            </tr>
                            <tr>
                                <th>Email</th>
                                @foreach($fa as $f)
                                    <td>{{$f->email}}</td>
                                @endforeach
                                <th>Email</th>
                                @foreach($mo as $m)
                                    <td>{{$m->email}}</td>
                                @endforeach
                            </tr>
                            <tr>
                                <th>@lang('student.st')</th>
                                @foreach($fa as $f)
                                    <td>@php if($f->alive == 1){echo "Alive";}else{echo "Deceased";} @endphp</td>
                                @endforeach
                                <th>@lang('student.st')</th>
                                @foreach($mo as $m)
                                    <td>@php if($m->alive == 1){echo "Alive";}else{echo "Deceased";} @endphp</td>
                                @endforeach
                            </tr>
                            <tr>
                                <th>@lang('student.m1_add')</th>
                                @foreach($fa as $f)
                                    <td>ភូមិ {{$f->pob_v}} ឃុំ/សង្កាត់ {{$f->pob_c}} ស្រុក {{$f->pob_d}} ខេត្ត {{$f->pob_p}}</td>
                                @endforeach
                                <th>@lang('student.m1_add')</th>
                                @foreach($mo as $m)
                                    <td>ភូមិ {{$m->pob_v}} ឃុំ/សង្កាត់ {{$m->pob_c}} ស្រុក {{$m->pob_d}} ខេត្ត {{$m->pob_p}}</td>
                                @endforeach
                            </tr>
                        </table>
                    </div>
                    <!-- End profile tab 3 -->
                    <!-- Profile tab 4 -->
                    <div class="tab-pane fade in" id="profile-tab4">
                        <h4 class="m-t-sm m-b">@lang('student.m4')</h4>
                        <table class="table">
                            <tr>
                                <th>Description</th>
                                <th>Date</th>
                            </tr>
                            @foreach($vl as $v)
                                <tr>
                                    <td style="color:tomato">{{ $v->description }}</td>
                                    <td style="color:tomato">{{ $v->date }}</td>
                                </tr>
                            @endforeach
                        </table>
                    </div>
                    <!-- End profile tab 4 -->
                </div>
            </div>
            <!-- .card-block .tab-content -->
        </div>
        <!-- .card -->
    </div>
    <!-- .col-md-8 -->
    <!-- .row -->
    <!-- End Page Content -->
@endsection
@section('footer')
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://nightly.datatables.net/buttons/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
{{--    <script>--}}
{{--        $(document).ready(function () {--}}
{{--            $('#subj').DataTable({--}}
{{--                dom: 'Bfrtip',--}}
{{--                buttons: [--}}
{{--                    {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},--}}
{{--                    {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF'},--}}
{{--                    {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;បង្ហាញទិន្ន័យ'},--}}
{{--                    {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;ទាញទិន្ន័យជា Excel'},--}}

{{--                ],--}}

{{--                "language": {--}}
{{--                    "lengthMenu": "បង្ហាញ _MENU_ ចំនួនទិន្ន៏យក្នុងទំព័រ",--}}
{{--                    "zeroRecords": "មិនមានទិន្ន័យ",--}}
{{--                    "info": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",--}}
{{--                    "infoEmpty": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",--}}
{{--                    "search": "ស្វែងរក",--}}
{{--                    "infoFiltered": "(filtered from _MAX_ total records)",--}}
{{--                    "paginate": {--}}
{{--                        "previous": "ថយក្រោយ",--}}
{{--                        "next": "ទៅមុខ"--}}
{{--                    }--}}
{{--                }--}}
{{--            })--}}
{{--        })--}}
{{--    </script>--}}
    <script>
        $('#violin').click(()=>{
            var id = $('#txtid').val();
            var desc = $('#desc').val();
            var date = $('#date').val();
            if(desc == '' || date  == ''){
                Swal.fire(
                    'Error !',
                    'Please Enter Required Fields !',
                    'error'
                )
            }else{
                $.ajax({
                    url:'{{ route('violin') }}',
                    type:'POST',
                    data:{'_token':'{{ csrf_token() }}',student_id:id,description:desc,date:date},
                    success:function(r){
                        if(r  == 1){
                            Swal.fire(
                                'Success !',
                                'Violation Added Successfully !',
                                'success'
                            ).then(function () {
                                location.reload()
                            })
                        }
                    }
                })
            }
        })
    </script>
@endsection