<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use Illuminate\Support\Facades\Route;
Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
Route::post('login', 'Auth\LoginController@login');
Route::post('logout', 'Auth\LoginController@logout')->name('logout');
Route::resource('reportuppercc', 'ReportCC\ReportUpperController');
Route::post('reportuper_cc_per_month','ReportCC\ReportUpperController@reportuper_cc_per_month')->name('reportuper_cc_per_month');
Route::resource('uppersemesterone', 'ReportCC\ResultsemesterOneUpperController');
Route::post('result_report','ReportCC\ResultsemesterOneUpperController@result_report')->name('result_report');
Route::resource('uppersemestertwo', 'ReportCC\ResultsemesterTwoUpperController');
Route::post('result_report_uppersemestertwo','ReportCC\ResultsemesterTwoUpperController@result_report_uppersemestertwo')->name('result_report_uppersemestertwo');
Route::resource('reportyearupper', 'ReportCC\ResultYearUpperController');
Route::post('resultyearupper','ReportCC\ResultYearUpperController@resultyearupper')->name('resultyearupper');



Route::GET('/placement',function (){
   return view('placement.plac');
});
Route::resource('reportuppercc', 'ReportCC\ReportUpperController');
Route::get('/', function () {
    return redirect()->route('home');
});
Route::middleware(['auth'])->group(function () {
    Route::get('disabled',function (){
        return view('terminated');
    })->name('disabled');
});

