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
                        <h4>Deleted Grades</h4>
                    </div>
                    <div class="card-block">
                        <div class="table-responsive">
                            <table id="dt" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th style="display: none">ID</th>
                                    <th style="text-align: center">@lang('grade.gr')</th>
                                    <th style="display: none">cur_id</th>
                                    <th style="text-align: center">@lang('grade.cur')</th>
                                    <th style="text-align: center">@lang('grade.st')</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($data as $d)
                                    <tr style="text-align: center">
                                        <td style="display: none">{{$d->id}}</td>
                                        <td>{{$d->name}}</td>
                                        <td style="display: none">{{$d->cur_id}}</td>
                                        <td>@php if($d->cur_id == 1){echo "កម្មវិធីជាតិ";}elseif($d->cur_id == 2){echo "American Curriculum";}elseif($d->cur_id == 3){echo "Foreign Language Academy";} @endphp</td>
                                        <td>
                                            <a class="btn btn-success btn-pill" href="{{route('grst',$d->id)}}"><i class="fa fa-recycle"></i></a>
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