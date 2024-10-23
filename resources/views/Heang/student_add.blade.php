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
                    <a id="step1" href="#simple-classic-step1" data-toggle="tab">ទម្រង់ចុះឈ្មោះសិស្សចូលរៀន</a>
                </li>
            </ul>
            <!-- End Step Tabs -->

            <!-- Form -->
            <form class="form-horizontal" action="{{ route('student.store') }}" method="POST" enctype="multipart/form-data" id="add">
                <!-- Steps Content -->
                <div class="card-block tab-content">
                	@if(session('message'))
  						{{session('message')}}
					@endif
                    <!-- Step 1 -->
                    <div class="tab-pane m-t-md m-b-lg active" id="simple-classic-step1">
                        <div class="row">
                            @csrf

                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Student ID*</label>
                                <input class="form-control" id="stuid" type="text" name="student_id" placeholder="បញ្ចូលលេខសំគាល់សិស្ស" />
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឈ្មោះជាភាសាខ្មែរ*</label>
                                <input class="form-control" type="text" required name="kh_name" id="kh_name" placeholder="បញ្ចូលឈ្មោះ..."/>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Full Name*</label>
                                <input class="form-control" type="text" required name="en_name" id="en_name" placeholder="Enter Student's Name...">
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
                                <input class="form-control" type="date" required name="dob" id="dob" placeholder="Please enter student's Date Of Birth...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>លេខទូរស័ព្ទ*</label>
                                <input type="tel" class="form-control" required name="stel" id="stel" placeholder="Enter Phone Number">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>សញ្ជាតិ*</label>
                                <input type="text" class="form-control" required name="national" id="national" placeholder="Enter National">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ភូមិកំណើត*</label>
                                <input class="form-control" type="text" required name="pob_v" id="pob_v" placeholder="បញ្ចូលភូមិកំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឃុំ/សង្កាត់កំណើត*</label>
                                <input class="form-control" type="text" required name="pob_c" id="pob_c" placeholder="បញ្ចូលឃុំ/សង្កាត់កំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ស្រុកកំណើត*</label>
                                <input class="form-control" type="text" required name="pob_d" id="pob_d" placeholder="បញ្ចូលស្រុកកំណើត">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ខេត្តកំណើត*</label>
                                <input class="form-control" type="text" required name="pob_p" id="pob_p" placeholder="បញ្ចូលខេត្តកំណើត">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ភូមិបច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required name="cur_v" id="cur_v" placeholder="បញ្ចូលភូមិបច្ចប្បុន្ន">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ឃុំ/សង្កាត់បច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required name="cur_c" id="cur_c" placeholder="បញ្ចូលឃុំ/សង្កាត់បច្ចប្បុន្ន">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ស្រុកបច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required name="cur_d" id="cur_d" placeholder="បញ្ចូលស្រុកបច្ចប្បុន្ន">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ខេត្តបច្ចប្បុន្ន*</label>
                                <input class="form-control" type="text" required name="cur_p" id="cur_p" placeholder="បញ្ចូលខេត្តបច្ចប្បុន្ន">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ជាសិស្សមកពីសាលា</label>
                                <input class="form-control" type="text" name="old_school" id="old_school" placeholder="បញ្ចូលឈ្មោះសាលា...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>ថ្នាក់ទី</label>
                                <input class="form-control" type="text" name="old_school_grade" id="old_school_grade" placeholder="Enter Old School Grade...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>From English School</label>
                                <input class="form-control" type="text" name="old_en_school" id="old_en_school" placeholder="Enter English School Name...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Mother Name*</label>
                                <input class="form-control" type="text" required name="mname" id="mname" placeholder="Enter Mother's Name...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>មុខរបរម្ដាយ*</label>
                                <input class="form-control" type="text" required name="jobm" id="jobm" placeholder="បញ្ចូលមុខរបរម្ដាយ...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>សញ្ជាតិម្ដាយ</label>
                                <select name="natm" class="form-control" id="natm">
                                    <option value="ខ្មែរ">ខ្មែរ</option>
                                    <option value="បរទេស">បរទេស</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>អាស័ដ្ឋាន*</label>
                                <input class="form-control" type="text" required name="pob_vm" id="pob_vm" placeholder="បញ្ចូលអាស័ដ្ឋាន">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Father Name*</label>
                                <input class="form-control" type="text" required name="fnm" id="fnm" placeholder="Enter Father's Name...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>Father Job*</label>
                                <input class="form-control" type="text" required name="jobf" id="jobf" placeholder="Enter Father Job...">
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>សញ្ជាតិម្ដាយ</label>
                                <select name="natf" class="form-control" id="natf">
                                    <option value="ខ្មែរ">ខ្មែរ</option>
                                    <option value="បរទេស">បរទេស</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <label>លេខទូរស័ព្ទ*</label>
                                <input class="form-control" type="text" required name="telf" id="telf" placeholder="Enter Phone Number...">
                            </div>
                        </div>
                        <div class="row">
                        	<div class="col-sm-12 col-md-3 col-lg-3">
                        		<label>អាស័ដ្ឋាន*</label>
                        		<input type="text" class="form-control" name="pob_vf" id="pob_vf" placeholder="Enter Address...">
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

    	// $(function() {
	    //     $('#add-student form').on('submit', function(e) {
	    //     if (!e.isDefaultPrevented()) {
	    //         $.ajax({
	    //             url: "",
	    //             type: "POST",
	    //             data: $('#add-student form').serialize(),
	    //             success: function(data) {
	    //                 swal({
	    //                     title: 'Success!',
	    //                     text: "Data has been inserted!",
	    //                     type: "success",
	    //                     timer: '1500'
	    //                 })
	    //             },
	    //             error: function() {
	    //                 swal({
	    //                     title: 'Oops...',
	    //                     text: "Something went wrong!",
	    //                     type: "error",
	    //                     timer: '1500'
	    //                 })
	    //              }
	    //         });
	    //         return false;
	    //         }
	    //     });
	    // });

    </script>
@endsection
