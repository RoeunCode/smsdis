@extends('layout')
@section('content')
    <style>
        .btn-white {
            color: #358ed7;
            background-color: #fff;
            border-color: rgba(0, 0, 0, 0.1);
        }
        .sel{
            width: 550px;
            font-size: 12px;
            padding: 0;
        }
        .select2-container .select2-selection--single {
            box-sizing: border-box;
            cursor: pointer;
            display: block;
            font-size: 12px;
            height: 38px;
            user-select: none;
            -webkit-user-select: none;
            padding-left: 10px;
            padding-top: 5px;
            border: 1px solid #edeeef;
        }
        th{
            text-align: center;
        }
    </style>
    <div class="col-md-12">
        <!-- Card Tabs Justified Default Style -->
        <div class="card">
            <div class="card-header bg-blue bg-inverse">
                <h4>@lang('user.head')</h4>
                <div style="float: right">
                    <button class="btn btn-pill btn-white" data-toggle="modal" data-target="#modal-add">@lang('user.btnadd')</button>
                </div>
            </div>
            <div class="modal fade" id="modal-add" tabindex="-1" role="dialog"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="card-header bg-blue bg-inverse">
                            <h4 id="modcap">@lang('user.m_head')</h4>
                            <ul class="card-actions">
                                <li>
                                    <button data-dismiss="modal" type="button"><i
                                                class="ion-close"></i></button>
                                </li>
                            </ul>
                        </div>
                        <div class="card-block">
                            <input type="hidden" id="hid" value="">
                            <div class="form-group">
                                <label>@lang('user.uname')</label>
                                <input class="form-control" type="text" id="username">
                            </div>
                            <div class="form-group">
                                <label>@lang('user.m_role')</label>
                                <select class="form-control" name="" id="role">
                                    @php if(\Illuminate\Support\Facades\Auth::user()->role == 1){ @endphp
                                    <option value="">--Choose A Role--</option>
                                    <option value="5">Relation</option>
                                    <option value="4">Teacher</option>
                                    <option value="3">Staff</option>
                                    <option value="2">Admin</option>
                                    <option value="1">SuperMan</option>
                                    @php }elseif(\Illuminate\Support\Facades\Auth::user()->role == 2){ @endphp
                                    <option value="">--Choose A Role--</option>
                                    <option value="4">Teacher</option>
                                    <option value="3">Staff</option>
                                    @php } @endphp
                                </select>
                            </div>
                            <div class="form-group">
                                <label>@lang('user.m_cp')</label>
                                <select class="form-control" name="" id="camp">
                                    @php if(\Illuminate\Support\Facades\Auth::user()->role == 1){ @endphp
                                    <option value="">--Choose A Campus--</option>
                                    @foreach($cp as $c)
                                        <option value="{{$c->id}}">{{$c->name}}</option>
                                    @endforeach
                                    @php }elseif(\Illuminate\Support\Facades\Auth::user()->role == 2){ @endphp
                                    @foreach($cp as $c)
                                        @php
                                            if($c->id == \Illuminate\Support\Facades\Auth::user()->camp_id){
                                            $cid = $c->id;
                                            $cname = $c->name;
                                            }
                                        @endphp
                                    @endforeach
                                        <option value="{{$cid}}">{{$cname}}</option>
                                    @php } @endphp
                                </select>
                            </div>
                            <div class="form-group">
                                <label>@lang('user.m_cur')</label>
                                <select class="form-control" name="" id="cur_id">
                                    @php if(\Illuminate\Support\Facades\Auth::user()->cur_id == null){ @endphp
                                    <option value="">-- Select Curriculum --</option>
                                    <option value="1">កម្មវិធីខ្មែរ</option>
                                    <option value="2">American Curriculum</option>
                                    <option value="3">Foreign Language Academy</option>
                                    @php }elseif(\Illuminate\Support\Facades\Auth::user()->cur_id == 1){ @endphp
                                    <option value="1">កម្មវិធីខ្មែរ</option>
                                    @php }elseif(\Illuminate\Support\Facades\Auth::user()->cur_id == 2){ @endphp
                                    <option value="2">American Curriculum</option>
                                    @php }elseif(\Illuminate\Support\Facades\Auth::user()->cur_id == 3){ @endphp
                                    <option value="3">Foreign Language Academy</option>
                                    @php } @endphp
                                </select>
                            </div>
                            <div class="form-group" id="tid">
                                <label>Teacher</label>
                                <select class="sel sl2" name="teacher_id" id="teacher_id">
                                    <option value="">--Choose Teacher--</option>
                                    @foreach($tch as $t)
                                        <option value="{{$t->id}}">{{ucfirst($t->en_name)}}</option>
                                        @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label>@lang('user.m_pw')</label>
                                <input class="form-control" type="password" id="password">
                            </div>
                            <div class="form-group">
                                <label>@lang('user.m_cpw')</label>
                                <input class="form-control" type="password" id="cfpass">
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-sm btn-app btn-app-blue" type="button"
                                        id="add"><i class="ion-checkmark"></i>
                                    Add
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-block">
                <div class="table-responsive">
                    <table id="dt" class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="display: none">ID</th>
                            <th>@lang('user.uname')</th>
                            <th style="display: none">Role ID</th>
                            <th>@lang('user.role')</th>
                            <th style="display: none">Teacher ID</th>
                            <th style="display: none">Status</th>
                            @php if(\Illuminate\Support\Facades\Auth::user()->role == 1){ @endphp
                            <th>Campus ID</th>
                            @php }@endphp
                            <th>@lang('user.st')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $d)
                            <tr style="text-align: center">
                                <td style="display: none">{{$d->id}}</td>
                                <td>{{$d->username}}</td>
                                <td style="display: none">{{$d->role}}</td>
                                @foreach($rl as $r)
                                    @php if($r->id == $d->role){ @endphp
                                    <td>{{ucfirst($r->name)}}</td>
                                    @php } @endphp
                                @endforeach
                                <td style="display: none">{{$d->teacher_id}}</td>
                                <td style="display: none">{{$d->deleted}}</td>
                                @php if(\Illuminate\Support\Facades\Auth::user()->role == 1){ @endphp
                                <td>{{$d->camp_id}}</td>
                                @php } @endphp
                                <td>
                                    <label class="css-input switch switch-lg switch-success switch-sm">
                                        <input class="chh" type="checkbox" @php if($d->deleted == 0){echo "checked";} @endphp /><span></span>
                                    </label>
                                    <button class="btn btn-sm  btn-app-blue bedit"><i class="fas fa-pen"></i></button>
{{--                                    <a href="{{route('usrdel',$d->id)}}" onclick="return confirm('Are You Sure You Want To Delete ?')"--}}
{{--                                       class="btn btn-md btn-pill btn-app-red"><i class="fas fa-trash"></i></a>--}}
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="modal fade" id="modal-edit" tabindex="-1" role="dialog"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="card-header bg-blue bg-inverse">
                                <h4 id="modcap">Edit User</h4>
                                <ul class="card-actions">
                                    <li>
                                        <button data-dismiss="modal" type="button"><i
                                                    class="ion-close"></i></button>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-block">
                                <input type="hidden" id="eid" value="">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input class="form-control" type="text" id="eusername">
                                </div>
                                <div class="form-group">
                                    <label>Role</label>
                                    <select class="form-control" name="" id="erole">
                                        @php if(\Illuminate\Support\Facades\Auth::user()->role == 1){ @endphp
                                        <option value="">--Choose A Role--</option>
                                        <option value="5">Relation</option>
                                        <option value="4">Teacher</option>
                                        <option value="3">Staff</option>
                                        <option value="2">Admin</option>
                                        <option value="1">SuperMan</option>
                                        @php }elseif(\Illuminate\Support\Facades\Auth::user()->role == 2){ @endphp
                                        <option value="">--Choose A Role--</option>
                                        <option value="4">Teacher</option>
                                        <option value="3">Staff</option>
                                        @php } @endphp
                                    </select>
                                </div>
                                <div class="form-group" id="etid">
                                    <label>Teacher</label>
                                    <select class="form-control" name="teacher_id" id="eteacher_id">
                                        <option value="">--Choose A Teacher--</option>
                                        @foreach($tch as $t)
                                            <option value="{{$t->id}}">{{ucfirst($t->en_name)}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-pill btn-app-blue" id="chpw"><i class="fas fa-lock"></i> Change Password</button>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-sm btn-app btn-app-blue" type="button"
                                            id="update"><i class="ion-checkmark"></i>
                                        Update
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="modal-pw" tabindex="-1" role="dialog"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="card-header bg-blue bg-inverse">
                                <h4 id="modcap">Change Password</h4>
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
                                    <input class="form-control" type="password" id="opass">
                                </div>
                                <div class="form-group">
                                    <label>New Password</label>
                                    <input class="form-control" type="password" id="npass">
                                </div>
                                <div class="form-group">
                                    <label>Confirm Password</label>
                                    <input class="form-control" type="password" id="cpass">
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-sm btn-app btn-app-blue" type="button"
                                            id="cpw"><i class="ion-checkmark"></i>
                                        Change
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
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
            $('.sl2').select2();
            $('#tid').hide();
        });
    </script>
    <script>
        $('#add').click(function () {
            var arr = ['username','role','password','cfpass','cur_id','camp'];
            if(!vali(arr)){
                Swal.fire(
                    'Error',
                    'Please Enter All Required Information !',
                    'error'
                )
            }else {
                var role = $('#role').val();
                var tid = $('#teacher_id').val();
                if (role == 4 && tid == "") {
                    Swal.fire(
                        'Error',
                        'Please Enter All Required Information !',
                        'error'
                    )
                } else if($('#password').val()!= $('#cfpass').val()) {
                    Swal.fire(
                        'Warning',
                        'Passwords Don\'t Match !',
                        'warning'
                    )
                }else{
                    var uname = $('#username').val();
                    var role = $('#role').val();
                    var tid = $('#teacher_id').val();
                    var camp = $('#camp').val();
                    var cur = $('#cur_id').val();
                    if(tid == ""){
                        tid = null;
                    }
                    var pw = $('#password').val();
                    $.ajax({
                        url: '{{route('ajcuser')}}',
                        type: 'POST',
                        data: {
                            '_token': '{{csrf_token()}}',
                            'username': uname,
                            'role': role,
                            'camp':camp,
                            'cur_id': cur,
                            'teacher_id': tid,
                            'password':pw
                        },
                        success: function (r) {
                            if (r == 1) {
                                Swal.fire(
                                    'Success !',
                                    'Class Added Successfully',
                                    'success'
                                ).then(function () {
                                    location.reload()
                                })
                            }
                        }
                    })
                }
            }
        })
    </script>
    <script>
        $('.bedit').click(function () {
            var row = $(this).closest('tr');
            var col = row.find('td');
            $('#eid').val($(col[0]).html());
            $('#eusername').val($(col[1]).html());
            $('#erole').val($(col[2]).html());
            if($(col[2]).html() == 4){
                $('#etid').show();
                $('#eteacher_id').val($(col[4]).html());
            }else{
                $('#etid').hide();
            }
            $('#modal-edit').modal().show();
        })
    </script>
    <script>
        $('#erole').change(function () {
            if($('#erole').val() == 4){
                $('#etid').show();
            }else{
                $('#etid').hide();
            }
        })
    </script>
    <script>
        $('#update').click(function () {
            var arr = ['eusername','erole'];
            if(!vali(arr)){
                Swal.fire(
                    'Error',
                    'Please Enter All Required Information !',
                    'error'
                )
            }else {
                var id = $('#eid').val();
                var uname = $('#eusername').val();
                var role = $('#erole').val();
                var tid = $('#eteacher_id').val();
                $.ajax({
                    url: '{{route('uup')}}',
                    type: 'POST',
                    data: {'_token': '{{csrf_token()}}', 'id': id, 'username': uname, 'role': role,'teacher_id':tid},
                    success: function (r) {
                        if (r == 1) {
                            Swal.fire(
                                'Success !',
                                'User Updated Successfully',
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
    <script>
        $('#role').change(function () {
            if($('#role').val() == 4){
                $('#tid').show();
            }else{
                $('#tid').hide();
            }
        })
    </script>
    <script>
        $('#chpw').click(function () {
            $('#modal-pw').modal().show();
        })
    </script>
    <script>
        $('#cpw').click(function () {
            var arr = ['opass','npass','cpass'];
            if(!vali(arr)){
                Swal.fire(
                    'Error',
                    'Please Enter All Required Information !',
                    'error'
                )
            }else{
                var id = $('#eid').val();
                var op = $('#opass').val();
                var np = $('#npass').val();
                var cp = $('#cpass').val();
                if(np == cp){
                    $.ajax({
                        url:'{{route("changepw")}}',
                        type:'POST',
                        data:{'_token':'{{csrf_token()}}','id':id,'old':op,'new':np},
                        success:function (r) {
                            if (r == 1) {
                                Swal.fire(
                                    'Success !',
                                    'Academic Year Updated Successfully',
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
    <script>
        $('.chh').change(function () {
            var col = $(this).closest('tr').find('td');
            var id = $(col[0]).html();
            var st = $(col[5]).html();
            $.ajax({
                url:'{{route('usrdel')}}',
                type:'POST',
                data:{'_token':'{{csrf_token()}}','id':id,'st':st},
                success:function (r) {
                    if (r == 1) {
                        Swal.fire(
                            'Success !',
                            'User Updated Successfully',
                            'success'
                        ).then(function () {
                            location.reload()
                        })
                    }
                }
            });

        })
    </script>
@endsection
