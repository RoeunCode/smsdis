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
    </style>
    <div class="col-md-12">
        <!-- Card Tabs Justified Default Style -->
        <div class="card">
            <div class="card-header bg-red bg-inverse">
                <h4>Disabled Users</h4>
            </div>
            <div class="card-block">
                <div class="table-responsive">
                    <table id="dt" class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="display: none">ID</th>
                            <th>UserName</th>
                            <th style="display: none">Role ID</th>
                            <th>User Role</th>
                            <th style="display: none">Teacher ID</th>
                            <th>Teacher Name</th>
                            <th>Settings</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $d)
                            <tr>
                                <td style="display: none">{{$d->id}}</td>
                                <td>{{$d->username}}</td>
                                <td style="display: none">{{$d->role}}</td>
                                @foreach($rl as $r)
                                    @php if($r->id == $d->role){ @endphp
                                    <td>{{ucfirst($r->name)}}</td>
                                    @php } @endphp
                                @endforeach
                                <td style="display: none">{{$d->teacher_id}}</td>
                                @foreach($tch as $t)
                                    @php if($t->id == $d->teacher_id){ $tc = $t->name; }else{
                                    $tc = "";} @endphp
                                @endforeach
                                <td>{{$tc}}</td>
                                <td>
                                    <a href="{{route('usrrst',$d->id)}}" onclick="return confirm('Are You Sure You Want To Delete ?')"
                                       class="btn btn-md btn-pill btn-app-green"><i class="fas fa-recycle"></i></a>
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
            $('.sl2').select2();
            $('#tid').hide();
        });
    </script>
@endsection