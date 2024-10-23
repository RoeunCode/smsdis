@extends('layout_score')
<style>


</style>
@section('content')
    <a href="{{ route('home') }}" class="btn btn-danger btn-sm">
        <i class="fa fa-arrow-left"></i> ត្រលប់ក្រោយ
    </a>
    <div class="row m-t">
        <div class="col-lg-12">
            <div class="card">


                <div class="card-header bg-blue bg-inverse">
                    <p style="text-align: center">កម្មវិធីជាតិ ថ្នាក់បឋម</p>
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
                            <div style="margin-top: 20px">
                                <table class='table table-bordered table-condensed ' id='tbl_list'>
                                    <thead>
                                        <th style="text-align: center;font-size: 12px">
                                            ឈ្មោះសិស្ស
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            ស្តាប់
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            និយាយ
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            អំណាន
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            សរសេរ
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            តែងសេចក្តី
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            វេយ្យាករណ៍
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            គណិតវិទ្យា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            វិទ្យាសាស្ត្រ
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            ភូមិវិទ្យា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            ប្រវិត្តិវិទ្យា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            សីលធម៍
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            កំនូរ
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            អក្សរផ្ចង់
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            អប់រំកាយ
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            កិច្ចការផ្ទះ
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            អនាម័យ
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
                    url: '{{ route('getclass') }}',
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

        $('#btn_get_student').on('click', function() {
            var class_id = $('#select_class').val()
            var month_id = $('#select_month').val()

            $.ajax({

                type: "post",
                url: '{{ route('showstudent') }}',
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
                if (data.status == 1) {


                    var output_data1 = "";


                    data.student_class.forEach(function(student) {

                        output_data1 +=
                            "<tr style='text-align:center;'><td style='font-size:12px'>" + student
                            .kh_name +
                            "</td>" +
                            "<td><input class='form-control txt_listent'></td>" +
                            "<td><input class='form-control txt_speaking'></td>" +
                            "<td><input class='form-control txt_reading'></td>" +
                            "<td><input class='form-control txt_writing'></td>" +
                            "<td><input class='form-control txt_essay'></td>" +
                            "<td><input class='form-control txt_grammar'></td>" +
                            "<td><input class='form-control txt_math'></td>" +
                            "<td><input class='form-control txt_chemistry'></td>" +
                            "<td><input class='form-control txt_physical'></td>" +
                            "<td><input class='form-control txt_history'></td>" +
                            "<td><input class='form-control txt_morality'></td>" +
                            "<td><input class='form-control txt_art'></td>" +
                            "<td><input class='form-control txt_word'></td>" +
                            "<td><input class='form-control txt_pe'></td>" +
                            "<td><input class='form-control txt_homework'></td>" +
                            "<td><input class='form-control txt_healthy'/></td>" +
                            "<td hidden><input class='form-control txt_student_id' value=" + student
                            .id +
                            "></td>" +
                            "</tr>"

                    })




                    $('#tbl_list tbody').html(output_data1)




                } else {

                    var output_data = "";


                    data.student_class.forEach(function(student) {
                        var listent = student.listent == null ? '' : student.listent
                        var speaking = student.speaking == null ? '' : student.speaking
                        var writing = student.writing == null ? '' : student.writing
                        var reading = student.reading == null ? '' : student.reading
                        var essay = student.essay == null ? '' : student.essay
                        var grammar = student.grammar == null ? '' : student.grammar
                        var math = student.math == null ? '' : student.math
                        var chemistry = student.chemistry == null ? '' : student.chemistry
                        var physical = student.physical == null ? '' : student.physical
                        var history = student.history == null ? '' : student.history
                        var morality = student.morality == null ? '' : student.morality
                        var art = student.art == null ? '' : student.art
                        var word = student.word == null ? '' : student.word
                        var pe = student.pe == null ? '' : student.pe
                        var homework = student.homework == null ? '' : student.homework
                        var healthy = student.healthy == null ? '' : student.healthy
                        output_data +=
                            "<tr style='text-align:center;'><td style='font-size:12px'>" + student
                            .kh_name +
                            "<td><input class='form-control txt_listent' value=" + listent +
                            " ></td>" +
                            "<td><input class='form-control txt_speaking' value=" + speaking +
                            "></td>" +
                            "<td><input class='form-control txt_reading' value=" + reading +
                            "></td>" +
                            "<td><input class='form-control txt_writing' value=" + writing +
                            "></td>" +
                            "<td><input class='form-control txt_essay' value=" + essay + "></td>" +
                            "<td><input class='form-control txt_grammar' value=" + grammar +
                            " ></td>" +
                            "<td><input class='form-control txt_math' value=" + math + "></td>" +
                            "<td><input class='form-control txt_chemistry' value=" + chemistry +
                            "></td>" +
                            "<td><input class='form-control txt_physical' value=" + physical +
                            "></td>" +
                            "<td><input class='form-control txt_history' value=" + history +
                            "></td>" +
                            "<td><input class='form-control txt_morality' value=" + morality +
                            "></td>" +
                            "<td><input class='form-control txt_art' value=" + art + "></td>" +
                            "<td><input class='form-control txt_word' value=" + word + "></td>" +
                            "<td><input class='form-control txt_pe' value=" + pe + "></td>" +
                            "<td><input class='form-control txt_homework' value=" + homework +
                            "></td>" +
                            "<td><input class='form-control txt_healthy' value=" + healthy +
                            "></td>" +
                            "<td hidden><input class='form-control txt_student_id' value=" + student
                            .student_id +
                            "></td>" +
                            "<td hidden><input class='form-control txt_id' value=" + student.id +
                            "></td>" +

                            "</tr>"

                    })

                    $('#tbl_list tbody').html(output_data)

                }
                $('#msg_showstudent').hide()
                $('#text_class').html($('#select_class option:selected').text())
                $('#text_acdemic').html($('#select_academic option:selected').text())
                $('#text_month').html($('#select_month option:selected').text())
                $('#show_student').slideDown()
                $('#btn_get_student').html('  <i class="fa fa-search"></i> &nbsp;បង្ហាញសិស្ស​')


            }).fail((data) => {



            })



        })



        $('#btn_save_score').on('click', function() {

            var listent = []
            var speaking = []
            var reading = []
            var writing = []
            var essay = []
            var grammar = []
            var math = []
            var chemistry = []
            var physical = []
            var history = []
            var morality = []
            var art = []
            var word = []
            var pe = []
            var homework = []
            var healthy = []
            var student_id = []
            var id = []
            var class_id = $('#select_class').val()
            var month_id = $('#select_month').val()
            $('.txt_id').each(function() {


                id.push($(this).val())

            })
            $('.txt_student_id').each(function() {


                student_id.push($(this).val())

            })
            $('.txt_listent').each(function() {


                listent.push($(this).val())

            })

            $('.txt_speaking').each(function() {


                speaking.push($(this).val())

            })

            $('.txt_reading').each(function() {


                reading.push($(this).val())

            })
            $('.txt_writing').each(function() {


                writing.push($(this).val())

            })
            $('.txt_essay').each(function() {


                essay.push($(this).val())

            })
            $('.txt_grammar').each(function() {


                grammar.push($(this).val())

            })
            $('.txt_grammar').each(function() {


                math.push($(this).val())

            })
            $('.txt_chemistry').each(function() {


                chemistry.push($(this).val())

            })
            $('.txt_physical').each(function() {


                physical.push($(this).val())

            })
            $('.txt_history').each(function() {


                history.push($(this).val())

            })
            $('.txt_morality').each(function() {


                morality.push($(this).val())

            })
            $('.txt_art').each(function() {


                art.push($(this).val())

            })
            $('.txt_word').each(function() {


                word.push($(this).val())

            })
            $('.txt_pe').each(function() {


                pe.push($(this).val())

            })
            $('.txt_homework').each(function() {


                homework.push($(this).val())

            })

            $('.txt_healthy').each(function() {


                healthy.push($(this).val())

            })

            Swal.fire({
                type: "warning",
                title: "រក្សាពិន្ទុ",
                text: "តើអ្នកចង់បញ្ជូលពិន្ទុសម្រាប់ថ្នាក់រៀននេះមែនទេ!",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes"
            }).then((result) => {

                if (result.value == true) {
                    console.log(1)


                    $.ajax({
                        type: 'post',
                        url: '{{ route('cambodia-curriculum.store') }}',
                        data: {
                            '_token': '{{ csrf_token() }}',
                            'status': status,
                            'student_id': student_id,
                            'class_id': class_id,
                            'month_id': month_id,
                            'listent': listent,
                            'speaking': speaking,
                            'writing': writing,
                            'reading': reading,
                            'essay': essay,
                            'grammar': grammar,
                            'math': math,
                            'chemistry': chemistry,
                            'physical': physical,
                            'history': history,
                            'morality': morality,
                            'art': art,
                            'word': word,
                            'pe': pe,
                            'homework': homework,
                            'healthy': healthy,
                            'id': id

                        },
                        dataType: "json",
                        beforeSend: function() {

                            $('#btn_save_score').addClass('disabled')
                            $('#btn_save_score').html('កំពុងបញ្ជូលពិន្ទុ')

                        },
                        success: function(data) {

                            if (data.status == 0) {
                                $('#btn_save_score').removeClass('disabled')
                                $('#btn_save_score').html('បញ្ជូលពិន្ទុ')

                                Swal.fire({
                                    'type': 'success',
                                    'text': 'បញ្ជូលពិន្ទុបានជោគជ័យ',
                                    'title': 'ពិន្ទុ'
                                }).then(function() {
                                    $('#show_student').slideUp()
                                })
                            }

                        },
                        error: function(err) {

                            $('#btn_save_score').removeClass('disabled')
                            $('#btn_save_score').html('បញ្ជូលពិន្ទុ')

                        }
                    })




                }else{

                    $('#btn_save_score').removeClass('disabled')
                    $('#btn_save_score').html('បញ្ជូលពិន្ទុ')
                    $('#show_student').slideUp()
                }

            });

        })
    </script>
@endsection
