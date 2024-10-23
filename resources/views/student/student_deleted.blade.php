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
                        <h4>សិស្សដែលបានលុប</h4>
                    </div>
                    <div class="card-block">
                        <div class="table-responsive">
                            <table id="dt" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Student ID</th>
                                    <th>ឈ្មោះ</th>
                                    <th>Name</th>
                                    <th>ភេទ</th>
                                    <th>DOB</th>
                                    <th>ការកំណត់</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($data as $d)
                                    <tr>
                                        <td>{{$d->student_id}}</td>
                                        <td>{{$d->kh_name}}</td>
                                        <td>{{$d->en_name}}</td>
                                        <td>{{$d->sex}}</td>
                                        <td>{{$d->dob}}</td>
                                        <td>
                                            <a onclick="return confirm('Are You Sure You Want To Restore ?')" href="{{route('strst',$d->id)}}"
                                               class="btn btn-md btn-pill btn-app-green"><i
                                                        class="fas fa-recycle"></i></a>
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