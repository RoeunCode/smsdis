@extends('layout')
<style>
    .select2-container .select2-selection--single {
        height: 40px !important;
    }

    .select2-container .select2-selection--single .select2-selection__rendered {
        padding: 0 0 0 12px !important;
    }

    .search-sec {
        padding: 1rem;
    }
    .select2-container--default .select2-selection--single {
    background-color: #fff;
    border: 1px solid #aaa;
    border-radius: 4px;
    padding-top: 6px;
    font-size: 12px;
}
    .select2-container--default .select2-results>.select2-results__options {
        max-height: 200px;
        overflow-y: auto;
        font-size: 12px;
    }
</style>

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">


                <div class="card ">
                    <div class="card-header">
                        <h6>
                            Uer For Student
                        </h6>
                    </div>
                    <div class="card-block">
                        <button style="margin-bottom: 10px" class=" btn btn-primary btn-sm" id="btn_add_new_user">Add New
                            User</button>

                        <div class="table-responsive">

                            <table id="table_user" class="table table-bordered">
                                <thead>
                                    <tr style="text-align: center">

                                        <th style="text-align: center">UserName</th>
                                        <th style="text-align: center">For Student: </th>

                                        <th style="text-align: center">Settings</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($data_user as $d)
                                        <tr style="text-align: center">

                                            <td>{{ $d->username }}</td>
                                            <td>{{ $d->student_name }}</td>
                                            <td>
                                                <button class="btn btn-sm btn-warning btn_modal_change"
                                                    data-id="{{ $d->id }}">Change Password</button>
                                                <button class="btn btn-sm btn-danger "
                                                    onclick="delete_account('{{ $d->id }}')">Delete</button>
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
    </div>


    <!-- Modal -->
    <div class="modal fade" id="modal_add_user" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">User Account</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">For Student User : </label>
                        <select class="form-control student_select " id="student_id">

                            <option value="" selected>
                                Please Select Student
                            </option>
                            @foreach ($student as $row)
                                <option value="{{ $row->id }}">
                                    {{ $row->kh_name }} - {{ $row->en_name }}
                                </option>
                            @endforeach
                        </select>

                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">UserName</label>
                        <input type="text" class="form-control" id="username" aria-describedby="emailHelp"
                            placeholder="Enter Username">

                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Password</label>
                        <input type="password" class="form-control" id="password" aria-describedby="emailHelp"
                            placeholder="Enter Password">

                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Confirm Password</label>
                        <input type="password" class="form-control" id="confirm_password" aria-describedby="emailHelp"
                            placeholder="Confirm Password">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="btn_save_user"><i class="fa fa-plus"></i> Save
                        User</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal_change_password" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">User Account</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">


                    <div class="form-group">
                        <label for="exampleInputEmail1">Password</label>
                        <input type="email" class="form-control" id="change_password" aria-describedby="emailHelp"
                            placeholder="Enter Password">

                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Confirm Password</label>
                        <input type="email" class="form-control" id="change_confirm_password"
                            aria-describedby="emailHelp" placeholder="Confirm Password">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="btn_change_pass"><i class="fa fa-plus"></i>
                        Change Password</button>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="change_student_id">
@endsection
@section('footer')
    <script>
        $(document).ready(function() {
            $('#table_user').DataTable();
        });
    </script>
    <script>
        $('.student_select').select2({
            width: "100%"
        })
        $('#btn_add_new_user').click(function() {

            $('#modal_add_user').modal('show')

        })
        $('#table_user').on('click', '.btn_modal_change', function() {

            $('#modal_change_password').modal('show')

            $('#change_student_id').val($(this).attr('data-id'))

        })
        $('#btn_save_user').click(function() {

            var username = $('#username').val()
            var student_id = $('#student_id').val()
            var password = $('#password').val()
            var confirm_password = $('#confirm_password').val()
            if (password != confirm_password) {
                Swal.fire({
                    'type': 'warning',
                    'text': 'The password confirmation does not match. ',
                    'title': 'Confirm Passowrd'
                })
            } else {

                $.ajax({
                    'type': 'post',
                    url: '{{ route('accountstudent.store') }}',
                    data: {
                        '_token': '{{ csrf_token() }}',
                        'username': username,
                        'student_id': student_id,
                        'password': password,
                        'status': 'create'
                    },
                    beforeSend: function() {
                        $('#btn_save_user').html('Saving...')
                    }
                }).then(function(data) {

                    $('#btn_save_user').html('<i class="fa fa-plus"></i> Save User')
                    Swal.fire({
                        'type': 'success',
                        'text': data,
                        'title': 'Add successfully'
                    })
                    location.reload(5);

                }, function() {

                }).fail(function() {
                    $('#btn_save_user').html('<i class="fa fa-plus"></i> Save User')
                })
            }


        })

        function delete_account(id) {
            var url = '{{ route('accountstudent.destroy', 'id') }}'
            var url2 = url.replace('id',id)
            $.ajax({
                type: "DELETE",
                url: url2,
                data: {
                    '_token': '{{ @csrf_token() }}'
                },
                success: function(data) {
                    if (data == 1) {
                        Swal.fire({
                            'title': 'Delete ClassRoom',
                            'text': 'Completed',
                            'type': 'success'
                        }).then(function() {
                            location.reload().delay(200)
                        })
                    }
                }
            })
        }
        $('#btn_change_pass').click(function() {


            var id = $('#change_student_id').val()
            var password = $('#change_password').val()
            var confirm_password = $('#change_confirm_password').val()
            if (password != confirm_password) {
                Swal.fire({
                    'type': 'warning',
                    'text': 'The password confirmation does not match. ',
                    'title': 'Confirm Passowrd'
                })
            } else {
                $.ajax({
                    'type': 'post',
                    url: '{{ route('accountstudent.store') }}',
                    data: {
                        '_token': '{{ csrf_token() }}',

                        'id': id,
                        'password': password,
                        'status': 'change'
                    },
                    beforeSend: function() {
                        $('#btn_change_pass').html('Change...')
                    }
                }).then(function(data) {

                    $('#btn_change_pass').html('<i class="fa fa-plus"></i> Change Password')
                    Swal.fire({
                        'type': 'success',
                        'text': data,
                        'title': 'Add successfully'
                    })

                }, function(data) {

                    $('#btn_change_pass').html('<i class="fa fa-plus"></i> Change Password')
                }).fail(function(data) {
                    $('#btn_change_pass').html('<i class="fa fa-plus"></i> Change Password')
                })



            }


        })
    </script>
@endsection