Route::middleware(['auth','isactive','setlanguage'])->group(function () {

    Route::get('noperm',function (){
        return view('noperm');
    })->name('noperm');

    Route::middleware(['isadmin'])->group(function () {
        //User
        Route::resource('user', 'UserController');
        Route::post('changepw', 'UserController@changepw')->name('changepw');
        Route::post('uup', 'UserController@uup')->name('uup');
        Route::post('usrdel', 'UserController@usrdel')->name('usrdel');
        Route::get('usrrst/{id}', 'UserController@usrrst')->name('usrrst');
        Route::get('user_disabled', 'UserController@deleted')->name('usrdlt');
        Route::post('ajcuser', 'UserController@register')->name('ajcuser');
        Route::post('/import_excel/import', 'HomeController@import')->name('importexcel');

        Route::post('/excel_import', 'Heang\StudentController@import')->name('excel_import');
        Route::POST('/select_json','ScoreCCOnline\ReportOnlineController@select_json')->name('select_json');
//End User
    });
    Route::middleware(['isstaff'])->group(function () {
        //Teacher
        Route::resource('teacher','TeacherController');
        Route::post('tajup','TeacherController@ajup')->name('tajup');
        Route::get('tdl/{id}','TeacherController@delete')->name('tdl');
        Route::get('tdd','TeacherController@deleted')->name('tdd');
        Route::get('trst/{id}', 'TeacherController@restore')->name('trst');
//End Teacher
//Campus
        Route::resource('campus','CampusController');
        Route::get('cpdel/{id}','CampusController@delete')->name('cpdel');
        Route::get('cpdd','CampusController@deleted')->name('cpdd');
        Route::get('cprst/{id}','CampusController@restore')->name('cprst');
        Route::post('cajup','CampusController@ajup')->name('cajup');
//End Campus
        Route::resource('score_online','ScoreCCOnlineController');
        Route::resource('/score_online_grade_7','ScoreCCOnline\ScoreCCGrade7Controller');
        Route::get('/score_online_7/{grade}','ScoreCCOnline\ScoreCCGrade7Controller@ShowGrade')->name('ShowGrade');
        Route::POST('insert_score_7','ScoreCCOnline\ScoreCCGrade7Controller@InsertScore')->name('InsertScore7');

        Route::resource('/score_online_grade_8','ScoreCCOnline\ScoreCCGrade8Controller');
        Route::POST('insert_score_8','ScoreCCOnline\ScoreCCGrade8Controller@InsertScore')->name('InsertScore8');

        Route::resource('/score_online_grade_9','ScoreCCOnline\ScoreCCGrade9Controller');
        Route::POST('insert_score_9','ScoreCCOnline\ScoreCCGrade9Controller@InsertScore')->name('InsertScore9');

        Route::resource('/score_online_grade_10','ScoreCCOnline\ScoreCCGrade10Controller');
        Route::POST('insert_score_10','ScoreCCOnline\ScoreCCGrade10Controller@InsertScore')->name('InsertScore10');

        Route::resource('/score_online_grade_11','ScoreCCOnline\ScoreCCGrade11Controller');
        Route::POST('insert_score_11','ScoreCCOnline\ScoreCCGrade11Controller@InsertScore')->name('InsertScore11');

        Route::resource('/score_online_grade_12','ScoreCCOnline\ScoreCCGrade12Controller');
        Route::POST('insert_score_12','ScoreCCOnline\ScoreCCGrade12Controller@InsertScore')->name('InsertScore12');

        Route::resource('/report_online','ScoreCCOnline\ReportOnlineController');
        Route::POST('report_onlines','ScoreCCOnline\ReportOnlineController@InsertScore')->name('report_online');
//Classroom
        Route::resource('classroom','ClassroomController');
        Route::post('cldel/{id}','ClassroomController@delete')->name('cldel');
        Route::post('clrst/{id}','ClassroomController@restore')->name('clrst');
        Route::post('clajup','ClassroomController@ajup')->name('clajup');
//End Classroom
//Grade
        Route::resource('grade','GradeController');
        Route::get('gdel/{id}','GradeController@delete')->name('gdel');
        Route::get('grst/{id}','GradeController@restore')->name('grst');
        Route::get('gdd','GradeController@deleted')->name('gdd');
        Route::post('gajup','GradeController@ajup')->name('gajup');
//End Grade
//Academic Year
        Route::resource('academic_year','AcademicYearController');
        Route::get('aydel/{id}','AcademicYearController@delete')->name('aydel');
        Route::get('ayrst/{id}','AcademicYearController@restore')->name('ayrst');
        Route::get('aydd','AcademicYearController@deleted')->name('aydd');
        Route::post('aajup','AcademicYearController@ajup')->name('aajup');
//End Academic Year
//Class
        Route::resource('class','ClassController');
        Route::post('ccajup','ClassController@ajup')->name('ccajup');
        Route::get('cldelete/{id}', 'ClassController@delete')->name('cldelete');
        Route::get('clrestore/{id}', 'ClassController@restore')->name('clrestore');
        Route::get('cdl', 'ClassController@cdl')->name('cdl');
//End Class
//StudentClass
        Route::post('addst', 'StudentClassController@addst')->name('addst');
        Route::get('delst/{id}', 'StudentClassController@delst')->name('delst');
//End StudentClass
//TeacherClass
        Route::post('addtc', 'TeacherClassController@addtc')->name('addtc');
        Route::get('deltc/{id}', 'TeacherClassController@deltc')->name('deltc');
//End TeacherClass
        Route::middleware(['iscc'])->group(function () {
            //ReportCC
            Route::resource('reportcc','ReportCCController');
            Route::post('ajrcc','ReportCCController@ajreport')->name('ajrcc');
            //End ReportCC
        });
        Route::middleware(['isfla'])->group(function () {
            //ReportFLA
            Route::resource('reportfla','ReportFLAController');
            Route::post('ajrfla','ReportFLAController@ajreport')->name('ajrfla');
            //End ReportFLA
        });
        Route::middleware(['isac'])->group(function () {
            //ReportAC
            Route::resource('reportac','ReportACController');
            Route::post('ajrac','ReportACController@ajreport')->name('ajrac');
            //End ReportAC
        });
    });
    //Attendance
    Route::resource('attendance','AttendanceController');
    Route::post('takeatt','AttendanceController@take')->name('takeatt');
    Route::post('addatt','AttendanceController@add')->name('addatt');
    Route::get('viewatt','AttendanceController@editatt')->name('viewatt');
    Route::post('ajatt','AttendanceController@ajatt')->name('ajatt');
    Route::post('ajattp','AttendanceController@ajattp')->name('ajattp');
    Route::post('upatt','AttendanceController@upatt')->name('upatt');
    Route::post('ajcl','AttendanceController@ajcl')->name('ajcl');


//EndAttendance
    Route::middleware(['isrelation'])->group(function () {
        //Student
//        Route::resource('student','StudentController');
        Route::get('stdd', 'StudentController@deleted')->name('stdd');
//        Route::post('chksid','StudentController@chksid')->name('chksid');
//        Route::post('proup', 'StudentController@proup')->name('proup');
//        Route::get('stdl/{id}', 'StudentController@delete')->name('stdl');
//        Route::get('strst/{id}', 'StudentController@restore')->name('strst');
        //End Student
        //Violation
        Route::post('violin','ViolationController@addViolin')->name('violin');
        //End Violation

        Route::resource('payment','roeun\PaymentController');
        Route::resource('register', 'Heang\RegisterController');
        Route::get('placement_test', 'Heang\RegisterController@placementTestView');
        Route::get('select_info_by_iD/{id}', 'Heang\RegisterController@selectInfoByID');
        Route::POST('searhByDate', 'Heang\RegisterController@searhByDate')->name('searhByDate');
        Route::get('searchoverdue/{id}', 'Heang\RegisterController@searchOverdue');
        Route::GET('viewinvoice/{id_student}/{id_payment}','Heang\RegisterController@viewInvoice')->name('viewinvoice');
        Route::POST('save_prosevice','roeun\PaymentController@save_prosevice')->name('save_prosevice');
        Route::POST('save_prosevice_ac','roeun\PaymentController@save_prosevice_ac')->name('save_prosevice_ac');
        Route::GET('show_proservice/{idpaid}/{idyear}','Heang\RegisterController@show_proservice')->name('show_proservice');
        Route::GET('service_type','Heang\RegisterController@service_type')->name('service_type');
        Route::POST('save_service_type','Heang\RegisterController@save_service_type')->name('save_service_type');
        Route::POST('edit_service_type','Heang\RegisterController@edit_service_type')->name('edit_service_type');
        Route::POST('delete_service','Heang\RegisterController@delete_service')->name('delete_service');
        Route::POST('update_pro_type','Heang\RegisterController@update_pro_type')->name('update_pro_type');
        Route::POST('delete_pro_type','Heang\RegisterController@delete_pro_type')->name('delete_pro_type');
        Route::GET('show_discount','Heang\RegisterController@show_discount')->name('show_discount');
        Route::POST('add_discount','Heang\RegisterController@add_discount')->name('add_discount');
        Route::POST('edit_discount','Heang\RegisterController@edit_discount')->name('edit_discount');
        Route::POST('delete_discount','Heang\RegisterController@delete_discount')->name('delete_discount');
        Route::GET('show_acedamic_pay','Heang\RegisterController@show_acedamic_pay')->name('show_acedamic_pay');
        Route::POST('add_accdemic_pay','Heang\RegisterController@add_accdemic_pay')->name('add_accdemic_pay');
        Route::POST('edit_accdemic_pay','Heang\RegisterController@edit_accdemic_pay')->name('edit_accdemic_pay');
        Route::POST('del_accdemic_pay','Heang\RegisterController@del_accdemic_pay')->name('del_accdemic_pay');
        Route::POST('save_payment','roeun\PaymentController@save_payment')->name('save_payment');
        Route::POST('save_piad','Heang\CashCollectionReport@search_customer_not_paid')->name('search_customer_not_paid');
        Route::POST('update_save_paid','Heang\CashCollectionReport@update_save_paid')->name('update_save_paid');
        Route::GET('search_confirm_paid/{id}','Heang\CashCollectionReport@search_confirm_paid')->name('search_confirm_paid');
        // Route::get('cash_collection_report', 'Heang\CashCollectionReport@index');
        Route::get('search-report', 'Heang\CashCollectionReport@searchReport');
        Route::POST('searchByInvoice_report','Heang\CashCollectionReport@searchByInvoice_report')->name('searchByInvoice_report');
        Route::POST('searchByDue_service','Heang\CashCollectionReport@searchByDue_service')->name('searchByDue_service');
        Route::POST('searchExpiredByPeroid','Heang\CashCollectionReport@searchExpiredByPeroid')->name('searchExpiredByPeroid');
        Route::GET('countDetail','Heang\RegisterController@countAllPro')->name('countDetail');
        Route::GET('viewDeposit/{id}','Heang\RegisterController@viewDeposit')->name('viewDeposit');
        Route::POST('viewDeposit_View','Heang\CashCollectionReport@viewDeposit_View')->name('viewDeposit_View');
        Route::POST('selectTypePay','roeun\PaymentController@selectTypePay')->name('selectTypePay');
        Route::GET('list_invoice','Heang\RegisterController@list_invoice')->name('list_invoice');
        Route::POST('delete_pay','Heang\RegisterController@delete_pay')->name('delete_pay');
        Route::POST('view_cancel_paid','Heang\RegisterController@view_cancel_paid')->name('view_cancel_paid');
        Route::GET('history_cancel_paid','Heang\RegisterController@history_cancel_paid')->name('history_cancel_paid');
    });
    Route::middleware(['iscc'])->group(function () {
        //ScoreCC
        Route::resource('scorecc','ScoreccController');
        Route::post('ajscorecc','ScoreccController@ajscore')->name('ajscorecc');
        Route::post('inscorecc','ScoreccController@inscorecc')->name('inscorecc');

        //EndScoreCC
    });
    Route::middleware(['isfla'])->group(function () {
        //ScoreFLA
        Route::resource('scorefla','ScoreFLAController');
        Route::post('ajscorefla','ScoreFLAController@ajscore')->name('ajscorefla');
        Route::post('inscorefla','ScoreFLAController@inscorefla')->name('inscorefla');
        //EndScoreFLA
    });
    Route::middleware(['isac'])->group(function () {
        //ScoreAC
        Route::resource('scoreac','ScoreacController');
        Route::post('ajscoreac','ScoreacController@ajscore')->name('ajscoreac');
        Route::post('inscoreac','ScoreacController@inscoreac')->name('inscoreac');
        //EndScoreAC
    });
    //Change Pw
    Route::post('uchangepw','NUserController@changepw')->name('uchangepw');
//Change Pw
    //Switch Language
    Route::get('switchln/{ln}','LanguageController@switch')->name('switchln');
//End Switch Language


//Auth::routes();
    Route::resource('/student', 'Heang\StudentController');
    Route::get('/home', 'HomeController@index')->name('home');
    Route::resource('/scoreonline', 'Heang\ClassController');
    Route::get('getstu', 'Heang\ClassController@getStudent')->name('getstu');
    Route::resource('reportonline', 'Heang\ReportOnlineController');
    Route::get('ajrpt', 'Heang\ReportOnlineController@rptonline')->name('ajrpt');

    Route::resource('primary_score', 'Heang\PrimaryScoreController')->except('create', 'update', 'destroy', 'show', 'edit');
    Route::get('getsc', 'Heang\PrimaryScoreController@getStudnetScore')->name('getsc');
    Route::resource('report_primary_score', 'Heang\ReportPrimaryScoreController')->except('create', 'store', 'update', 'destroy', 'show', 'edit');
    Route::get('rpt_primary_score', 'Heang\ReportPrimaryScoreController@rptPrimaryScore')->name('rpt_primary_score');

    Route::resource('video', 'Heang\VideoYoutubeController');
    Route::resource('promotion', 'Heang\ApiPromotionController');
    Route::resource('feedback', 'Heang\ApiFeedbackController');

    Route::resource('getReport','TestACController');
    Route::POST('testajax_ac','TestACController@testajax_ac')->name('testajax_ac');
    //Test API Google


    // New Route for ICONIC


    Route::resource('cambodia-curriculum','roeun\ScoreKhmerController');
    Route::post('getclass','roeun\ScoreKhmerController@getclass')->name('getclass');
    Route::post('showstudent','roeun\ScoreKhmerController@showstudent')->name('showstudent');

    Route::resource('secondary-curriculum','roeun\SecondaryScoreController');
    Route::post('getclasssecondary','roeun\SecondaryScoreController@getclasssecondary')->name('getclasssecondary');
    Route::post('showstudentsecondary','roeun\SecondaryScoreController@showstudentsecondary')->name('showstudentsecondary');


    Route::resource('uppersecondary','roeun\UpperSecondaryController');
    Route::post('getclassuppercc','roeun\UpperSecondaryController@getclassuppercc')->name('getclassuppercc');
    Route::post('showstudentupper','roeun\UpperSecondaryController@showstudentupper')->name('showstudentupper');

    // End


    Route::GET('/test',function (){
       return view('home');
    });
    // Route::GET('/khmerscore',function (){
    //     return view('scoreiconic.khmer_score');
    //  });
});


