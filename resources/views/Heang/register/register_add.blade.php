@extends('layout')

@section('header')
    <style>
        .app-layout-drawer-scroll{
            display: none;
            visibility: hidden;
        }
        .layout-has-drawer .app-layout-drawer{
            display: none;
            visibility: hidden;
        }
        .app-layout-header{
            display: none;
            visibility: hidden;
        }
    </style>
@endsection
@section('content')
    <meta name="_token" content="{{ csrf_token() }}"/>
    <link href="https://fonts.googleapis.com/css2?family=Battambang&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Battambang', cursive;
            font-size: 14px;
            color: black;
        }
        input::-webkit-input-placeholder {
            font-size: 12px;
            line-height: 3;
        }

        .col-lg-3 {
            margin-bottom: 18px;
        }

        .col-lg-4 {
            margin-bottom: 18px;
        }
        label {
            color: black;
        }
        .card > .nav-tabs > li.active > a, .card > .nav-tabs > li.active > a:hover, .card > .nav-tabs > li.active > a:focus {
            background-color: #fff;
            box-shadow: inset 0 2px #5bc0de;
        }
        .bg-dark {
            background-color: #f9f9f9;
        }
        .form-control-sm {
            height: calc(1.5em + .5rem + 2px);
            padding: .25rem .5rem;
            font-size: .875rem;
            line-height: 1.5;
            border-radius: .2rem;
        }
        .demo {
  /*padding: 30px;
*/  min-height: 280px;
}
.tab-content {
  padding: 10px;
}
@media (max-width: 767px) {
  .nav-tabs.nav-tabs-dropdown,
  .nav-tabs-dropdown {
    border: 1px solid #dddddd;
    border-radius: 5px;
    overflow: hidden;
    position: relative;
  }
  .nav-tabs.nav-tabs-dropdown::after,
  .nav-tabs-dropdown::after {
    content: "☰";
    position: absolute;
    top: 8px;
    right: 15px;
    z-index: 2;
    pointer-events: none;
  }
  .nav-tabs.nav-tabs-dropdown.open a,
  .nav-tabs-dropdown.open a {
    position: relative;
    display: block;
  }
  .nav-tabs.nav-tabs-dropdown.open > li.active > a,
  .nav-tabs-dropdown.open > li.active > a {
    background-color: #eeeeee;
  }
  .nav-tabs.nav-tabs-dropdown li,
  .nav-tabs-dropdown li {
    display: block;
    padding: 0;
    vertical-align: bottom;
  }
  .nav-tabs.nav-tabs-dropdown > li > a,
  .nav-tabs-dropdown > li > a {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    width: 100%;
    height: 100%;
    display: inline-block;
    border-color: transparent;
  }
  .nav-tabs.nav-tabs-dropdown > li > a:focus,
  .nav-tabs-dropdown > li > a:focus,
  .nav-tabs.nav-tabs-dropdown > li > a:hover,
  .nav-tabs-dropdown > li > a:hover,
  .nav-tabs.nav-tabs-dropdown > li > a:active,
  .nav-tabs-dropdown > li > a:active {
    border-color: transparent;
  }
  .nav-tabs.nav-tabs-dropdown > li.active > a,
  .nav-tabs-dropdown > li.active > a {
    display: block;
    border-color: transparent;
    position: relative;
    z-index: 1;
    background: #fff;
  }
  .nav-tabs.nav-tabs-dropdown > li.active > a:focus,
  .nav-tabs-dropdown > li.active > a:focus,
  .nav-tabs.nav-tabs-dropdown > li.active > a:hover,
  .nav-tabs-dropdown > li.active > a:hover,
  .nav-tabs.nav-tabs-dropdown > li.active > a:active,
  .nav-tabs-dropdown > li.active > a:active {
    border-color: transparent;
  }
}

.fa {
    font-size: 20px;
}

