@extends('layout')
@section('content')
    <style>
        .col-lg-3 {
            margin-bottom: 18px;
        }

        .col-lg-4 {
            margin-bottom: 18px;
        }
        label {
            color: #5bc0de;
        }
        .card > .nav-tabs > li.active > a, .card > .nav-tabs > li.active > a:hover, .card > .nav-tabs > li.active > a:focus {
            background-color: #fff;
            box-shadow: inset 0 2px #5bc0de;
        }
    </style>
    <div class="col-lg-12">
        <div class="card js-wizard-simple">
            <!-- Step Tabs -->
            <ul class="nav nav-tabs nav-justified" id="menu">
                <li class="active">
                    <a id="step1" href="#simple-classic-step1" data-toggle="tab">ទម្រង់ចុះឈ្មោះសិស្សចូលរៀន</a>
                </li>
            </ul>
            <!-- End Step Tabs -->

            <!-- Form -->
            <form class="form-horizontal" action="{{route('student.store')}}" method="post"
                  enctype="multipart/form-data" id="frm">
                <!-- Steps Content -->
                <div class="card-block tab-content">
                    <!-- Step 1 -->
                    <div class="tab-pane m-t-md m-b-lg active" id="simple-classic-step1">
                        <div class="row">
                            @csrf
                            @foreach($sid as $i)
                                @php $oid = sprintf('%04d',$i->student_id+1); @endphp
                            @endforeach
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Student ID*</label>
                                <label id="idst"></label>
                                @php if(isset($oid)){ @endphp
                                <input class="form-control" id="stuid" type="text"
                                       name="student_id" value="{{ $oid }}"/>
                                <input type="hidden" id="chkid" value="0">
                                @php }else{ @endphp
                                <input class="form-control" id="stuid" type="text"
                                       name="student_id" value="0001"/>
                                <input type="hidden" id="chkid" value="0">
                                @php } @endphp
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឈ្មោះជាភាសាខ្មែរ*</label>
                                <input class="form-control" type="text" required
                                       name="kh_name" id="kh_name" placeholder="បញ្ចូលឈ្មោះ..."/>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Full Name*</label>
                                <input class="form-control" type="text" required
                                       name="en_name" id="en_name" placeholder="Enter Student's Name...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label for="simple-classic-email">Sex*</label>
                                <select name="sex" class="form-control" id="sex">
                                    <option value="M">Male</option>
                                    <option value="F">Female</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>DOB*</label>
                                <input class="form-control" type="date" required
                                       name="dob" id="dob" placeholder="Please enter student's Date Of Birth...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>សញ្ជាតិ*</label>
                                <select class="form-control" name="nat" id="nat">
                                    <option value="ខ្មែរ">ខ្មែរ</option>
                                    <option value="បរទេស">បរទេស</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Photo*</label>
                                <input class="form-control" type="file"
                                       name="photo" id="photo" placeholder="Enter Student's Address...">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ភូមិកំណើត*</label>
                                <input class="form-control" type="text" required
                                       name="pob_v" id="pob_v" placeholder="បញ្ចូលភូមិកំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឃុំ/សង្កាត់កំណើត*</label>
                                <input class="form-control" type="text" required
                                       name="pob_c" id="pob_c" placeholder="បញ្ចូលឃុំ/សង្កាត់កំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ស្រុកកំណើត*</label>
                                <input class="form-control" type="text" required
                                       name="pob_d" id="pob_d" placeholder="បញ្ចូលស្រុកកំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ខេត្តកំណើត*</label>
                                <input class="form-control" type="text" required
                                       name="pob_p" id="pob_p" placeholder="បញ្ចូលខេត្តកំណើត">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ភូមិបច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required
                                       name="cur_v" id="cur_v" placeholder="បញ្ចូលភូមិបច្ចប្បុន្ន">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឃុំ/សង្កាត់បច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required
                                       name="cur_c" id="cur_c" placeholder="បញ្ចូលឃុំ/សង្កាត់បច្ចប្បុន្ន">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ស្រុកបច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required
                                       name="cur_d" id="cur_d" placeholder="បញ្ចូលស្រុកបច្ចប្បុន្ន">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ខេត្តបច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required
                                       name="cur_p" id="cur_p" placeholder="បញ្ចូលខេត្តបច្ចប្បុន្ន">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ជាសិស្សមកពីសាលា</label>
                                <input class="form-control" type="text"
                                       name="old_school" id="old_school" placeholder="បញ្ចូលឈ្មោះសាលា...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>រៀនថ្នាក់ទី</label>
                                <input class="form-control" type="text"
                                       name="old_grade" id="old_grade" placeholder="បញ្ចូលកម្រឹតសិក្សា...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឆ្នាំសិក្សាចាស់</label>
                                <input class="form-control" type="text"
                                       name="old_year" id="old_year" placeholder="បញ្ចូលឆ្នាំសិក្សាចាស់...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>លេខសម្គាល់សិស្សចាស់</label>
                                <input class="form-control" type="text"
                                       name="old_id" id="old_id" placeholder="បញ្ចូលលេខសម្គាល់សិក្សាចាស់...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>From English School</label>
                                <input class="form-control" type="text"
                                       name="old_en_school" id="old_en_school" placeholder="Enter English School Name...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Grade</label>
                                <input class="form-control" type="text"
                                       name="old_en_grade" id="old_en_grade" placeholder="Enter English School Grade...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឈ្មោះម្ដាយ*</label>
                                <input class="form-control" type="text" required
                                       name="khm" id="khm" placeholder="បញ្ចូលឈ្មោះម្ដាយ...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Mother Name*</label>
                                <input class="form-control" type="text" required
                                       name="enm" id="enm" placeholder="Enter Mother's Name...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>DOB*</label>
                                <input class="form-control" type="date" required
                                       name="dobm" id="dobm" placeholder="Please enter mother's Date Of Birth...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>មុខរបរម្ដាយ*</label>
                                <input class="form-control" type="text" required
                                       name="jobm" id="jobm" placeholder="បញ្ចូលមុខរបរម្ដាយ...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>លេខទូរស័ព្វម្ដាយ*</label>
                                <input class="form-control" type="text" required
                                       name="phonem" id="phonem" placeholder="បញ្ចូលលេខទូរស័ព្វម្ដាយ...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Facebook ម្ដាយ</label>
                                <input class="form-control" type="text"
                                       name="facebookm" id="facebookm" placeholder="បញ្ចូល Facebook ម្ដាយ...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Email ម្ដាយ</label>
                                <input class="form-control" type="text"
                                       name="emailm" id="emailm" placeholder="បញ្ចូល Email ម្ដាយ...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>សញ្ជាតិម្ដាយ</label>
                                <select name="natm" class="form-control" id="natm">
                                    <option value="ខ្មែរ">ខ្មែរ</option>
                                    <option value="បរទេស">បរទេស</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label for="simple-classic-email">ស្ថានភាព*</label>
                                <select name="am" class="form-control" id="am">
                                    <option value="1">នៅរស់</option>
                                    <option value="0">ស្លាប់</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ភូមិកំណើតម្ដាយ*</label>
                                <input class="form-control" type="text" required
                                       name="pob_vm" id="pob_vm" placeholder="បញ្ចូលភូមិកំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឃុំ/សង្កាត់កំណើតម្ដាយ*</label>
                                <input class="form-control" type="text" required
                                       name="pob_cm" id="pob_cm" placeholder="បញ្ចូលឃុំ/សង្កាត់កំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ស្រុកកំណើតម្ដាយ*</label>
                                <input class="form-control" type="text" required
                                       name="pob_dm" id="pob_dm" placeholder="បញ្ចូលស្រុកកំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ខេត្តកំណើតម្ដាយ*</label>
                                <input class="form-control" type="text" required
                                       name="pob_pm" id="pob_pm" placeholder="បញ្ចូលខេត្តកំណើត">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឈ្មោះឱពុក*</label>
                                <input class="form-control" type="text" required
                                       name="khf" id="khf" placeholder="បញ្ចូលឈ្មោះឱពុក...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Father Name*</label>
                                <input class="form-control" type="text" required
                                       name="enf" id="enf" placeholder="Enter ​Father's Name...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>DOB*</label>
                                <input class="form-control" type="date" required
                                       name="dobf" id="dobf" placeholder="Please enter father's Date Of Birth...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>មុខរបរឱពុក*</label>
                                <input class="form-control" type="text" required
                                       name="jobf" id="jobf" placeholder="បញ្ចូលមុខរបរឱពុក...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>លេខទូរស័ព្វឱពុក*</label>
                                <input class="form-control" type="text" required
                                       name="phonef" id="phonef" placeholder="បញ្ចូលលេខទូរស័ព្វឱពុក...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Facebook ឱពុក</label>
                                <input class="form-control" type="text"
                                       name="facebookf" id="facebookf" placeholder="បញ្ចូល Facebook ឱពុក...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Email ឱពុក</label>
                                <input class="form-control" type="text"
                                       name="emailf" id="emailf" placeholder="បញ្ចូល Email ឱពុក...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>សញ្ជាតិឱពុក</label>
                                <select name="natf" class="form-control" id="natf">
                                    <option value="ខ្មែរ">ខ្មែរ</option>
                                    <option value="បរទេស">បរទេស</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label for="simple-classic-email">ស្ថានភាព*</label>
                                <select name="af" class="form-control" id="af">
                                    <option value="1">នៅរស់</option>
                                    <option value="0">ស្លាប់</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ភូមិកំណើតឱពុក*</label>
                                <input class="form-control" type="text" required
                                       name="pob_vf" id="pob_vf" placeholder="បញ្ចូលភូមិកំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឃុំ/សង្កាត់កំណើតឱពុក*</label>
                                <input class="form-control" type="text" required
                                       name="pob_cf" id="pob_cf" placeholder="បញ្ចូលឃុំ/សង្កាត់កំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ស្រុកកំណើតឱពុក*</label>
                                <input class="form-control" type="text" required
                                       name="pob_df" id="pob_df" placeholder="បញ្ចូលស្រុកកំណើត">
                            </div>
                            <input type="hidden" value="{{ \Illuminate\Support\Facades\Auth::user()->camp_id }} " id="campus_id" name="campus_id"/>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ខេត្តកំណើតឱពុក*</label>
                                <input class="form-control" type="text" required
                                       name="pob_pf" id="pob_pf" placeholder="បញ្ចូលខេត្តកំណើត">
                            </div>
                        </div>
                    </div>
                    <!-- End Step 1 -->
                </div>
                <!-- End Steps Content -->

                <!-- Steps Navigation -->
                <div class="card-block b-t">
                    <div class="row">
                        <div class="col-xs-6">
                            <button class="wizard-prev btn btn-info" type="button" style="display: none">Back</button>
                        </div>
                        <div class="col-xs-6 text-right">
                            <button class="wizard-finish btn btn-app-blue" type="submit" id="submit"><i
                                        class="ion-checkmark m-r-xs"></i>
                                Register
                            </button>
                        </div>
                    </div>
                </div>
                <!-- End Steps Navigation -->
            </form>
            <!-- End Form -->
        </div>
        <!-- .card -->
        <!-- End Simple Classic Wizard -->
    </div>
