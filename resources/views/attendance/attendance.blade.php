@extends('layout')
@section('content')
    <style>
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .btn-white {
            color: #358ed7;
            background-color: #fff;
            border-color: rgba(0, 0, 0, 0.1);
        }

        .sel {
            width: 400px;
        }

        .sal {
            width: 110px;
        }

        .avg {
            width: 60px;
            text-align: center;
        }

        label {
            font-size: 12px;
            font-weight: bold;
        }

        .intsc {
            width: 50px;
            text-align: center;
        }

        th {
            text-align: center;
        }

        td {
            text-align: center;
        }

        .cd {
            text-align: center;
            height: 28px;
            border: 1px solid gray;
            border-radius: 4px;
        }

        .csl {
            width: 400px;
        }
    </style>
    <div class="col-md-12">
        <div class="card">
            <div class="card-header bg-blue bg-inverse">
                <p style="text-align: left">ស្រង់អវត្តមានសិស្ស</p>
            </div>
            <div class="card-block">

                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <label for="">ឆ្នាំសិក្សា</label>
                        <select class="form-control" id="select_academic">
                            <option value="" selected disabled>
                                សូមជ្រើសរើសឆ្នាំសិក្សា
                            </option>
                            @foreach ($academic as $row)
                                <option value="{{ $row->id }}">
                                    ឆ្នាំសិក្សា : {{ $row->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                </div>

                <div class="m-t row  show_class">

                    <div class="col-lg-3 col-md-3">
                        <label for="">កម្មវិធីសិក្សា</label>
                        <select class="form-control" id="select_program">
                            <option value="" selected>ជ្រើសរើសកម្មវិធីសិក្សា</option>
                            <option value="1">កម្មវិធីខ្មែរ</option>

                        </select>

                    </div>
                    <div class="col-lg-3 col-md-3">
                        <label for="">ថ្នាក់រៀន</label>
                        <select class="form-control" id="select_class">
                            <option value="" selected>ជ្រើសរើសថ្នាក់រៀន</option>
                        </select>

                    </div>
                    <div class="col-lg-3 col-md-3">
                        <label for="">ខែ</label>
                        <select class="form-control" id="select_month">
                            @foreach ($month as $row)
                                <option value="{{ $row->id }}">
                                    {{ $row->name_kh }}
                                </option>
                            @endforeach
                        </select>

                    </div>


                    <div class="col-lg-3 col-md-3">

                        <button style="margin-top: 30px" class="btn btn-primary btn-sm"
                            id="btn_show_attandance_list">បង្ហាញទិន្ន័យ</button>

                    </div>
                </div>

                <div style="margin-top: 20px" id="show_student">
                    <table class='table table-bordered table-condensed ' id='tbl_list'>
                        <thead>
                            <th style="text-align: center;font-size: 12px">
                                ឈ្មោះសិស្ស
                            </th>
                            <th style="text-align: center;font-size: 12px">
                                មានច្បាប់
                            </th>
                            <th style="text-align: center;font-size: 12px">
                                ឥតច្បាប់
                            </th>
                            <th style="text-align: center;font-size: 12px">
                                ចំណាំ
                            </th>
                        </thead>
                        <tbody>

                        </tbody>

                    </table>
                    <div class="container">
                        <div class="row">
                            <div class="col text-center">
                                <button class="btn btn-primary btn-sm" id="btn_save_score">បញ្ជូលអវត្តមាន</button>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- <div class="card-header bg-blue bg-inverse">
                        <h4 style="text-align: center">@lang('att.head')</h4>
                    </div>
                    <div class="card-block">
                        <label>@lang('att.cur')</label>
                        <select class="cd" id="cur">
                            <option value="">@lang('att.cur_ph')</option>
                            @foreach ($cur as $c)
                                <option value="{{$c->id}}">{{$c->name}}</option>
                            @endforeach
                        </select>
                        &nbsp;&nbsp;
                        <label id="lblc">@lang('att.class')</label>
                        <select class="cd sl2 csl" id="class">

                        </select>
                        <button class="btn btn-sm btn-app-blue" id="btnshow"><i class="fas fa-search"></i>&nbsp;@lang('att.btnshow')
                        </button>
                    </div>
                </div>
                <div class="table-responsive" id="ajt"></div>
                <button class='btn btn-sm btn-app-blue' id='save'><i class="fas fa-save"></i>&nbsp;@lang('att.btnsave')
                </button> --}}
            </div>
            <input type="hidden" id="rl" value="" multiple>
        </div>
    </div>
