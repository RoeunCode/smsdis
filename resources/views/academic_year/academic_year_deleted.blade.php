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
                        <h4>Deleted Academic Years</h4>
                    </div>
                    <div class="card-block">
                        <div class="table-responsive">
                            <table id="dt" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th style="display: none">ID</th>
                                    <th style="text-align: center">@lang('academic_year.name')</th>
                                    <th style="text-align: center">@lang('academic_year.start')</th>
                                    <th style="text-align: center">@lang('academic_year.end')</th>
                                    <th style="text-align: center">@lang('academic_year.st')</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($data as $d)
                                    <tr style="text-align: center">
                                        <td style="display: none">{{$d->id}}</td>
                                        <td>{{$d->name}}</td>
                                        <td>{{$d->start}}</td>
                                        <td>{{$d->end}}</td>
                                        <td>
                                            <a class="btn btn-success btn-pill" href="{{route('ayrst',$d->id)}}"><i class="fa fa-recycle"></i></a>
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