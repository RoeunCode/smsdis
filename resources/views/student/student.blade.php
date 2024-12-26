@extends('layout')
@section('content')
    <style>
        .btn-white {
            color: #358ed7;
            background-color: #fff;
            border-color: rgba(0, 0, 0, 0.1);
        }
    </style>
    <div class="col-md-12">
        <!-- Card Tabs Justified Default Style -->
        <div class="card">
            <div class="card-header bg-blue bg-inverse">
                <h4>@lang('student.head')</h4>
                <div style="float: right">

                </div>
            </div>
            <div class="card-block">
                <a class="btn btn-sm btn-primary"
                   href="{{route('student.create')}}"><i class="fa fa-plus"></i>&nbsp;&nbsp;@lang('student.btnr')</a>
                <div class="table-responsive" style="margin-top: 20px">
                    <table id="dt" class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="text-align: center">@lang('student.sid')</th>
                            <th style="text-align: center">@lang('student.kh')</th>
                            <th style="text-align: center">@lang('student.en')</th>
                            <th style="text-align: center">@lang('student.sex')</th>
                            <th style="text-align: center">@lang('student.dob')</th>
                            <th style="text-align: center">@lang('student.st')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $d)
                            <tr style="text-align: center">
                                <td>{{$d->student_id}}</td>
                                <td>{{$d->kh_name}}</td>
                                <td>{{$d->en_name}}</td>
                                <td>{{$d->sex}}</td>
                                <td>{{$d->dob}}</td>
                                <td>
                                    <a href="{{route('student.show',$d->id)}}"
                                       class="btn btn-md btn-pill btn-app-blue"><i
                                                class="fas fa-search"></i></a>
                                                
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
@endsection