@endsection
@section('footer')
    <script>
        var status
        $('.show_class').hide()
        $('#show_student').hide()
        $('#select_academic').change(function() {
            $('.show_class').slideDown()
        })

        $('#select_program').change(function() {
            var program = $('#select_program').val()
            var academic = $('#select_academic').val()
            $.ajax(

                {
                    type: "post",
                    url: '{{ route('showclassattendance') }}',
                    data: {
                        cur_id: program,
                        id_ac: academic,
                        '_token': '{{ csrf_token() }}',
                    },
                    beforeSend: function() {

                        $('.status_loading').show()
                        $('.status_loading').html("កំពុងទាញបង្ហាញ")

                    }
                }
            ).then((data) => {

                if (data.class.length == 0) {


                    var select = "<option value='' disabled selected>មិនមានថ្នាក់រៀនជ្រើសរើសទេ</option>"
                    $('.status_loading').hide()
                    $('.show_class').slideDown()
                    $('#select_class').html(select)


                } else {


                    var select = ""
                    data.class.forEach(function(d) {

                        select += "<option data-grade=" + d.grade + " value=" + d.id +
                            ">ថ្នាកទី : " + d.grade + "  </option>"
                    })

                    $('.status_loading').hide()
                    $('.show_class').slideDown()
                    $('#select_class').html(select)

                }


            }).fail((data) => {

            })


        })

        $('#btn_show_attandance_list').click(function() {

            var class_id = $('#select_class').val()
            var month_id = $('#select_month').val()
            var program = $('#select_program').val()
            if (program == '' || program == null) {
                Swal.fire({
                    type: 'warning',
                    title: '',
                    text: 'សូមជ្រើសរើសកម្មវិធីសិក្សា'
                })
                return
            }

            if (class_id == '' || class_id == null) {
                Swal.fire({
                    type: 'warning',
                    title: '',
                    text: 'សូមជ្រើសរើសថ្នាក់រៀន'
                })
                return
            }

            $.ajax({
                type: 'post',
                url: '{{ route('attendance.store') }}',
                data: {

                    '_token': '{{ csrf_token() }}',
                    class_id: class_id,
                    month_id: month_id
                },
                beforeSend: function() {
                    $('#btn_show_attandance_list').html('កំពុងទាញទិន្ន័យ')
                }

            }).then((data) => {

                if (data.student_class.length == 0) {
                    //  $('#show_student').slideDown()
                    Swal.fire({
                        type: 'warning',
                        title: '',
                        text: 'មិនមានសិស្សក្នុងថ្នាក់នេះទេ'
                    })
                    $('#show_student').slideUp()
                    $('#btn_show_attandance_list').html('បង្ហាញទិន្ន័យ')
                    return;
                }
                status = data.status

                if (status == 1) {

                    var output_data = "";
                    data.student_class.forEach(function(student) {
                        output_data +=
                            "<tr style='text-align:center;'><td style='font-size:12px'>" + student
                            .kh_name +
                            "</td>" +
                            "<td><input type='number' class='form-control txt_absen'></td>" +
                            "<td><input type='number' class='form-control txt_permission'></td>" +
                            "<td><textarea class='form-control txt_note'></textarea></td>" +
                            "<td hidden><input class='form-control txt_student_id' value=" + student
                            .id + "></td>" +
                            "</tr>";
                    })
                    $('#btn_show_attandance_list').html('បង្ហាញទិន្ន័យ')
                    $('#tbl_list tbody').html(output_data)
                    $('#show_student').slideDown()
                } else {

                    var output_data = "";
                    data.student_class.forEach(function(student) {
                        student.note = student.note == null ? '' : student.note
                        output_data +=
                            "<tr style='text-align:center;'><td style='font-size:12px'>" + student
                            .kh_name +
                            "</td>" +
                            "<td><input type='number' value=" + student.absen +
                            " class='form-control txt_absen'></td>" +
                            "<td><input type='number' value=" + student.permission +
                            " class='form-control txt_permission'></td>" +
                            "<td><textarea class='form-control txt_note'  >" + student.note +
                            "</textarea></td>" +
                            "<td hidden><input class='form-control txt_student_id' value=" + student
                            .student_id + "></td>" +
                            "</tr>";
                    })
                    $('#btn_show_attandance_list').html('បង្ហាញទិន្ន័យ')
                    $('#tbl_list tbody').html(output_data)
                    $('#show_student').slideDown()
                }

            }).fail((data) => {
                $('#btn_show_attandance_list').html('បង្ហាញទិន្ន័យ')
            })
        })
        $('#btn_save_score').click(function() {
            var student_id = []
            var adsen = []
            var note = []
            var permision = []
            var class_id = $('#select_class').val()
            var month_id = $('#select_month').val()
            $('.txt_student_id').each(function() {
                student_id.push($(this).val())
            })
            $('.txt_absen').each(function() {
                adsen.push($(this).val())
            })
            $('.txt_permission').each(function() {
                permision.push($(this).val())
            })
            $('.txt_note').each(function() {
                note.push($(this).val())
            })
            $.ajax({
                type: 'post',
                url: '{{ route('save_attendance') }}',
                data: {
                    '_token': '{{ csrf_token() }}',
                    'class_id': class_id,
                    'month_id': month_id,
                    'student_id': student_id,
                    'adsen': adsen,
                    'permision': permision,
                    'note': note,
                    'status': status
                },
                beforeSend:function(){
                    $('#btn_save_score').addClass('disabled')
                    $('#btn_save_score').html('កំពុងបញ្ជូលអវត្តមាន')
                }
            }).then((data) => {

                if (data.status == 0) {
                    $('#btn_save_score').removeClass('disabled')
                    $('#btn_save_score').html('បញ្ជូលអវត្តមាន')

                    Swal.fire({
                        'type': 'success',
                        'text': 'បញ្ជូលពិន្ទុបានជោគជ័យ',
                        'title': 'ពិន្ទុ'
                    }).then(function() {
                        $('#show_student').slideUp()
                    })
                }


            }).fail((err) => {
                $('#btn_save_score').removeClass('disabled')
                $('#btn_save_score').html('បញ្ជូលអវត្តមាន')
            })

        })
    </script>

    {{-- <script>
        $(document).ready(function() {
            $('#save').hide();
            $('.sl2').select2();
            $('#lblc').hide();
            $('#class').hide();
            $('.select2-container').hide();
            $('#btnshow').hide();
        });
    </script>
    <script>
        $('#btnshow').click(function() {
            if ($('#cur').val() == "") {
                swal.fire(
                    'Failed',
                    'Please Select A Curriculum',
                    'error'
                )
            } else {
                var cid = $('#class').val();
                $.ajax({
                    url: '{{ route('takeatt') }}',
                    type: 'POST',
                    data: {
                        '_token': '{{ csrf_token() }}',
                        'cid': cid
                    },
                    success: (r) => {
                        $('#save').show();
                        $('#ajt').html(r.rt)
                    }
                })
            }
        })
    </script>
    <script>
        $('#cur').change(function() {
            var id = $('#cur').val();
            $.ajax({
                url: '{{ route('ajcl') }}',
                type: 'POST',
                data: {
                    '_token': '{{ csrf_token() }}',
                    'id': id
                },
                success: function(r) {
                    if (r == 0) {
                        $('#lblc').hide();
                        $('#class').hide();
                        $('.select2-container').hide();
                        $('#btnshow').hide();
                    } else {
                        var opt = "";
                        for (var i = 0; i < r.length; i++) {
                            opt += "<option value='" + r[i].id + "'>" + r[i].full + "</option>";
                        }
                        $('#class').html(opt);
                        $('#lblc').show();
                        $('#class').show();
                        $('.select2-container').show();
                        $('.sl2').select2();
                        $('#btnshow').show();
                    }
                }
            })
        })
    </script>
    <script>
        $('#save').click(function() {
            arrsid = [];
            $('.sid').each(function() {
                arrsid.push({
                    'id': $(this).val()
                })
            });
            arrpr = [];
            $('.rdpr').each(function() {
                if ($(this).is(':checked')) {
                    arrpr.push({
                        'pr': $(this).val()
                    })
                } else {
                    arrpr.push({
                        'pr': null
                    })
                }
            });
            arrpm = [];
            $('.rdpm').each(function() {
                if ($(this).is(":checked")) {
                    arrpm.push({
                        'pm': $(this).val()
                    })
                } else {
                    arrpm.push({
                        'pm': null
                    })
                }
            });
            arrab = [];
            $('.rdab').each(function() {
                if ($(this).is(":checked")) {
                    arrab.push({
                        'ab': $(this).val()
                    })
                } else {
                    arrab.push({
                        'ab': null
                    })
                }
            });
            arrdt = [];
            var acid = $('#acid').val();
            for (var i = 0; i < arrsid.length; i++) {
                arrdt.push({
                    'id': arrsid[i]['id'],
                    'cid': acid,
                    'pr': arrpr[i]['pr'],
                    'pm': arrpm[i]['pm'],
                    'ab': arrab[i]['ab']
                });
            }
            $.ajax({
                url: '{{ route('addatt') }}',
                type: 'POST',
                data: {
                    '_token': '{{ csrf_token() }}',
                    'data': arrdt
                },
                success: function(r) {
                    if (r == 1) {
                        swal.fire(
                            '@lang('att.s_head')',
                            '@lang('att.s_body')',
                            'success'
                        ).then(() => {
                            location.reload()
                        })
                    }
                }
            })
        })
    </script> --}}
@endsection
