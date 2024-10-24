@extends('layout_score')

@section('content')
    <a href="{{ route('home') }}" class="btn btn-danger btn-sm">
        <i class="fa fa-arrow-left"></i> ត្រលប់ក្រោយ
    </a>
    <div class="row m-t">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header bg-blue bg-inverse">
                    <p style="text-align: center">កម្មវិធីជាតិ ថ្នាក់អនុ</p>
                </div>
                <div class="card-block">

                    <div class="row">
                        <div class="col-lg-3 col-md-3">
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
                    <div class="row option_choose">
                        <div class="col-lg-4 col-md-5" style="margin-top: 15px">
                            <select class="form-control" id="select_class">

                            </select>
                        </div>
                        <div class="col-lg-2 col-md-2" style="margin-top: 15px">
                            <select class="form-control" id="select_month">
                                @foreach ($month as $row)
                                    <option value="{{ $row->id }}">
                                        {{ $row->name_kh }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-2 col-md-2" style="margin-top: 15px">
                            <button class="btn btn-primary btn-sm" id="btn_get_student">
                                <i class="fa fa-search"></i> &nbsp;បង្ហាញសិស្ស​
                            </button>
                        </div>
                    </div>
                    <p class="status_loading" style="text-align: center"></p>
                    <div style="margin-top: 15px">
                        <div id="show_student">
                            <p style="margin-top: 30px;text-align: center">
                                តារាងបញ្ជូលពិន្ទុសម្រាប់ <span id="text_class"></span> ខែ​ <span id="text_month"></span>
                                <span id="text_acdemic"></span>
                            </p>
                            <div class="row">

                                <div class="col-lg-2 col-md-2">
                                    <div class="form-inline">
                                        <div class="form-group">
                                            <label for="example-if-email">សូមបញ្ចូលតួចែក</label>
                                            <input class="form-control" type="number" id="txt_avg" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div style="margin-top: 20px">
                                <table class='table table-bordered table-condensed ' id='tbl_list'>
                                    <thead>
                                        <th style="text-align: center;font-size: 12px">
                                            ឈ្មោះសិស្ស
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            តែងសេចក្តី
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            ស.ស.អាន
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            ភាសារខ្មែរ
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            សីលធម៍
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            ប្រវិត្តវិទ្យា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            ភូមិវិទ្យា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            គណិតវិទ្យា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            រូបវិទ្យា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            គីមីវិទ្យា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            ជីវទ្យា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            ផែនដីវិទ្យា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            គេហវិទ្យា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            អង់គ្លេស
                                        </th>
                                    </thead>
                                    <tbody>


                                    </tbody>

                                </table>
                                <div class="container">
                                    <div class="row">
                                        <div class="col text-center">
                                            <button class="btn btn-primary btn-sm" id="btn_save_score">បញ្ជូលពិន្ទុ</button>
                                        </div>
                                    </div>
                                </div>

                                <div id="msg_showstudent">
                                    <p style="text-align: center;color:red">

                                        មិនមានសិស្សបញ្ជូលពិន្ទុទេ
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
@endsection


@section('footer')
    <script>
        var status;
        $('#show_student').hide()
        $('.status_loading').hide()
        $('#msg_showstudent').hide()
        $('.option_choose').hide()
        $('#select_academic').change(function() {

            $.ajax(

                {
                    type: "post",
                    url: '{{ route('getclasssecondary') }}',
                    data: {
                        id_ac: $('#select_academic').val(),
                        '_token': '{{ csrf_token() }}',
                    },
                    beforeSend: function() {

                        $('.status_loading').show()
                        $('.status_loading').html("កំពុងទាញបង្ហាញ")

                    }
                }
            ).then((data) => {

                if (data.class.length == 0) {
                    $('.status_loading').html('មិនមានថ្នាក់រៀនសម្រាប់ឆ្នាំសិក្សានេះទេ')
                    $('.status_loading').show()
                    $('.option_choose').hide()
                    $('#show_student').hide()
                } else {
                    var select = '<option disabled >ជ្រើសរើសថ្នាក់រៀន</option>'
                    data.class.forEach(function(d) {
                        select += "<option value=" + d.id + ">ថ្នាកទី : " + d.grade + "  </option>"
                    })
                    $('.status_loading').hide()
                    $('#select_class').html(select)
                    $('.option_choose').slideDown()
                }


            }).fail((data) => {

            })


        })

        $('#btn_get_student').click(function(){

            var class_id = $('#select_class').val()
            var month_id = $('#select_month').val()

            $.ajax({

                type: "post",
                url: '{{ route('showstudentsecondary') }}',
                data: {
                    'class_id': class_id,
                    'month_id': month_id,
                    '_token': '{{ csrf_token() }}',
                },
                beforeSend: function() {

                    $('#btn_get_student').html("កំពុងទាញបង្ហាញ")

                }


            }).then((data) => {


                if (data.student_class.length == 0) {
                    $('#show_student').slideDown()
                    $('#msg_showstudent').show()

                    return;
                }
                status = data.status

                if(status == 1)
                {

                    var output_data = "";


                    data.student_class.forEach(function(student) {
                        output_data +=
                        "<tr style='text-align:center;'><td style='font-size:12px'>" + student
                            .kh_name +
                            "</td>" +
                            "<td><input class='form-control txt_writing'></td>" +
                            "<td><input class='form-control txt_essay'></td>" +
                            "<td><input class='form-control txt_khmer'></td>" +
                            "<td><input class='form-control txt_morality'></td>" +
                            "<td><input class='form-control txt_history'></td>" +
                            "<td><input class='form-control txt_geography'></td>" +
                            "<td><input class='form-control txt_math'></td>" +
                            "<td><input class='form-control txt_physical'></td>" +
                            "<td><input class='form-control txt_chemistry'></td>" +
                            "<td><input class='form-control txt_biology'></td>" +
                            "<td><input class='form-control txt_geology'></td>" +
                            "<td><input class='form-control txt_house_education'></td>" +
                            "<td><input class='form-control txt_english'></td>" +
                            "<td hidden><input class='form-control txt_student_id' value=" + student
                            .id +
                            "></td>" +
                            "</tr>"

                    })


                    $('#tbl_list tbody').html(output_data)


                }else{



                }



                $('#msg_showstudent').hide()
                $('#text_class').html($('#select_class option:selected').text())
                $('#text_acdemic').html($('#select_academic option:selected').text())
                $('#text_month').html($('#select_month option:selected').text())
                $('#show_student').slideDown()
                $('#btn_get_student').html('  <i class="fa fa-search"></i> &nbsp;បង្ហាញសិស្ស​')


            }).fail((err)=>{

            })




        })
        $('#btn_save_score').click(function(){

        })
    </script>
@endsection
