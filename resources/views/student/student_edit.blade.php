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
                    <a id="step1" href="#simple-classic-step1" data-toggle="tab">កែប្រែព័ត៌មានសិស្ស</a>
                </li>
            </ul>
            <!-- End Step Tabs -->

            <!-- Form -->
            <form class="form-horizontal" action="{{route('student.update',$d->id)}}" method="post"
                  enctype="multipart/form-data" id="frm">
                <!-- Steps Content -->
                <div class="card-block tab-content">
                    <!-- Step 1 -->
                    <div class="tab-pane m-t-md m-b-lg active" id="simple-classic-step1">
                        <div class="row">
                            @csrf
                            @method('PUT')
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Student ID*</label>
                                <input class="form-control" id="stuid" type="text"
                                       name="student_id" value="{{$d->student_id}}" readonly/>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឈ្មោះជាភាសាខ្មែរ*</label>
                                <input class="form-control" type="text" required
                                       name="kh_name" id="kh_name" value="{{$d->kh_name}}"/>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Full Name*</label>
                                <input class="form-control" type="text" required
                                       name="en_name" id="en_name" value="{{$d->en_name}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Sex*</label>
                                <select name="sex" class="form-control" id="sex">
                                    <option value="M">Male</option>
                                    <option value="F">Female</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>DOB*</label>
                                <input class="form-control" type="date" required
                                       name="dob" id="dob" value="{{$d->dob}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ភូមិកំណើត*</label>
                                <input class="form-control" type="text" required
                                       name="pob_v" id="pob_v" value="{{$d->pob_v}}" placeholder="បញ្ចូលភូមិកំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឃុំ/សង្កាត់កំណើត*</label>
                                <input class="form-control" type="text" required
                                       name="pob_c" id="pob_c" value="{{$d->pob_c}}" placeholder="បញ្ចូលឃុំ/សង្កាត់កំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ស្រុកកំណើត*</label>
                                <input class="form-control" type="text" required
                                       name="pob_d" id="pob_d" value="{{$d->pob_d}}" placeholder="បញ្ចូលស្រុកកំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ខេត្តកំណើត*</label>
                                <input class="form-control" type="text" required
                                       name="pob_p" id="pob_p" value="{{$d->pob_p}}" placeholder="បញ្ចូលខេត្តកំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ជាសិស្សមកពីសាលា</label>
                                <input class="form-control" type="text"
                                       name="old_school" id="old_school" value="{{$d->old_school}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>រៀនថ្នាក់ទី</label>
                                <input class="form-control" type="text"
                                       name="old_grade" id="old_grade" value="{{$d->old_grade}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឆ្នាំសិក្សាចាស់</label>
                                <input class="form-control" type="text"
                                       name="old_year" id="old_year" value="{{$d->old_year}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>លេខសម្គាល់សិស្សចាស់</label>
                                <input class="form-control" type="text"
                                       name="old_id" id="old_id" value="{{$d->old_id}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>From English School</label>
                                <input class="form-control" type="text"
                                       name="old_en_school" id="old_en_school" value="{{$d->old_en_school}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Grade</label>
                                <input class="form-control" type="text"
                                       name="old_en_grade" id="old_en_grade" value="{{$d->old_en_grade}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                            </div>
                        </div>
                        <div class="row">
                            @foreach($mo as $m)
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>ឈ្មោះម្ដាយ*</label>
                                    <input class="form-control" type="text" required
                                           name="khm" id="khm" value="{{$m->kh_name}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>Mother Name*</label>
                                    <input class="form-control" type="text" required
                                           name="enm" id="enm" value="{{$m->en_name}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>DOB*</label>
                                    <input class="form-control" type="date" required
                                           name="dobm" id="dobm" value="{{$m->dob}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>មុខរបរម្ដាយ*</label>
                                    <input class="form-control" type="text" required
                                           name="jobm" id="jobm" value="{{$m->job}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>លេខទូរស័ព្វម្ដាយ*</label>
                                    <input class="form-control" type="text" required
                                           name="phonem" id="phonem" value="{{$m->phone}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>Facebook ម្ដាយ</label>
                                    <input class="form-control" type="text"
                                           name="facebookm" id="facebookm" value="{{$m->facebook}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>Email ម្ដាយ</label>
                                    <input class="form-control" type="text"
                                           name="emailm" id="emailm" value="{{$m->email}}">
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
                                    <input class="form-control" type="text" value="{{$m->pob_v}}" required
                                           name="pob_vm" id="pob_vm" placeholder="បញ្ចូលភូមិកំណើត">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>ឃុំ/សង្កាត់កំណើតម្ដាយ*</label>
                                    <input class="form-control" type="text" value="{{$m->pob_c}}" required
                                           name="pob_cm" id="pob_cm" placeholder="បញ្ចូលឃុំ/សង្កាត់កំណើត">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>ស្រុកកំណើតម្ដាយ*</label>
                                    <input class="form-control" type="text" value="{{$m->pob_d}}" required
                                           name="pob_dm" id="pob_dm" placeholder="បញ្ចូលស្រុកកំណើត">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>ខេត្តកំណើតម្ដាយ*</label>
                                    <input class="form-control" type="text" value="{{$m->pob_p}}" required
                                           name="pob_pm" id="pob_pm" placeholder="បញ្ចូលខេត្តកំណើត">
                                </div>
                            @endforeach
                        </div>
                        <div class="row">
                            @foreach($fa as $f)
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>ឈ្មោះឱពុក*</label>
                                    <input class="form-control" type="text" required
                                           name="khf" id="khf" value="{{$f->kh_name}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>Father Name*</label>
                                    <input class="form-control" type="text" required
                                           name="enf" id="enf" value="{{$f->en_name}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>DOB*</label>
                                    <input class="form-control" type="date" required
                                           name="dobf" id="dobf" value="{{$f->dob}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>មុខរបរឱពុក*</label>
                                    <input class="form-control" type="text" required
                                           name="jobf" id="jobf" value="{{$f->job}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>លេខទូរស័ព្វឱពុក*</label>
                                    <input class="form-control" type="text" required
                                           name="phonef" id="phonef" value="{{$f->phone}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>Facebook ឱពុក</label>
                                    <input class="form-control" type="text"
                                           name="facebookf" id="facebookf" value="{{$f->facebook}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>Email ឱពុក</label>
                                    <input class="form-control" type="text"
                                           name="emailf" id="emailf" value="{{$f->email}}">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>សញ្ជាតិឱពុក*</label>
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
                                    <input class="form-control" type="text" value="{{$f->pob_v}}" required
                                           name="pob_vf" id="pob_vf" placeholder="បញ្ចូលភូមិកំណើត">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>ឃុំ/សង្កាត់កំណើតឱពុក*</label>
                                    <input class="form-control" type="text" value="{{$f->pob_c}}" required
                                           name="pob_cf" id="pob_cf" placeholder="បញ្ចូលឃុំ/សង្កាត់កំណើត">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>ស្រុកកំណើតឱពុក*</label>
                                    <input class="form-control" type="text" value="{{$f->pob_d}}" required
                                           name="pob_df" id="pob_df" placeholder="បញ្ចូលស្រុកកំណើត">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <label>ខេត្តកំណើតឱពុក*</label>
                                    <input class="form-control" type="text" value="{{$f->pob_p}}" required
                                           name="pob_pf" id="pob_pf" placeholder="បញ្ចូលខេត្តកំណើត">
                                </div>
                            @endforeach
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
                                Update
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
        $(document).ready(function () {
                    @foreach($fa as $f)
            var natf = "{{$f->nat}}";
            var af = "{{$f->alive}}";
                    @endforeach
                    @foreach($mo as $m)
            var natm = "{{$m->nat}}";
            var am = "{{$m->alive}}";
            @endforeach
            $('#sex').val("{{$d->sex}}");
            $('#natf').val(natf);
            $('#af').val(af);
            $('#natm').val(natm);
            $('#am').val(am);
        });
    </script>
@endsection