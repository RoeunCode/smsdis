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
                                        <th style="text-align: center;font-size: 12px">
                                            កីឡា
                                        </th>
                                        <th style="text-align: center;font-size: 12px">
                                            កុំព្យូទ័រ
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

                                {{-- <div id="msg_showstudent">
                                    <p style="text-align: center;color:red">

                                        មិនមានសិស្សបញ្ជូលពិន្ទុទេ
                                    </p>
                                </div> --}}
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
@endsection


@section('footer')
    <script>
        var status;
        var grade_check;
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
                        select += "<option data-grade="+d.grade+" value=" + d.id + ">ថ្នាកទី : " + d.grade + "  </option>"
                    })
                    $('.status_loading').hide()
                    $('#select_class').html(select)
                    $('.option_choose').slideDown()
                }


            }).fail((data) => {

            })


        })

        $('#select_class').on('change',function(){
             var check = $('option:selected', this).attr('data-grade');
              grade_check = check
        })

        $('#btn_get_student').click(function() {

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
                  //  $('#show_student').slideDown()
                    $('#msg_showstudent').show()
                       $('#show_student').hide()
                    $('#btn_get_student').html('    <i class="fa fa-search"></i> &nbsp;បង្ហាញសិស្ស​')
                    return;
                }
                status = data.status
                $('#show_student').show()
                if (status == 1) {

                    var output_data = "";

                    var input_grade ="";
                    data.student_class.forEach(function(student) {
                        if(grade_check == 9)
                        {
                            input_grade ="<td><input disabled value='0.0.1'  class='form-control txt_pe'></td>" +
                                     "<td><input  class='form-control txt_computer'></td>" ;

                        }else{
                            input_grade ="<td><input class='form-control txt_pe'></td>" +
                                          "<td><input  class='form-control txt_computer'></td>" ;
                        }
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
                            input_grade+
                            "<td hidden><input class='form-control txt_student_id' value=" + student
                            .id +
                            "></td>" +
                            "</tr>"

                    })


                    $('#tbl_list tbody').html(output_data)


                } else {


                    var output_data = "";
                    $('#txt_avg').val(data.student_class[0].avg_m)


                    data.student_class.forEach(function(student) {
                        student.writing = student.writing == null ? '' : student.writing
                        student.essay = student.essay == null ? '' : student.essay
                        student.khmer = student.khmer == null ? '' : student.khmer
                        student.morality = student.morality == null ? '' : student.morality
                        student.history = student.history == null ? '' : student.history
                        student.geography = student.geography == null ? '' : student.geography
                        student.math = student.math == null ? '' : student.math
                        student.physical = student.physical == null ? '' : student.physical
                        student.chemistry = student.chemistry == null ? '' : student.chemistry
                        student.biology = student.biology == null ? '' : student.biology
                        student.geology = student.geology == null ? '' : student.geology
                        student.pe = student.pe == null ? '' : student.pe
                        student.computer = student.computer == null ? '' : student.computer
                        student.house_education = student.house_education == null ? '' : student
                            .house_education

                        student.english = student.english == null ? '' : student.english
                        if(grade_check == 9)
                        {
                            input_grade = "<td><input disabled class='form-control txt_pe' value='0.0.1'></td>" +
                                        "<td><input class='form-control txt_computer' value=" + student.computer +
                                        "></td>" ;

                        }else{
                            input_grade =  "<td><input class='form-control txt_pe' value=" + student.pe +
                                        "></td>" +
                                        "<td><input class='form-control txt_computer' value=" + student.computer +
                                        "></td>" ;
                        }
                        output_data +=
                            "<tr style='text-align:center;'><td style='font-size:12px'>" + student
                            .kh_name +
                            "</td>" +
                            "<td><input class='form-control txt_writing' value=" + student.writing +
                            "></td>" +
                            "<td><input class='form-control txt_essay' value=" + student.essay +
                            "></td>" +
                            "<td><input class='form-control txt_khmer' value=" + student.khmer +
                            "></td>" +
                            "<td><input class='form-control txt_morality' value=" + student
                            .morality + "></td>" +
                            "<td><input class='form-control txt_history' value=" + student.history +
                            "></td>" +
                            "<td><input class='form-control txt_geography' value=" + student
                            .geography + "></td>" +
                            "<td><input class='form-control txt_math' value=" + student.math +
                            "></td>" +
                            "<td><input class='form-control txt_physical' value=" + student
                            .physical + "></td>" +
                            "<td><input class='form-control txt_chemistry' value=" + student
                            .chemistry + "></td>" +
                            "<td><input class='form-control txt_biology' value=" + student.biology +
                            "></td>" +
                            "<td><input class='form-control txt_geology' value=" + student.geology +
                            "></td>" +
                            "<td><input class='form-control txt_house_education' value=" + student
                            .house_education + "></td>" +
                            "<td><input class='form-control txt_english' value=" + student.english +
                            "></td>" +
                            input_grade+
                            "<td hidden><input class='form-control txt_student_id' value=" + student
                            .student_id +
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


            }).fail((err) => {

            })




        })
        $('#btn_save_score').click(function() {

            var writing = []
            var essay = []
            var khmer = []
            var morality = []
            var history = []
            var geography = []
            var math = []
            var physical = []
            var chemistry = []
            var biology = []
            var house_education = []
            var english = []
            var geology = []
            var student_id = []
            var pe = []
            var computer = []
            var id = []
            var class_id = $('#select_class').val()
            var month_id = $('#select_month').val()

            $('.txt_writing').each(function() {
                writing.push($(this).val())
            })
            $('.txt_essay').each(function() {
                essay.push($(this).val())
            })
            $('.txt_khmer').each(function() {
                khmer.push($(this).val())
            })
            $('.txt_morality').each(function() {
                morality.push($(this).val())
            })
            $('.txt_history').each(function() {
                history.push($(this).val())
            })
            $('.txt_geography').each(function() {
                geography.push($(this).val())
            })
            $('.txt_math').each(function() {
                math.push($(this).val())
            })
            $('.txt_physical').each(function() {
                physical.push($(this).val())
            })
            $('.txt_chemistry').each(function() {
                chemistry.push($(this).val())
            })
            $('.txt_biology').each(function() {
                biology.push($(this).val())
            })
            $('.txt_house_education').each(function() {
                house_education.push($(this).val())
            })
            $('.txt_geology').each(function() {
                geology.push($(this).val())
            })
            $('.txt_english').each(function() {
                english.push($(this).val())
            })
            $('.txt_student_id').each(function() {
                student_id.push($(this).val())
            })
            $('.txt_pe').each(function() {
                pe.push($(this).val())
            })
            $('.txt_computer').each(function() {
                computer.push($(this).val())
            })

            var avg = $('#txt_avg').val()

            if (avg == "") {
                Swal.fire({
                    type: 'warning',
                    title: '',
                    text: 'សូមបញ្ជូលតួចែកជាមុនសិន'
                })
                return
            }

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
                    $.ajax({

                        type: 'post',
                        url: '{{ route('secondary-curriculum.store') }}',
                        data: {
                            '_token': '{{ csrf_token() }}',
                            'class_id': class_id,
                            'month_id': month_id,
                            'student_id': student_id,
                            'avg': avg,
                            'writing': writing,
                            'essay': essay,
                            'khmer': khmer,
                            'morality': morality,
                            'history': history,
                            'geography': geography,
                            'math': math,
                            'physical': physical,
                            'chemistry': chemistry,
                            'biology': biology,
                            'geology': geology,
                            'house_education': house_education,
                            'english': english,
                            'pe': pe,
                            'computer': computer,
                            'status': status,


                        },
                        beforeSend: function() {

                        },
                        success: function(data) {
                            $('#btn_save_score').removeClass('disabled')
                            $('#btn_save_score').html('បញ្ជូលពិន្ទុ')
                            Swal.fire({
                                'type': 'success',
                                'text': 'បញ្ជូលពិន្ទុបានជោគជ័យ',
                                'title': 'ពិន្ទុ'
                            }).then(function() {
                                $('#show_student').slideUp()
                            })

                        },
                        error: function(err) {
                            $('#btn_save_score').removeClass('disabled')
                            $('#btn_save_score').html('បញ្ជូលពិន្ទុ')
                        }


                    })




                }

            })



        })
    </script>
@endsection
