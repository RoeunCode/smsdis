@extends('layout')
@section('content')
    <style>
        .btn-white {
            color: #358ed7;
            background-color: #fff;
            border-color: rgba(0, 0, 0, 0.1);
        }
        label{
            color: #616161;
        }
    </style>
    <div class="col-md-12">
        <!-- Card Tabs Justified Default Style -->
        <div class="card">
            <div class="card-header bg-blue bg-inverse">
                <h4>@lang('teacher.head')</h4>
                <div style="float: right">

                    <div class="modal fade" id="modal-add" tabindex="-1" role="dialog"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="card-header bg-blue bg-inverse">
                                    <h4 id="modcap">@lang('teacher.m_head')</h4>
                                    <ul class="card-actions">
                                        <li>
                                            <button data-dismiss="modal" type="button"><i class="ion-close"></i></button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-block">
                                    <input type="hidden" id="hid" value="">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>@lang('teacher.m_khn')</label>
                                                <input type="text" id="kh_name" class="form-control" placeholder="@lang('teacher.kh_ph')">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>@lang('teacher.m_enn')</label>
                                                <input type="text" id="en_name" class="form-control" placeholder="Enter Full Name In English">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>@lang('teacher.m_sex')</label>
                                                <select class="form-control" id="sex">
                                                    <option value="M">Male</option>
                                                    <option value="F">Female</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>@lang('teacher.m_dob')</label>
                                                <input type="date" id="dob" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>@lang('teacher.m_nat')</label>
                                                <select class="form-control" id="nat">
                                                    <option value="ខ្មែរ">ខ្មែរ</option>
                                                    <option value="បរទេស">បរទេស</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>@lang('teacher.m_phone')</label>
                                                <input type="text" id="phone" class="form-control" placeholder="@lang('teacher.phone_ph')">
                                                <input type="hidden" value="{{ \Illuminate\Support\Facades\Auth::user()->camp_id }}" id="campid"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>@lang('teacher.m_fb')</label>
                                                <input type="text" id="facebook" class="form-control" placeholder="Enter facebook name">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>@lang('teacher.m_email')</label>
                                                <input type="text" id="email" class="form-control" placeholder="Enter Email">
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-6">
                                            <div class="form-group">
                                                <label>@lang('teacher.m_pro')</label>
                                                <input type="text" id="pro" class="form-control" placeholder="@lang('teacher.pro_ph')">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-sm btn-app btn-app-blue" type="button"
                                                id="mf"><i class="ion-checkmark"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-block">
                <button class="btn  btn-primary btn-sm" id="add"><i class="fa fa-plus"></i>&nbsp;&nbsp;Create Teacher</button>
                <div class="table-responsive" style="margin-top: 20px">
                    <table id="dt" class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="display: none">ID</th>
                            <th style="text-align: center">@lang('teacher.khn')</th>
                            <th style="text-align: center">@lang('teacher.enn')</th>
                            <th style="text-align: center">@lang('teacher.sex')</th>
                            <th style="text-align: center">@lang('teacher.dob')</th>
                            <th style="text-align: center">@lang('teacher.nat')</th>
                            <th style="text-align: center">@lang('teacher.pro')</th>
                            <th style="text-align: center">@lang('teacher.phone')</th>
                            <th style="text-align: center">@lang('teacher.email')</th>
                            <th style="text-align: center">@lang('teacher.fb')</th>
                            <th style="text-align: center">@lang('teacher.st')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $d)
                            <tr style="text-align: center">
                                <td style="display: none">{{$d->id}}</td>
                                <td>{{$d->kh_name}}</td>
                                <td>{{$d->en_name}}</td>
                                <td>{{$d->sex}}</td>
                                <td>{{$d->dob}}</td>
                                <td>{{$d->nat}}</td>
                                <td>{{$d->pro}}</td>
                                <td>{{$d->phone}}</td>
                                <td>{{$d->email}}</td>
                                <td>{{$d->facebook}}</td>
                                <td>
                                    <button class="btn btn-primary btn-sm edit"><i class="fa fa-pen"></i></button>
                                    <a class="btn btn-app-red btn-sm" onclick="return confirm('Are You Sure You Want To Delete ?')" href="{{route('tdl',$d->id)}}"><i class="fa fa-trash"></i></a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- End Card Tabs Justified Alternative Style -->
    </div>
