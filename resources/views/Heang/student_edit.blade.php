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
        <div class="card js-wizard-simple" id="add-student">
            <!-- Step Tabs -->
            <ul class="nav nav-tabs nav-justified" id="menu">
                <li class="active">
                    <a id="step1" href="#simple-classic-step1" data-toggle="tab">កែប្រែព័ត៌មានសិស្ស</a>
                </li>
            </ul>
            <!-- End Step Tabs -->

            <!-- Form -->
            <form class="form-horizontal" action="{{ route('student.update', $student->id) }}" method="POST" enctype="multipart/form-data" id="add">
                <!-- Steps Content -->
                <div class="card-block tab-content">
                    <!-- Step 1 -->
                    <div class="tab-pane m-t-md m-b-lg active" id="simple-classic-step1">
                        <div class="row">
                            {{ csrf_field() }} {{ method_field('PUT') }}

                       		<input type="hidden" name="id" id="id" value="{{$student->id}}">

                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Student ID*</label>
                                <input class="form-control" id="stuid" type="text" name="student_id" value="{{$student->student_id}}"/>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឈ្មោះជាភាសាខ្មែរ*</label>
                                <input class="form-control" type="text" required name="kh_name" id="kh_name" placeholder="បញ្ចូលឈ្មោះ..." value="{{$student->kh_name}}" />
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Full Name*</label>
                                <input class="form-control" type="text" required name="en_name" id="en_name" placeholder="Enter Student's Name..." value="{{$student->en_name}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label for="simple-classic-email">Sex*</label>
                                <select name="sex" class="form-control" id="sex" value="{{$student->sex}}">
                                	@if ($student->sex == 'F')
                                		<option value="F">Female</option>
                                		<option value="M">Male</option>
                                	@else
                                		<option value="M">Male</option>
                                		<option value="F">Female</option>
                                	@endif
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>DOB*</label>
                                <input class="form-control" type="date" required name="dob" id="dob" placeholder="Please enter student's Date Of Birth..." value="{{$student->dob}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>លេខទូរស័ព្ទ*</label>
                                <input type="tel" class="form-control" required name="stel" id="stel" placeholder="Enter Phone Number" value="{{$student->phone_student}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>សញ្ជាតិ*</label>
                                <input type="text" class="form-control" required name="national" id="national" placeholder="Enter National" value="{{$student->national}}">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ភូមិកំណើត*</label>
                                <input class="form-control" type="text" required name="pob_v" id="pob_v" placeholder="បញ្ចូលភូមិកំណើត" value="{{$student->village_pob}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឃុំ/សង្កាត់កំណើត*</label>
                                <input class="form-control" type="text" required name="pob_c" id="pob_c" placeholder="បញ្ចូលឃុំ/សង្កាត់កំណើត" value="{{$student->commue_pob}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ស្រុកកំណើត*</label>
                                <input class="form-control" type="text" required name="pob_d" id="pob_d" placeholder="បញ្ចូលស្រុកកំណើត" value="{{$student->district_pob}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ខេត្តកំណើត*</label>
                                <input class="form-control" type="text" required name="pob_p" id="pob_p" placeholder="បញ្ចូលខេត្តកំណើត" value="{{$student->province_pob}}">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ភូមិបច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required name="cur_v" id="cur_v" placeholder="បញ្ចូលភូមិបច្ចប្បុន្ន" value="{{$student->village_current}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឃុំ/សង្កាត់បច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required name="cur_c" id="cur_c" placeholder="បញ្ចូលឃុំ/សង្កាត់បច្ចប្បុន្ន" value="{{$student->commue_current}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ស្រុកបច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required name="cur_d" id="cur_d" placeholder="បញ្ចូលស្រុកបច្ចប្បុន្ន" value="{{$student->district_current}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ខេត្តបច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required name="cur_p" id="cur_p" placeholder="បញ្ចូលខេត្តបច្ចប្បុន្ន" value="{{$student->province_current}}">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ជាសិស្សមកពីសាលា</label>
                                <input class="form-control" type="text" name="old_school" id="old_school" placeholder="បញ្ចូលឈ្មោះសាលា..." value="{{$student->old_school}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ថ្នាក់ទី</label>
                                <input class="form-control" type="text" name="old_school_grade" id="old_school_grade" placeholder="Enter Old School Grade..." value="{{$student->old_grade}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>From English School</label>
                                <input class="form-control" type="text" name="old_en_school" id="old_en_school" placeholder="Enter English School Name..." value="{{$student->old_en_grade}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Mother Name*</label>
                                <input class="form-control" type="text" required name="mname" id="mname" placeholder="Enter Mother's Name..." value="{{$student->mother_name}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>មុខរបរម្ដាយ*</label>
                                <input class="form-control" type="text" required name="jobm" id="jobm" placeholder="បញ្ចូលមុខរបរម្ដាយ..." value="{{$student->mother_job}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>សញ្ជាតិម្ដាយ</label>
                                <select name="natm" class="form-control" id="natm" value="{{$student->national_mother}}">
                                    @if ($student->national_mother == 'ខ្មែរ')
                                		<option value="ខ្មែរ">ខ្មែរ</option>
                                    	<option value="បរទេស">បរទេស</option>
                                	@else
                                		<option value="បរទេស">បរទេស</option>
                                		<option value="ខ្មែរ">ខ្មែរ</option>
                                	@endif
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>អាស័ដ្ឋាន*</label>
                                <input class="form-control" type="text" required name="pob_vm" id="pob_vm" placeholder="បញ្ចូលអាស័ដ្ឋាន" value="{{$student->address_mother}}">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Father Name*</label>
                                <input class="form-control" type="text" required name="fnm" id="fnm" placeholder="Enter Father's Name..." value="{{$student->farther_name}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Father Job*</label>
                                <input class="form-control" type="text" required name="jobf" id="jobf" placeholder="Enter Father Job..." value="{{$student->farther_job}}">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>សញ្ជាតិឪពុក</label>
                                <select name="natf" class="form-control" id="natf" value="{{$student->national_far}}">
                                    @if ($student->national_far == 'ខ្មែរ')
                                		<option value="ខ្មែរ">ខ្មែរ</option>
                                    	<option value="បរទេស">បរទេស</option>
                                	@else
                                		<option value="បរទេស">បរទេស</option>
                                		<option value="ខ្មែរ">ខ្មែរ</option>
                                	@endif
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>លេខទូរស័ព្ទ*</label>
                                <input class="form-control" type="text" required name="telf" id="telf" placeholder="Enter Phone Number..." value="{{$student->phone_farther}}">
                            </div>
                        </div>
                        <div class="row">
                        	<div class="col-sm-12 col-md-3 col-lg-3">
                        		<label>អាស័ដ្ឋាន*</label>
                        		<input type="text" class="form-control" name="pob_vf" id="pob_vf" placeholder="Enter Address..." value="{{$student->address_farther}}">
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

    </script>
@endsection
