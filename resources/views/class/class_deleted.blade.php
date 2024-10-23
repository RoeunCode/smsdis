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
            <div class="card-block tab-content">
                <div class="card">
                    <div class="card-header bg-red  bg-inverse">
                        <h4>Deleted Classes</h4>
                    </div>
                    <div class="card-block">
                        <div class="table-responsive">
                            <table id="dt" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th style="display: none">ID</th>
                                    <th style="text-align: center">@lang('class.room')</th>
                                    <th style="text-align: center">@lang('class.campus')</th>
                                    <th style="text-align: center">@lang('class.cur')</th>
                                    <th style="text-align: center">@lang('class.grade')</th>
                                    <th style="text-align: center">@lang('class.ay')</th>
                                    <th style="text-align: center">@lang('class.sdt')</th>
                                    <th style="text-align: center">@lang('class.st')</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($data as $d)
                                    <tr style="text-align: center">
                                        <td style="display: none">{{$d->id}}</td>
                                        <td>{{$d->classroom}}</td>
                                        <td>{{$d->campus}}</td>
                                        <td>{{$d->curriculum}}</td>
                                        <td>{{$d->grade}}</td>
                                        <td>{{$d->academic_year}}</td>
                                        <td>{{$d->study_time}}</td>
                                        <td>
                                            <a class="btn btn-success" href="{{route('clrestore',$d->id)}}"><i class="fa fa-recycle"></i></a>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
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
        });
    </script>
@endsection