@endsection
@section('footer')
    <script>
        function chkstid(){
            var stid = $('#stuid').val()
            if (stid == '') {
                Swal.fire(
                    'Error !',
                    'Please Enter Student ID !',
                    'error'
                )
            } else {
                $.ajax({
                    url: '{{route('chksid')}}',
                    type: 'post',
                    data: {
                        '_token': '{{csrf_token()}}',
                        'student_id': stid,
                    },
                    success: function (data) {
                        if (data > 0) {
                            Swal.fire(
                                'Error !',
                                'The Student ID You Entered Already Exists !',
                                'error'
                            )
                            $('#stuid').css("border-color", "red")
                            $('#idst').css("color", "red")
                            $('#chkid').val(0)
                            document.getElementById("idst").innerHTML = "ID លេខ" + stid + " មានរួចហើយ !";
                        } else {
                            $('#stuid').css("border-color", "#5cb85c")
                            $('#idst').css("color", "#5cb85c")
                            $('#chkid').val(1)
                            document.getElementById("idst").innerHTML = "ID អាចប្រើប្រាស់បាន !";
                        }
                    }
                })
            }
        }
        $('#stuid').change(function () {
            chkstid()
        })
    </script>
    <script>
        chkstid()
    </script>
    <script>
        $("#frm").submit(function () {
            var ch = $('#chkid').val();
            if(ch == 0){
                Swal.fire({
                    title: '<p style="font-size: 19px;">Not Enough Information !</p>',
                    html: 'Please Check Your Form Again !',
                    type: 'error'
                })
                return false;
            }else{
                return true;
            }
        });
    </script>
@endsection