@endsection
@section('footer')
    <script>
        $(document).ready(function () {
            $('#dt').DataTable();
        });
    </script>
    <script>
        $('#add').click(()=>{
            var add = "@lang('teacher.m_btn_add')";
            $('#mf').html(add)
            $('#modal-add').modal('show')

        })
        $('.edit').click(function(){
            var row = $(this).closest("tr").find("td");
            var up = "@lang('teacher.m_btn_up')";
            $('#mf').html(up);
            $('#hid').val($(row[0]).html());
            $('#kh_name').val($(row[1]).html());
            $('#en_name').val($(row[2]).html());
            $('#dob').val($(row[4]).html());
            $('#sex').val($(row[3]).html());
            $('#nat').val($(row[5]).html());
            $('#phone').val($(row[7]).html());
            $('#facebook').val($(row[9]).html());
            $('#email').val($(row[8]).html());
            $('#pro').val($(row[6]).html());
            $('#modal-add').modal('show');
        })
    </script>
    <script>
        $('#mf').click(()=>{
            var add = "@lang('teacher.m_btn_add')";
            if($('#mf').html() == add){
                var arr = ['kh_name','en_name','dob','sex','nat','phone','pro'];
                if(!vali(arr)){
                    swal.fire(
                        '@lang("teacher.e_head")',
                        '@lang("teacher.e_body")',
                        'error'
                    )
                }else{
                    var kh = $('#kh_name').val();
                    var en = $('#en_name').val();
                    var dob = $('#dob').val();
                    var sex = $('#sex').val();
                    var nat = $('#nat').val();
                    var phone = $('#phone').val();
                    var fb = $('#facebook').val();
                    var em = $('#email').val();
                    var pro = $('#pro').val();
                    var campid=$('#campid').val();
                    $.ajax({
                        url:'{{route('teacher.store')}}',
                        type:'POST',
                        data:{'_token':'{{csrf_token()}}','kh_name':kh,'en_name':en,'dob':dob,'sex':sex,'nat':nat,'phone':phone,'facebook':fb,'email':em,'pro':pro,'campus_id':campid},
                        success:(r)=>{
                            if(r == 1){
                                swal.fire(
                                    '@lang("teacher.s_head")',
                                    '@lang("teacher.s_body")',
                                    'success'
                                ).then(()=>{
                                    location.reload()
                                })
                            }
                        }
                    })
                }
            }else{
                var arr = ['kh_name','en_name','dob','sex','nat','phone','pro'];
                if(!vali(arr)){
                    swal.fire(
                        '@lang("teacher.e_head")',
                        '@lang("teacher.e_body")',
                        'error'
                    )
                }else{
                    var id = $('#hid').val();
                    var kh = $('#kh_name').val();
                    var en = $('#en_name').val();
                    var dob = $('#dob').val();
                    var sex = $('#sex').val();
                    var nat = $('#nat').val();
                    var phone = $('#phone').val();
                    var fb = $('#facebook').val();
                    var em = $('#email').val();
                    var pro = $('#pro').val();
                    $.ajax({
                        url:'tajup',
                        type:'POST',
                        data:{'_token':'{{csrf_token()}}','id':id,'kh_name':kh,'en_name':en,'dob':dob,'sex':sex,'nat':nat,'phone':phone,'facebook':fb,'email':em,'pro':pro},
                        success:(r)=>{
                            if(r == 1){
                                swal.fire(
                                    '@lang("teacher.s_head")',
                                    '@lang("teacher.s_body_u")',
                                    'success'
                                ).then(()=>{
                                    location.reload()
                                })
                            }
                        }
                    })
                }
            }
        })
    </script>
@endsection
