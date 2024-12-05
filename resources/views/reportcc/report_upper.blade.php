@extends('layout')

<style>
    @media print {
        @page {
            margin-top: 0;
            margin-bottom: 0;
        }
        /* html {margin:0 6cm} */
    }
    tr td {
        padding: 0 !important;
        margin: 0 !important;
    }
</style>
@section('content')
    <div class="row m-t">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header bg-blue bg-inverse">
                    <p style="text-align: left">លទ្ធផលប្រចាំខែសម្រាប់ថ្នាក់​វិទ្យាល័យ</p>
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
                    <div class="m-t row  show_class">
                        <div class="col-lg-3 col-md-3">
                            <select class="form-control" id="select_class">

                            </select>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <select class="form-control" id="select_month">

                                @foreach ($month as $row)
                                    <option value="{{ $row->id }}">
                                        {{ $row->name_kh }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <button class="btn btn-primary btn-sm" id="btn_show_report">បង្ហាញទិន្ន័យ</button>
                            <button class="btn btn-primary btn-sm" id="btn_print">Print</button>
                        </div>
                    </div>
                    <div class="m-t-3">
                        <br />
                        <br />
                        <div id="show_report">


                            <div style="margin-top: 30px">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div style="text-align: left;">
                                            <br />
                                            <img src="http://localhost:8000/theme/pic/logo.png" alt=""
                                                style="width: 60px;height: 70px;float: left;">
                                            <p class="m-l" style="padding-top: 10px;">សាលាចំណេះទូទៅអរន្តជាតិ​ ឌូវី
                                                <br /><span class="m-a">ទីតាំងរំចេក៤ ខេត្តបាត់ដំបង</span>
                                            </p>

                                        </div>
                                        <div style="text-align: right;margin-top: -120px">
                                            {{-- <p style="padding-right: 15px">ព្រះរាជាណាចក្រកម្ពុជា
                                            </p>
                                            <p style="margin-top: -5px;">
                                             ជាតិ សាសនា
                                                    ព្រះមហាក្សត្រ</span>
                                            </p>
                                            <p style="font-family:'tacteing'">
                                                3
                                            </p> --}}
                                            <img src="{{ asset('fonts/mOUcogV.jpg') }}" alt=""
                                                style="width: 250px;height: 120px;">
                                        </div>
                                    </div>


                                </div>
                                <div class="m-t">
                                    <p style="text-align: center">ចំណាត់ថ្នាក់ប្រចាំ ខែ <span id="txt_month"></span> <br />
                                        <span id="txt_grade"></span>
                                         <span id="txt_year"></span>
                                    </p>

                                </div>
                                <table class="table table-bordered table-condensed " id="tbl_result">
                                    <thead style=" color: black;
                                    font-size: 12px;background-color: white">
                                       <tr>
                                        <th style="text-align: center ;width: 5%">
                                            លរ
                                        </th>

                                        <th style="text-align: center;width: 30%">
                                            ឈ្មោះសិស្ស
                                        </th>
                                        <th style="text-align: center;width: 5%">
                                            ភេទ
                                        </th>
                                        <th style="text-align: center;width: 10%">
                                            ពិន្ទុសរុប
                                        </th>
                                        <th style="text-align: center;width: 10%">
                                            មធ្យមភាគ
                                        </th>
                                        <th style="text-align: center;width: 5%;">
                                            ចំ.ថ្នាក់
                                        </th>
                                        <th style="text-align: center;width: 15%;">
                                            និទ្ទេសន៍
                                        </th>
                                        <th style="text-align: center;width: 20%;">
                                            ផ្សេងៗ
                                        </th>
                                       </tr>
                                    </thead>

                                    <tbody>

                                    </tbody>
                                </table>


                            </div>
                            <div class="buttom_print_footer">
                                <div class="m-t">
                                    <p style="margin-left:50px;font-size: 12px;"> សិស្សសរុបមាន : <span id="total_student"></span></p>
                                    <p style="margin-top: -5px;margin-left:50px;font-size: 12px;"> សិស្សស្រីមាន : <span
                                            id="total_student_girl"></span></p>
                                </div>
                                <div style="text-align: right;">
                                    <p style="font-size: 12px;">ឌូវី , ថ្ងៃទី ៣១ ខែ កក្កដា ឆ្នាំ២០២៤</p>
                                    <p style="padding-right: 50px;margin-top: -12px;font-size: 12px;">គ្រូបន្ទុកថ្នាក់</p>
                                </div>
                                <div style="text-align: left;    margin-left: 40px;">
                                    <p style="font-size: 12px;">បានឃើញ និងងកភាព</p>
                                    <p style="padding-left: 25px;margin-top: -15px;font-size: 12px;">នាយកសាលា</p>
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
    <script src="{{ asset('js/print/printThis.js') }}"></script>
    <script>
        $('.show_class').hide()
        $('#show_report').hide()
        var year = ""
        var grede = ""

        $('#select_academic').change(function() {

            $.ajax(

                {
                    type: "post",
                    url: '{{ route('getclassuppercc') }}',
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

                    Swal.fire({
                        type: 'warning',
                        title: '',
                        text: 'មិនមានថ្នាក់រៀនសម្រាប់ឆ្នាំសិក្សានេះទេ'
                    })
                    return

                } else {


                    var select = ""
                    data.class.forEach(function(d) {

                        select += "<option data-grade=" + d.grade + " value=" + d.id +
                            ">ថ្នាក់ទី : " + d.grade + "  </option>"
                    })

                    $('.status_loading').hide()
                    $('.show_class').slideDown()
                    $('#select_class').html(select)

                }


            }).fail((data) => {

            })


        })

        function printDiv() {
            $('#show_report').printThis({
                importCSS: true,
                importStyle: true,
            });

        }

        function convertToKhmerNumbers(input) {
            // Define mappings between Arabic and Khmer digits
            const arabicToKhmerMap = {
                "0": "០",
                "1": "១",
                "2": "២",
                "3": "៣",
                "4": "៤",
                "5": "៥",
                "6": "៦",
                "7": "៧",
                "8": "៨",
                "9": "៩"
            };

            // Replace each Arabic digit in the input with the corresponding Khmer digit
            return input.replace(/[0-9]/g, digit => arabicToKhmerMap[digit]);
        }


        function getGrade(average) {
            let grade = '';
            if (average >= 48.00 || average >=50.00) {
                grade = 'ល្អប្រសើរ';
            } else if (average >= 45.99 || average >=47.99) {
                grade = 'ល្អណាស់';
            } else if (average >= 40.00 || average >= 44.99) {
                grade = 'ល្អ';
            } else if (average >= 32.50 || average >= 39.99) {
                grade = 'ល្អបង្គួរ';
            }
            else if (average >= 25.00 || average >= 32.49) {
                grade = 'មធ្យម';
            }
            else {
                grade = 'ធ្លាក់';
            }

            return grade;
        }

        function getRank() {
            const sorted = [...arr].sort((a, b) => b - a);
            return arr.map((x) => sorted.indexOf(x) + 1);
        }
        $('#btn_print').click(function() {
            $('#btn_print').html('Priting')
            setTimeout(() => {
                $('#btn_print').html('Print')
            }, 2000);

            printDiv({
                importCSS: true,
                importStyle: true,
                removeInline: false
            })
        })
        $('#btn_show_report').click(function() {

            var class_id = $('#select_class').val()
            var month_id = $('#select_month').val()
            var total_student = 0
           var total_student_girl =0
            $('#txt_year').html(convertToKhmerNumbers($('#select_academic option:selected').text()))
            $('#txt_grade').html(convertToKhmerNumbers($('#select_class option:selected').text()))
            $('#txt_month').html($('#select_month option:selected').text())
            $.ajax({
                type: 'post',
                url: '{{ route('reportuper_cc_per_month') }}',
                data: {
                    '_token': '{{ csrf_token() }}',
                    'class_id': class_id,
                    'month_id': month_id
                },
                beforeSend: function() {
                    $('#btn_show_report').html('កំពុងទាញទិន្ន័យ')
                }
            }).then((data) => {

                if (data.status == 0) {

                    // have data
                    var output_data = ""
                    var i = 1
                    var sum_score
                    data.data.forEach(function(student) {
                        student.khmer = student.khmer == null ? 0 : student.khmer
                        student.morality = student.morality == null ? 0 : student.morality
                        student.history = student.history == null ? 0 : student.history
                        student.geography = student.geography == null ? 0 : student.geography
                        student.math = student.math == null ? 0 : student.math
                        student.geography = student.geography == null ? 0 : student.geography
                        student.math = student.math == null ? 0 : student.math
                        student.physical = student.physical == null ? 0 : student.physical
                        student.chemistry = student.chemistry == null ? 0 : student.chemistry
                        student.biology = student.biology == null ? 0 : student.biology
                        student.earth_science = student.earth_science == null ? 0 : student
                            .earth_science
                        student.english = student.english == null ? 0 : student
                            .english
                        // student.english = student.english == null ? 0 : student.english
                        if (student.computer == "0.0.1") {
                            student.computer = 0
                        } else {
                            student.computer = student.computer
                        }
                        if (student.pe == "0.0.1") {
                            student.pe = 0
                        } else {
                            student.pe = student.pe
                        }

                        student.totalScore = student.khmer + student.morality + student.history +
                            student.geography + student.math + student.physical + student
                            .chemistry + student.biology +
                            student.earth_science + student.english + parseFloat(student.pe) +
                            parseFloat(student.computer)

                    })
                    let sortedStudents = data.data.sort((a, b) => b.totalScore - a
                        .totalScore);

                    //console.log(sortedStudents)
                    // Step 3: Assign ranks based on total scores
                    var rank = 1
                    sortedStudents.forEach((st, index) => {

                        // st.rank = index + 1;

                        if (index > 0 && st.totalScore === sortedStudents[index - 1]
                            .totalScore) {
                            st.rank = sortedStudents[index - 1]
                                .rank; // Same rank as previous student
                        } else {
                            st.rank = rank;
                        }
                        rank++;
                    });
                    var color_check = "black"

                    data.data.forEach(function(student) {

                        if (student.rank == 1 || student.rank == 2 || student.rank == 3) {
                            color_check = "red"

                        } else {
                            color_check = "black"
                        }
                        if(student.sex == "ស")
                        {
                            total_student_girl=total_student_girl+1;

                        }
                        // var total_avg =1;
                        var total_avg = parseFloat(student.totalScore) / parseFloat(student.avg_m)
                        var rank_print
                        if(total_avg == 0 )
                        {
                            rank_print =0
                        }else{
                            rank_print =student.rank
                        }
                        output_data +=
                            "<tr style='text-align:center;'><td style='font-size:12px'>" + i++ +
                            "</td>" +
                            "<td style='font-size:12px;text-align:left;'>" + student
                            .kh_name +
                            "</td>" +
                            "<td style='font-size:12px'>" + student
                            .sex +
                            "</td>" +
                            "<td style='font-size:12px'>" + student.totalScore +
                            "</td>" +
                            "<td style='font-size:12px'>" +
                            total_avg.toFixed(2) +
                            "</td>" +
                            "<td style='font-size:12px;color:" + color_check + "'>" + student.rank +
                            "</td>" +
                            "<td style='font-size:12px'>"+getGrade(total_avg.toFixed(2))+"</td>" +
                            "<td style='font-size:12px'></td><tr/>"

                    })
                    for(i;i<=35;i)
                    {
                        output_data +=
                            "<tr style='text-align:center;'><td style='font-size:12px'>" + i++ +
                            "</td>" +
                            "<td style='font-size:12px;text-align:left;'></td>" +
                            "<td style='font-size:12px'></td>" +
                            "<td style='font-size:12px'> </td>" +
                            "<td style='font-size:12px'></td>" +
                            "<td style='font-size:12px;'></td>" +
                            "<td style='font-size:12px'></td>" +
                            "<td style='font-size:12px'></td><tr/>"
                    }
                    $('#total_student').html(data.data.length)
                    $('#total_student_girl').html(total_student_girl)
                    $('#tbl_result tbody').html(output_data)
                    $('#show_report').slideDown()
                } else {

                    // No Daga
                    Swal.fire({
                        type: 'warning',
                        title: '',
                        text: 'មិនមានពិន្ទសម្រាប់ទាញ Report'
                    })
                    $('#btn_show_report').html('បង្ហាញទិន្ន័យ')
                    $('#show_report').slideUp()

                }

                $('#btn_show_report').html('បង្ហាញទិន្ន័យ')
            }).fail((err) => {

                $('#btn_show_report').html('បង្ហាញទិន្ន័យ')

            })



        })
    </script>
@endsection