.layout-has-drawer .app-layout-header, .layout-has-drawer .app-layout-content, .layout-has-drawer .app-layout-footer {
    padding-left: 0;
}
        .Neon {
    font-family: sans-serif;
    font-size: 14px;
    color: #494949;
    position: relative;


}
.Neon * {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.Neon-input-dragDrop {
    display: block;
    padding: 25px;
    color: #8d9499;
    color: #97A1A8;
    background: #fff;
    border: 2px dashed #C8CBCE;
    text-align: center;
    -webkit-transition: box-shadow 0.3s, border-color 0.3s;
    -moz-transition: box-shadow 0.3s, border-color 0.3s;
    transition: box-shadow 0.3s, border-color 0.3s;
}
.Neon-input-dragDrop .Neon-input-icon {
    font-size: 48px;
    margin-top: -10px;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
.Neon-input-text h3 {
    margin: 0;
    font-size: 18px;
}
.Neon-input-text span {
    font-size: 12px;
}
.Neon-input-choose-btn.blue {
    color: #008BFF;
    border: 1px solid #008BFF;
}
.Neon-input-choose-btn {
    display: inline-block;
    padding: 8px 14px;
    outline: none;
    cursor: pointer;
    text-decoration: none;
    text-align: center;
    white-space: nowrap;
    font-size: 12px;
    font-weight: bold;
    color: #8d9496;
    border-radius: 3px;
    border: 1px solid #c6c6c6;
    vertical-align: middle;
    background-color: #fff;
    box-shadow: 0px 1px 5px rgba(0,0,0,0.05);
    -webkit-transition: all 0.2s;
    -moz-transition: all 0.2s;
    transition: all 0.2s;
}
.btn-app-blue-outline {
    color: #fff;
    background-color: transparent;
    border-color: #f7f7f7;
    border-radius: 5px;
}
.btn-app-blue-outline:hover {
    border-color: #f7f7f7;
    border-radius: 5px;
    color: #fff;
    background-color: transparent;
}
    </style>
    <div class="col-lg-2 col-md-2"></div>
    <div class="col-lg-8 col-md-8">
    <div class="card">
        <div class="card-header bg-blue bg-inverse" style="padding: 15px">
            <h6>Register Student</h6>
        </div>
        <div class="card-block">
            <form method="post" enctype="multipart/form-data" id="form_add" autocomplete="off">
            @csrf
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="card bg-dark">
                        <div class="card-block">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>លេខសំគាល់សិស្ស*</label>
                                        <input class="form-control form-control-sm" id="stuid" type="text" name="student_id" placeholder="Enter Student ID" />
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>ឈ្មោះខ្មែរ*</label>
                                        <input class="form-control form-control-sm" type="text"  name="kh_name" id="kh_name" placeholder="Enter Name Khmer"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>ឈ្មោះអង់គ្លេស*</label>
                                        <input class="form-control form-control-sm" type="text"  name="en_name" id="en_name" placeholder="Enter Name English">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label for="simple-classic-email">ភេទ*</label>
                                    <select name="sex" class="form-control form-control-sm" id="sex">
                                        <option value="M">ប្រុស (Male)</option>
                                        <option value="F">ស្រី (Female)</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label>ថ្ងៃខែឆ្នាំកំណើត*</label>
                                    <input class="form-control form-control-sm" pattern="[0-9]{1,2}/[0-9]{1,2}/[0-9]{3}" type="date" required name="dob" id="dob" placeholder="Please enter student's Date Of Birth...">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label>លេខទូរស័ព្ទ*</label>
                                    <input type="number" class="form-control form-control-sm"  name="stel" id="stel" placeholder="Enter Phone Number">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    {{-- <div class="card bg-dark">
                        <div class="card-block">
                            <div class="row">
                                <div class="col-lg-12">
                                        <input style="z-index: 999; opacity: 0; width: 320px; height: 200px; position: absolute; right: 0px; left: 0px; margin-right: auto; margin-left: auto;" name="photo" id="photo" multiple="multiple" type="file">
                                        <div class="Neon-input-dragDrop"><div class="Neon-input-inner">
                                            <div class="Neon-input-icon">
                                                <i class="fa fa-file-image-o"></i>
                                            </div>
                                            <div class="Neon-input-text"><h3>Drag&amp;Drop Photo here</h3>
                                                <span style="display:inline-block; margin: 15px 0">or</span>
                                            </div>
                                                <a class="Neon-input-choose-btn blue">Browse Files</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> --}}
                    </div>
                </div>
            </div>
            <div class="card bg-dark">
                <div class="card-block">
                    <div class="demo">
                        <div role="tabpanel">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs nav-justified nav-tabs-dropdown" role="tablist">
                                <li role="presentation" class="active"><a href="#info" aria-controls="info" role="tab" data-toggle="tab"><i class="fa fa-address-card" aria-hidden="true"></i> <span style="font-size: 15px; margin-left: 10px;">Info</span></a></li>
                                <li role="presentation"><a href="#school" aria-controls="school" role="tab" data-toggle="tab"><i class="fa fa-university" aria-hidden="true"></i> <span style="font-size: 15px; margin-left: 10px;">School</span></a></li>
                                <li role="presentation"><a href="#parent" aria-controls="parent" role="tab" data-toggle="tab"><i class="fa fa-users" aria-hidden="true"></i> <span style="font-size: 15px; margin-left: 10px;">Parent</span></a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="info">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>សញ្ជាតិ*</label>
                                            <select name="national" class="form-control form-control-sm" id="national">
                                                <option value="ខ្មែរ">ខ្មែរ (Khmer)</option>
                                                <option value="បរទេស">បរទេស (Foreigners)</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ភូមិកំណើត*</label>
                                            <input class="form-control form-control-sm" type="text" name="pob_v" id="pob_v" placeholder="Enter Village of Birth">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ឃុំ/សង្កាត់កំណើត*</label>
                                            <input class="form-control form-control-sm" type="text" name="pob_c" id="pob_c" placeholder="Enter Commune / Sangkat of Birth">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ស្រុកកំណើត*</label>
                                            <input class="form-control form-control-sm" type="text" name="pob_d" id="pob_d" placeholder="Enter District of Birth">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ខេត្តកំណើត*</label>
                                            <input class="form-control form-control-sm" type="text" name="pob_p" id="pob_p" placeholder="Enter Province of Birth">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ភូមិបច្ចប្បុន្ន*</label>
                                            <input class="form-control form-control-sm" type="text" name="cur_v" id="cur_v" placeholder="Enter Current village">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ឃុំ/សង្កាត់បច្ចប្បុន្ន*</label>
                                            <input class="form-control form-control-sm" type="text" name="cur_c" id="cur_c" placeholder="Enter Current Commune / Sangkat">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ស្រុកបច្ចប្បុន្ន*</label>
                                            <input class="form-control form-control-sm" type="text" name="cur_d" id="cur_d" placeholder="Enter Current District">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ខេត្តបច្ចប្បុន្ន*</label>
                                            <input class="form-control form-control-sm" type="text" name="cur_p" id="cur_p" placeholder="Enter Current Province">
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="school">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ជាសិស្សមកពីសាលា</label>
                                            <input class="form-control form-control-sm" type="text" name="old_school" id="old_school" placeholder="Enter Old Khmer School Name">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ថ្នាក់ទី</label>
                                            <input class="form-control form-control-sm" type="text" name="old_school_grade" id="old_school_grade" placeholder="Enter Old Grade">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>សាលាអង់គ្លេសចាស់</label>
                                            <input class="form-control form-control-sm" type="text" name="old_en_school" id="old_en_school" placeholder="Enter Old English School Name">
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="parent">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ឈ្មោះម្ដាយ*</label>
                                            <input class="form-control form-control-sm" type="text" name="mname" id="mname" placeholder="Enter Mother's Name">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>មុខរបរម្ដាយ*</label>
                                            <input class="form-control form-control-sm" type="text" name="jobm" id="jobm" placeholder="Enter Job Mother">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>សញ្ជាតិម្ដាយ</label>
                                            <select name="natm" class="form-control form-control-sm" id="natm">
                                                <option value="ខ្មែរ">ខ្មែរ (Khmer)</option>
                                                <option value="បរទេស">បរទេស (Foreigners)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>អាស័ដ្ឋានម្ដាយ*</label>
                                            <input class="form-control form-control-sm" type="text" name="pob_vm" id="pob_vm" placeholder="Enter Address Mother">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>ឈ្មោះឱពុក*</label>
                                            <input class="form-control form-control-sm" type="text" name="fnm" id="fnm" placeholder="Enter Father's Name">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>មុខរបរឱពុក*</label>
                                            <input class="form-control form-control-sm" type="text" name="jobf" id="jobf" placeholder="Enter Father Job">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>សញ្ជាតិឱពុក</label>
                                            <select name="natf" class="form-control form-control-sm" id="natf">
                                                <option value="ខ្មែរ">ខ្មែរ (Khmer)</option>
                                                <option value="បរទេស">បរទេស (Foreigners)</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <label>លេខទូរស័ព្ទ*</label>
                                            <input class="form-control form-control-sm" type="number" name="telf" id="telf" placeholder="Enter Phone Number">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <input type="hidden" value="{{ \Illuminate\Support\Facades\Auth::user()->camp_id }} " id="campus_id" name="campus_id"/>
                                            <label>អាស័ដ្ឋានឱពុក*</label>
                                            <input type="text" class="form-control form-control-sm" name="pob_vf" id="pob_vf" placeholder="Enter Address Father">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card bg-blue bg-inverse">
                <div class="card-header" style="padding: 10px">
                    <div class="col-lg-12 text-right">
                        <button class="wizard-finish btn btn-app-blue btn-sm" type="submit" id="submit"><i class="ion-checkmark m-r-xs"></i>
                            Submit
                        </button>
                        <a href="{{ route('register.index') }}" class="wizard-finish btn btn-app-blue btn-sm"><i class="ion-arrow-left-a m-r-xs"></i>
                            Back To View
                        </a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="col-lg-2 col-md-2"></div>
@endsection

@section('footer')
    <script type="text/javascript">
        $('.nav-tabs-dropdown').on("click", "li:not('.active') a", function(event) {
            $(this).closest('ul').removeClass("open");
        }).on("click", "li.active a", function(event) {
            $(this).closest('ul').toggleClass("open");
        });



        // when click button save
        $('#form_add').on('submit', function(e) {
            e.preventDefault()
            $.ajax({
                url:'{{ route('register.store') }}',
                type:'POST',
                data: new FormData(this),
                contentType: false,
                cache:false,
                processData: false,
                dataType:"json",
                success: function(data) {
                    swal.fire({
                        title: 'Success!',
                        text: "Data has been inserted!",
                        type: "success",
                        timer: '1500'
                    })
                },
                error: function() {
                    swal.fire({
                        title: 'Oops...',
                        text: "Something went wrong!",
                        type: "error"
                    })
                },
                complete: function() {
                    $('#form_add').each(function() {
                        this.reset();
                    })
                },
            });
        });
    </script>
@endsection
