@extends('layout')
@section('header')
@endsection
<style>
    .myFont{
        font-size:12px;

    }
    .modal{
        display: block;
    }
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

    #tbl_pro_service th {
        text-transform: uppercase;
        font-size: 10px;
        font-weight: 900;
    }

    #tbl_pro_service td {
        font-size: 12px;
    }
    .table-bordered > thead > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > th, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > th, .table-bordered > tfoot > tr > td {
        border: 1px solid #eee;
        text-align: center;
    }
    /*show_data_infor_iteam*/
    .dataTables_info{
        display: none;
        visibility: hidden;
    }
    .pagination{

        padding-top: 10px;
    }
    .pagination > li {
        font-size: 12px;

    }
    .pagination > li > a, .pagination > li > span {
        padding: 8px 10px;
    }
    .pagination > .active > a, .pagination > .active > a:hover, .pagination > .active > a:focus, .pagination > .active > span, .pagination > .active > span:hover, .pagination > .active > span:focus {
        border-radius: 50% !important;
        margin-left: 2px;
        margin-right: 2px;
        background-color: #26557d;
        border-color: #26557d;
        box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);
        font-size: 9px;
    }
    .pagination > li > a:hover {
        border-radius: 50% !important;
        background-color: #f7f7f7;
    }
    .pagination > li > span:hover {
        background-color: transparent;
    }
   .cal header{

        background-color: #ecf0f3;
        width: 330px;
        height: 100px;
        border-radius: 20px;
        margin: 0 auto;
        font-size: xx-large;
        color: #000000;
        text-align: center;
    }
   .cal table{
       background-color: #FFFFFF;
       margin: 50px;
       width: 330px;
       height: 550px;
       margin: 0 auto;			/* horizontally centreing an element */
       border-radius: 20px;
       padding: 10px;
    }
    .cal td{
        width: 110px;
        height: 60px;
        text-align: center;
        font-size: xx-large;
    }
    .orange{
        color: #ff3300;
    }
    .cal td:active{
        background-color: #e0e0d1;
        border-radius: 20px;
    }
</style>
<style>@page { size: A5 }</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.3.0/paper.css">
@section('content')
    <div class="row">
        <div class="col-lg-1 col-md-1 col-sm-12">
        </div>
        <div class="col-lg-8 col-md-8 col-sm-12">
            <div class="card">
                <div class="card-header bg-blue bg-inverse" style="padding: 10px">
                    <h4 style="font-size: 13px;">INVOICE</h4>

                </div>
                <div class="card-block">
                    <div class="card-block" >
                        <div class="row">
                            {{--for hide value sub_total--}}
                            <input type="hidden" id="value_subtotal" value="0">
                            {{--for hide value discount--}}
                            <input type="hidden" id="value_discount" value="0">
                            <div class="col-lg-5  col-md-5  col-sm-5" style="background-color: #F4F5F9;">
                                <br>
                                <div class="form-horizontal"  >
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="email">Nº :</label>
                                        <div class="col-sm-7">

                                            <input type="text" id="txtinvoice" value="{{ $id_invoice }}" hidden="">
                                            <input type="email" class="form-control" id="txt_text_invoice" placeholder="Receipt ID" value="{{ $num_invoice }}">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="pwd">Date :</label>
                                        <div class="col-sm-7">
                                            <input type="date" class="form-control" id="txtdatepay" placeholder="Enter password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="pwd">Type :</label>
                                        <div class="col-sm-7">
                                           <select class="form-control class_pro" id="txtinvoice_type">
                                               <option value="1">Commercial Invoice</option>
                                           </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="pwd">Student </label>
                                        <div class="col-sm-7">
                                            <select class="form-control class_pro" id="txtstudent">
                                                @foreach($student as $row)
                                                    <option value="{{ $row->id }}">{{ $row->en_name }}</option>
                                                @endforeach
                                            </select>

                                        </div>
                                            <a class="btn btn-primary btn-sm" style="margin-left: -10px;margin-top: 2px" href="{{  route('register.create') }}" data-toggle="tooltip" data-placement="right" title="New Student"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="form-group" style="border: 2px solid white;width: 50%;float: right;margin-right: 10px;background-color: #f1f4f7">
                                        <div class="col-sm-12"  ><br>
                                                 <p style="text-align: left;font-size: 14px;font-weight: bold;color: #358ED7">Amount Due :</p>
                                                 <p style="text-align: right;font-size: 20px;font-weight: bold;color:#358ED7 " id="label_amount_due"></p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">

                                <ul class="nav nav-tabs" style="font-size: 12px">
                                    <li class="active"><a data-toggle="tab" href="#home"><i class="fa fa-cog"></i>&nbsp;INVOICE</a></li>
                                    {{--<li><a data-toggle="tab" href="#menu1" ><i class="fa fa-plus-circle"></i>&nbsp;PRODUCT SERVICE</a></li>--}}
                                    {{--<li><a data-toggle="tab" href="#menu2"><i class="fa fa-percent"></i> DISCOUNT</a></li>--}}
                                    {{--<li><a data-toggle="tab" href="#menu3"><i class="fa fa-book"></i> VALIDITY OF PAYMENT</a></li>--}}
                                </ul>

                                <div class="tab-content">
                                    <div id="home" class="tab-pane fade in active">
                                        <br>
                                        <div class="form-horizontal"  >
                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="pwd">Paid for  :</label>
                                                <div class="col-sm-4">
                                                    <select class="form-control class_pro" id="txtterm">
                                                        <option selected>Please select Paid</option>
                                                        <option value="12">Per Year</option>
                                                        <option value="6">Per Semester</option>
                                                        <option value="3">Per Term </option>
                                                        <option value="1">Per Month</option>
                                                        {{--<option value="other">Other</option>--}}
                                                    </select>
                                                </div>
                                                <label class="control-label col-sm-1" for="pwd">Year</label>
                                                <div class="col-sm-4">
                                                    <select class="form-control class_pro" id="txtacademic">
                                                        {{--<option selected> Select Academic</option>--}}
                                                        @foreach($ac as $row)
                                                            <option value="{{ $row->id }}">{{ $row->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="pwd">Validity Pay:</label>
                                                <div class="col-sm-4">
                                                    <input type="date" class="form-control" id="txtvali" >

                                                </div>
                                                <label class="control-label col-sm-1" for="pwd">To</label>
                                                <div class="col-sm-4">
                                                    <input type="date" class="form-control " id="txtexpired" >
                                                </div>
                                            </div>

                                            {{--<div class="form-group">--}}
                                                {{--<label class="control-label col-sm-3" for="pwd">Due Date :</label>--}}
                                                {{--<div class="col-sm-9">--}}
                                                    {{--<select class="form-control">--}}
                                                        {{--<option>Commercial Invoice</option>--}}
                                                    {{--</select>--}}
                                                    {{--<input type="date" class="form-control" id="txtduedate" >--}}
                                                {{--</div>--}}
                                            {{--</div>--}}

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="pwd">Payment Method :</label>
                                                <div class="col-sm-9">
                                                    <select class="form-control " id="txtpayment_method">
                                                        @forelse($pay_method as $row)
                                                            <option value="{{ $row->id }}">{{ $row->payment_method }}</option>
                                                        @empty
                                                            <option>No Data</option>
                                                        @endforelse
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="pwd">Discount :</label>
                                                <div class="col-sm-9">
                                                    <select class="form-control " id="txtdiscount">
                                                        {{-- <option value="0">0% No Discount</option>
                                                        <option value="20">20% of promotion covid19</option>
                                                        <option value="20">20% Both of DIS </option> --}}
                                                        <option>No Discount</option>
                                                        @forelse($discount as $row )
                                                            <option value="{{ $row->percent_dis }}">{{ $row->percent_dis }}%   {{  $row->discount_name }}</option>
                                                         @empty
                                                            <option value="0">0%   No Discount</option>
                                                        @endforelse
                                                    </select>
                                                </div>
                                                {{--<label class="control-label col-sm-1" for="pwd">$ :</label>--}}
                                                {{--<div class="col-sm-4">--}}
                                                    {{--<input type="text" class="form-control input-sm"  >--}}
                                                {{--</div>--}}
                                            </div>

                                        </div>
                                    </div>
                                    {{--<div id="menu1" class="tab-pane fade">--}}
                                        {{--<br>--}}
                                       {{--<div class="row">--}}
                                           {{--<div class="col-lg-12 col-sm-12 col-md-12">--}}
                                               {{--<table class="table table-bordered" id="tbl_pro_service" >--}}
                                                   {{--<thead>--}}
                                                   {{--<th style="text-align: center">Nº</th>--}}
                                                   {{--<th style="text-align: center">Description</th>--}}
                                                   {{--<th style="text-align: center">Price</th>--}}
                                                   {{--<th style="text-align: center">Action</th>--}}
                                                   {{--</thead>--}}
                                                   {{--<tbody>--}}
                                                   {{--@php $i=1; @endphp--}}
                                                   {{--@foreach($pro_service as $row)--}}
                                                       {{--<tr style="text-align: center;">--}}
                                                           {{--<td>{{ $i++ }}</td>--}}
                                                           {{--<td style="text-align: left">{{ $row->pro_service }} </td>--}}
                                                           {{--<td>{{ $row->price_service }}</td>--}}
                                                           {{--<td>--}}
                                                               {{--<button class="fa fa-plus-circle  btn_add_pro_service"></button>--}}
                                                               {{--<button class="fa fa-edit btn_edit_pro_service "></button>--}}
                                                               {{--<button class="fa fa-trash  "></button>--}}
                                                           {{--</td>--}}
                                                       {{--</tr>--}}
                                                   {{--@endforeach--}}
                                                   {{--</tbody>--}}
                                               {{--</table>--}}
                                           {{--</div>--}}
                                       {{--</div>--}}
                                    {{--</div>--}}
                                        <div id="menu2" class="tab-pane fade">

                                        </div>
                                        <div id="menu3" class="tab-pane fade">

                                        </div>

                                </div>
                            </div>
                        </div>  <br>

                        <table class="table table-bordered" id="table_payment">
                            <thead style="font-size: 12;background-color: #f2f2f2;color:black;font-weight: bold">
                                <th width="5%" style="text-align: center;font-size: 10px;">
                                    Nº
                                </th>
                                    <th width="30%" style="text-align: center;font-size: 10px;">
                                        PRODUCT/SERVICE
                                    </th>
                                <th width="30%" style="text-align: center;font-size: 10px;">
                                    DESCRIPTION
                                </th>
                                <th width="5%" style="text-align: center;font-size: 10px;">
                                  QTY
                                </th>
                                <th width="5%" style="text-align: center;font-size: 10px;">
                                   UDM
                                </th>
                                {{--<th width="15%" style="text-align: center">--}}
                                  {{--PRICE FEE--}}
                                {{--</th>--}}
                                <th width="15%" style="text-align: center;font-size: 10px;">
                                    PRICE
                                </th>
                                <th width="10%" style="text-align: center;font-size: 10px;">
                                   AMOUNT
                                </th>
                                <th  style="text-align: cente;font-size: 10px;r" hidden>
                                    Discount
                                </th>
                                <th  style="text-align: center;font-size: 10px;" hidden>
                                    Proservice_ID
                                </th>
                            </thead>
                            <tbody >

                            </tbody>
                        </table>
                        <button class="btn btn-default btn-sm" style="margin-top: -10px;font-size: 12px" id="btn_add_new"><i class="fa fa-plus"></i>  New Item</button>

                        <div class="row">
                            <br>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                {{--<button class="btn btn-app-blue btn-sm">Add New Item</button>--}}
                                <label for="">Note :</label>
                                <textarea style="margin-top: 10px" rows="2" cols="50" placeholder="Note....." class="form-control" id="txtremark"></textarea>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">

                            </div>

                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="form-horizontal"  >
                                    <div class="form-group" style="background-color: #F4F5F9;font-size: 14px">
                                        <label class="control-label col-sm-4" for="email" >SubTotal :</label>
                                        <div class="col-sm-7">
                                            <label class="control-label" id="label_subtotal" >0.00$</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-horizontal"  >
                                    <div class="form-group"  style="font-size: 14px">
                                        <label class="control-label col-sm-4" for="email">Discount :</label>
                                        <div class="col-sm-7">
                                            <label  class="control-label" id="label_discount">0.00$</label>
                                        </div>
                                    </div>
                                </div>
                                {{--<div class="form-horizontal"  >--}}
                                    {{--<div class="form-group" style="background-color: #F4F5F9;font-size: 14px">--}}
                                        {{--<label class="control-label col-sm-4" for="email">Tax :</label>--}}
                                        {{--<div class="col-sm-7">--}}
                                            {{--<label  class="control-label" >0.00</label>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</div>--}}
                                <div class="form-horizontal"  >
                                    <div class="form-group" style="background-color: #F4F5F9;">
                                        <label class="control-label col-sm-4" for="email" style="font-weight: bold">Total :</label>
                                        <div class="col-sm-7">
                                            <label  class="control-label" style="font-weight: bold" id="label_total">0.00</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-horizontal"  >
                                    <div class="form-group" style="font-size: 14px">
                                        <label class="control-label col-sm-4" for="email" >DEPOSIT :</label>
                                        <div class="col-sm-7" style="font-size: 14px">
                                            <input type="number" class="form-control" id="txtdeposit" placeholder="0.00$">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bg-inverse bg-blue">
                        <div style="padding: 10px;text-align: right" >
                            <button class="btn btn-app-blue btn-sm" style="border: white 1px solid" id="btn_payment">PAYMENT NOW </button>
                            {{--<button class="btn btn-app-blue btn-sm" style="border: white 1px solid" id="btn_print_invoice">PRINT INVOICE </button>--}}
                            {{-- <button class="btn btn-app-blue btn-sm" style="border: white 1px solid" id="btn_reciept">PRINT RECEIPT </button> --}}
                            <button class="btn btn-app-blue btn-sm" style="border: white 1px solid" id="btn_save_payment">Save Close </button>
                            {{--<button class="btn btn-app-blue btn-sm" style="border: white 1px solid">Delete </button>--}}
                            <a href="{{ route('register.index') }}" class="btn btn-app-blue btn-sm" style="border: white 1px solid">Back To Main Menu </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-12">
            {{--<div class="cal">--}}
                {{--<header id="screen"></header>--}}
                {{--<br/>--}}
                {{--<table>--}}

                    {{--<tbody>--}}
                    {{--<tr class="orange">--}}
                        {{--<td onclick="clearScr()">AC</td>--}}
                        {{--<td onclick="sendNum('*0.01')">%</td>--}}
                        {{--<td onclick="sendNum('/')">/</td>--}}
                    {{--</tr>--}}
                    {{--<tr class="orange">--}}
                        {{--<td onclick="sendNum('+')">+</td>--}}
                        {{--<td onclick="sendNum('-')">-</td>--}}
                        {{--<td onclick="sendNum('*')">x</td>--}}
                    {{--</tr>--}}
                    {{--<tr>--}}
                        {{--<td onclick="sendNum('7')">7</td>--}}
                        {{--<td onclick="sendNum('8')">8</td>--}}
                        {{--<td onclick="sendNum('9')">9</td>--}}
                    {{--</tr>--}}
                    {{--<tr>--}}
                        {{--<td onclick="sendNum('4')">4</td>--}}
                        {{--<td onclick="sendNum('5')">5</td>--}}
                        {{--<td onclick="sendNum('6')">6</td>--}}
                    {{--</tr>--}}
                    {{--<tr>--}}
                        {{--<td onclick="sendNum('1')">1</td>--}}
                        {{--<td onclick="sendNum('2')">2</td>--}}
                        {{--<td onclick="sendNum('3')">3</td>--}}
                    {{--</tr>--}}
                    {{--<tr>--}}
                        {{--<td onclick="sendNum('.')">.</td>--}}
                        {{--<td onclick="sendNum('0')">0</td>--}}
                        {{--<td onclick="equalTo()">=</td>--}}
                    {{--</tr>--}}
                    {{--</tbody>--}}
                {{--</table>--}}
            {{--</div>--}}
        </div>
    </div>
    <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    {{--<button type="button" class="close" data-dismiss="modal">&times;</button>--}}
                    <h4 class="modal-title">FORM PAYMENT INVOICE</h4>
                </div>
                <div class="modal-body" >
                <div  id="div_pri" class="A5" >
                {{--Invoice Payment--}}
                    <section class="sheet padding-10mm">
                        <div style="margin-top: 110px">

                        </div>
                         {{--<table >--}}
                              {{--<tr>--}}
                                  {{--<td><img src="{{ asset('DIS.png') }}" style="width: 80px;height: 100px"></td>--}}
                                  {{--<td>--}}
                                      {{--<p style="margin:0px 35px 80px;font-size: 10px;font-family: Battambang">សាលាចំណេះទូទៅអន្តរជាតិឌូវី ទីតាំងរំចេក៥</p>--}}
                                  {{--</td>--}}
                              {{--</tr>--}}
                             {{--<tr>--}}
                                 {{--<td></td>--}}
                                 {{--<td>--}}
                                     {{--<p style="margin-top:-85px;font-size: 10px;margin-left: 35px;font-weight: bold">DEWEY INTERNATIONAL SCHOOL,ROMCHECK 4 CAMPUS </p>--}}
                                 {{--</td>--}}

                             {{--</tr>--}}
                             {{--<tr>--}}
                                 {{--<td></td>--}}
                                 {{--<td>--}}
                                     {{--<p style="margin-top:-75px;font-size: 10px;margin-left: 35px;font-family: Battambang">អត្តលេខសញ្ញាណកម្ម អតប (VATTIN) </p>--}}
                                 {{--</td>--}}
                             {{--</tr>--}}
                             {{--<tr>--}}
                                 {{--<td></td>--}}
                                 {{--<td>--}}
                                     {{--<p style="margin-top:-63px;font-size: 10px;margin-left: 35px;font-family: Battambang">ទូរស័ព្ទលេខ HP 053 63 73 747/095 59 99 09 (Reletion Office) </p>--}}
                                 {{--</td>--}}

                             {{--</tr>--}}
                             {{--<tr>--}}
                                 {{--<td></td>--}}
                                 {{--<td>--}}
                                     {{--<p style="margin-top:-51px;font-size: 10px;margin-left: 35px;font-family: Battambang">អាស័យដ្ឋាន Address: ផ្លូវ ២០៧ ភូមិរំចេក៤ សង្កាត់រតន:--}}
                                        {{--ក្រុងបាត់ដំបង--}}
                                     {{--</p>--}}
                                 {{--</td>--}}

                             {{--</tr>--}}
                             {{--<tr>--}}
                                 {{--<td></td>--}}
                                 {{--<td>--}}
                                     {{--<p style="margin-top:-39px;font-size: 10px;margin-left: 35px;font-family: Battambang"> ខេត្តបាត់ដំបង ខាងកើត ស្ពានសម្ដេចក្រឡាហោម សខេង</p>--}}
                                 {{--</td>--}}

                             {{--</tr>--}}
                             {{--<tr>--}}
                                 {{--<td></td>--}}
                                 {{--<td>--}}
                                     {{--<p style="margin-top:-25px;font-size: 10px;margin-left: 35px;font-family: Battambang"> ចំងាយប្រហែល៤០០ ម៉ែត្រ</p>--}}
                                 {{--</td>--}}

                             {{--</tr>--}}
                             {{--<tr>--}}
                                 {{--<td></td>--}}
                                 {{--<td>--}}
                                     {{--<p style="margin-top:-16px;font-size: 10px;margin-left: 35px;font-weight: bold">--}}
                                         {{--Romcheck 4 Village,Songkat Rathanak,BattamBang City,BattamBang Province--}}
                                     {{--</p>--}}
                                 {{--</td>--}}

                             {{--</tr>--}}

                         {{--</table>--}}
                            <div style="text-align: center;font-size: 14px;font-family: 'Khmer OS Muol Light'">
                                <p>វិក្កយបត្រ</p>
                            </div>
                          <table>
                              <tr>
                                  <td><p style="font-size: 10px;font-family: 'Khmer OS Muol Light'">ព័ត៍មានអតិថិជន CUSTOMER INFO:</p></td>
                                  <td><p style="font-size: 10px;margin-left: 130px;font-family: Battambang">លេខ NO: <span id="reciept_custom"></span></p></td>
                              </tr>
                              <tr>
                                  <td><p style="font-size: 10px;margin-top: -17px;font-family: Battambang">ឈ្មោះ Name: <span id="name_custom">Sieng Roeun</span></p></td>
                                  <td><p style="font-size: 10px;margin-left: 130px;margin-top: -17px;font-family: Battambang">កាលបរិច្ឆេទ Date : <span id="date_pay_custom"></span></p></td>
                              </tr>
                              {{--<tr>--}}
                                  {{--<td><p style="font-size: 10px;margin-top: -17px;font-family: Battambang">គំរោង Job:</p></td>--}}
                                  {{--<td><p style="font-size: 10px;margin-left: 130px;margin-top: -17px;font-family: Battambang">ថ្ងៃផុតកំណត់  </p></td>--}}
                              {{--</tr>--}}
                              {{--<tr>--}}
                                  {{--<td><p style="font-size: 10px;margin-top: -17px;font-family: Battambang">អាស័យដ្ឋាន Address : BattamBang</p></td>--}}
                                  {{--<td><p style="font-size: 10px;margin-left: 130px;margin-top: -17px;font-family: Battambang">Due Date : <span id="due_date_custom"></span></p></td>--}}
                              {{--</tr>--}}

                          </table>
                        <table class="table table-bordered  " id="tbl_print_invoice" >
                            <thead style="font-size: 10px;font-family: Battambang" class="test" >
                            {{--<th width="5%" style="text-align: center">--}}
                            {{--Nº--}}
                            {{--</th>--}}
                            <th width="70%" style="text-align: center;font-size: 10px">
                                មុខទំនិញ
                            </th>
                            <th width="10%" style="text-align: center;font-size: 10px">
                                បរិមាណ
                            </th>
                            <th width="15%" style="text-align: center;font-size: 10px">
                                ថ្លៃឯកតា
                            </th>
                            <th width="15%" style="text-align: center;font-size: 10px">
                                ថ្លៃទំនញ
                            </th>

                            </thead>
                            <tbody >

                            </tbody>
                            <tfoot>
                                <tr style="font-size: 10px;text-align: center">
                                    <td colspan="3" style="text-align: right;padding: 2px;font-family: Battambang">សរុបរង:Subtotal</td>
                                    <td style="padding: 2px" id="print_sub">0.00</td>
                                </tr>
                                <tr style="font-size: 10px;text-align: center">
                                    <td colspan="3" style="text-align: right;padding: 2px;font-family: Battambang">បញ្ចុះតម្លៃ:Discount</td>
                                    <td style="padding: 2px" id="print_dis">0.00</td>
                                </tr>
                                {{--<tr style="font-family: 'Kh Battambang;';font-size: 10px;text-align: center">--}}
                                    {{--<td colspan="3" style="text-align: right;padding: 2px">សរុប(បូកបញ្ចូលពន្ធអាករ)Total VAT(Include)</td>--}}
                                    {{--<td style="padding: 2px" id="print_vat">0.00</td>--}}
                                {{--</tr>--}}
                                <tr style="font-size: 10px;text-align: center">
                                    <td colspan="3" style="text-align: right;padding: 2px;font-family: Battambang">ប្រាក់កក់(Deposit)</td>
                                    <td style="padding: 2px" id="label_deposit">0.00</td>
                                </tr>
                                <tr style="font-size: 10px;text-align: center">
                                    <td colspan="3" style="text-align: right;padding: 2px;font-family: Battambang">សាច់ប្រាក់ទូទាត់ Amount Due</td>
                                    <td style="padding: 2px" id="print_amount"></td>
                                </tr>
                            </tfoot>
                        </table>

                        <table>
                            <tr>
                                <br>
                                <td><p style="font-size: 10px;font-weight: bold">____________________________</p></td>
                                <td><p style="font-size: 10px;margin-left: 130px;font-weight: bold">____________________________</p></td>

                            </tr>
                            <tr>
                                <br>
                                <td><p style="font-size: 10px;margin-top: -10px;font-weight: bold;font-family: Battambang">ហត្ថលេខា និង ឈ្មោះអ្នកទិញ</p></td>
                                <td><p style="font-size: 10px;margin-left: 130px;margin-top: -10px;font-weight: bold;font-family: Battambang">ហត្ថលេខា និង ឈ្មោះអ្នកទិញ</p></td>
                            </tr>
                            <tr>
                                <td><p style="font-size: 10px;margin-top: -15px;font-weight: bold">Customer's Signature & Name</p></td>
                                <td><p style="font-size: 10px;margin-left: 130px;margin-top: -15px;font-weight: bold">Seller Signature & Name  </p></td>
                            </tr>
                            <tr>
                                <td><p style="font-size: 10px;margin-top: 50px;font-weight: bold;font-family: Battambang">
                                        សំគាល់ :ប្រាក់បង់រួចមិនអាចដកវិញបានទេ <br>
                                        Note :Not Refundeble</p></td>
                            </tr>

                        </table>
                    </section>

                {{--End Invoice Payment    --}}
                </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-app-blue btn-sm" id="printer"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;PRINT </button>
                    <button type="button" class="btn btn-app-blue btn-sm" id="btn_payment_last"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;PAYMENT & PRINT </button>
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"  id="btn_close">CLOSE</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="modal_receipt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">FORM PAYMENT INVOICE</h4>
                </div>
                <div class="modal-body" >
                    <div  id="div_receipt" class="A5 ">

                        <section class="sheet padding-10mm">
                            <table>
                                <tr>
                                    <td><img src="{{ asset('DIS.png') }}" style="width: 80px;height: 100px"></td>
                                    <td>
                                        <p style="margin:0px 35px 80px;font-size: 10px">សាលាចំណេះទូទៅអន្តរជាតិឌូវី ទីតាំងរំចេក៥</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-85px;font-size: 10px;margin-left: 35px;font-weight: bold">DEWEY INTERNATIONAL SCHOOL,ROMCHECK 4 CAMPUS </p>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-75px;font-size: 10px;margin-left: 35px;">អត្តលេខសញ្ញាណកម្ម អតប (VATTIN) </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-63px;font-size: 10px;margin-left: 35px;">ទូរស័ព្ទលេខ HP 053 63 73 747/095 59 99 09 (Reletion Office) </p>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-51px;font-size: 10px;margin-left: 35px;">អាស័យដ្ឋាន Address: ផ្លូវ ២០៧ ភូមិរំចេក៤ សង្កាត់រតន:
                                            ក្រុងបាត់ដំបង
                                        </p>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-39px;font-size: 10px;margin-left: 35px;"> ខេត្តបាត់ដំបង ខាងកើត ស្ពានសម្ដេចក្រឡាហោម សខេង</p>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-25px;font-size: 10px;margin-left: 35px;"> ចំងាយប្រហែល៤០០ ម៉ែត្រ</p>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-16px;font-size: 10px;margin-left: 35px;font-weight: bold">
                                            Romcheck 4 Village,Songkat Rathanak,BattamBang City,BattamBang Province
                                        </p>
                                    </td>

                                </tr>

                            </table>
                             <table>
                                  <tr>
                                      <td> <div style="font-size: 14px;font-family: 'Khmer OS Muol Light';margin-left: 70px;margin-top: -50px">
                                              <p>ប័ណ្ណទទួលប្រាក់</p>
                                          </div>
                                          <p style="font-size: 12px;margin-left: 85px;font-weight: bold;margin-top: -13px">Receipt Voucher</p></td>
                                       <td>
                                          <table class="table table-bordered" style="margin-left: 70px;margin-top: 5px;">
                                              <tr style="font-size: 10px">
                                                 <td style="text-align: center">កាលបរិច្ឋេទ Date</td>
                                                 <td style="text-align: center">09-10-2020</td>
                                              </tr>
                                              <tbody>
                                                  <tr style="font-size: 10px; text-align: center">
                                                      <td>លេខបង្កាន់ដៃ</td>
                                                      <td>5236</td>
                                                  </tr>
                                              </tbody>
                                          </table>
                                       </td>
                                  </tr>

                             </table>
                            <table>
                                <tr>
                                    <td style="width: 320px">
                                        <table style=" border: 1px solid black;">
                                            <tr style="font-size: 10px; border: 1px solid black;">
                                                <td style="border: 1px solid black;" >
                                                    &nbsp;ទទួលពីឈ្មោះ <br>
                                                    &nbsp;Recieve From
                                                </td>
                                                <td style="vertical-align: center;border: 1px solid black;">&nbsp;Sieng Roeun</td>
                                            </tr>
                                            <tbody>
                                            <tr style="font-size: 10px; border: 1px solid black;">
                                                <td style="vertical-align: center;border: 1px solid black;">&nbsp;អាស័យដ្ឋាន <br>&nbsp;Contact Address</td>
                                                <td style="vertical-align: center;border: 1px solid black;">&nbsp;5236</td>
                                            </tr>
                                            <tr style="font-size: 10px;border: 1px solid black; ">
                                                <td  style="vertical-align: center;border: 1px solid black;">&nbsp;គោលបំណង់</td>
                                                <td style="text-align: justify;text-justify: inter-word;border: 1px solid black;">
                                                    &nbsp;DIS CC-Tuition fee hight school Grade 7 ::School Year2019-2020,Paid for 1 Y (2020-10-19-2021-10-19),Discount-0% No Discount
                                                    DIS CC-Tuition fee hight school Grade 7 ::School Year2019-2020,Paid for 1 Y (2020-10-19-2021-10-19),Discount-0
                                                </td>
                                            </tr>

                                            <tr style="font-size: 10px;border: 0.5px solid black; ">
                                                <td style="width: 120px;border: 0.5px solid black;">&nbsp;លេខយោង <br> &nbsp;Reference Document</td>
                                                <td>&nbsp;CIN688568451</td>
                                            </tr>

                                            </tbody>
                                        </table>
                                        <p style="font-size: 10px">On behalf of សាលាចំណេះទូទៅអន្តរជាតិ ឌូវីទីតាំងរំចេក៤</p>
                                    </td>
                                    <td style="font-size: 10px;">
                                       <p style="margin-top: -90px;margin-left: 10px;font-weight: bold">
                                           ចំនួនប្រាក់សរុប : 143.50$<br>
                                           TOTAL RECEIVED AMOUNT <br>
                                           វិធីសាស្រ្តទូទាត់ំ Mode of Payment Cash
                                       </p>

                                    </td>
                                </tr>
                                <tr>
                                    <td><p style="font-size: 10px">Received By</p></td>
                                    <td><p style="font-size: 10px">Paid By</p></td>
                                </tr>
                                <tr>
                                    <td><p style="margin-top: 45px">________________________</p></td>
                                    <td><p style="margin-top: 45px">________________________</p></td>
                                </tr>
                                <tr>
                                    <td><p style="font-size: 10px;margin-top: -15px;font-weight: bold">Name</p></td>
                                    <td><p style="font-size: 10px;margin-top: -15px;font-weight: bold">Name</p></td>
                                </tr>
                                <tr>
                                    <td><p style="font-size: 10px;margin-top: -15px;font-weight: bold">
                                            សំគាល់ :ប្រាក់បង់រួចមិនអាចដកវិញបានទេ <br>
                                            Note :Not Refundeble
                                        </p></td>

                                </tr>
                            </table>
                        </section>

                    </div>

                </div>

                <div class="modal-footer">
                    {{--<button type="button" class="btn btn-app-blue btn-sm" id="printer">Print</button>--}}
                    {{--<button type="button" class="btn btn-app-blue btn-sm" id="btn_payment_last">Print & Payment</button>--}}
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal" >Close</button>
                </div>
            </div>
        </div>

    </div>
    <div class="modal " id="modal_service" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">

                    <h6 class="modal-title">PRODUCT SERVICE</h6>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal"  >
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="pwd">Service Name:</label>
                            <div class="col-sm-8">
                                <textarea name="" id="txtservice_name" cols="43" rows="5" style="font-size: 14px" ></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="pwd">Price Service ($)  :</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="txtprice_service">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-sm" id="btn_save_service" >Save</button>
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
@section('footer')
<script>
    var count=0;
    var num=1;
    var count_btn=0;
    if(count_btn==0)
    {
        $('#btn_payment').prop('disabled', true)
    }
    $('.class_pro').select2({
        theme: "classic",
        dropdownCssClass: "myFont",
        tags: true
    })
    $('#txtdiscount').select2({
        theme: "classic",
        dropdownCssClass: "myFont",
        tags: true
    })
    $('#tbl_pro_service').DataTable({
        "pageLength": 4,
        "lengthMenu": [[4, 10, 25, 50, 100, -1], [4, 10, 25, 50, 100, "All"]],
    })
    // format currency number to dollar
    // end
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        if (date=="")
        {
            return "";
        }
        else{
        return [year, month, day].join('-');
       }
    }
    //[days, years, months, seconds, ...]
    $(document).ready(function () {
        //for calutator date date pay until due day (7day)
        var date_now =  Date()
        var due_date=$('#txtduedate').val()
        var date_pay=$('#txtdatepay').val(formatDate(date_now))
        var result=moment(date_pay).add(7, 'days').calendar();
        $('#txtduedate').val(formatDate(result))
        $('#txtdatepay').val(formatDate(date_now))
    })
    var numUSD = new Intl.NumberFormat('en-US', {
        style:'currency',
        currency: 'USD'
    })
    $("#txtvali").on('change',function () {
        var startdate   = $(this).val()
        var selecterm=$('#txtterm').val()
        var start=moment(startdate).add(selecterm, 'month').calendar();
        var test;
        d=formatDate(start)
        $('#txtexpired').val(d)
    })
    var appen_select=''
    $("#txtterm").on('change',function () {
        var startdate   = $('#txtvali').val()
        var selecterm=$('#txtterm').val()
        var id_acedemic=$('#txtacademic').val()
        if ( selecterm=="other")
        {
            $('#txtvali').val('')
            $('#txtexpired').val('')
        }else{
            test =moment(startdate).add(selecterm, 'month').calendar();
            d=formatDate(test)
            $('#txtexpired').val(d)
        }
        $.ajax({
            'url':'{{ route('selectTypePay') }}',
            'type':'POST',
            'data':{'_token':'{{ @csrf_token() }}','txtterm':$(this).val(),'id_acedemic':id_acedemic},
            success:function (data) {
                var iteam=''
                $.each(JSON.parse(data),function(index,value) {
                    iteam+=('<option value="' + value.price_service + ','+value.id+'">'+value.pro_service+'</option>');
                });
                appen_select=iteam
            }
        })

    })
    $('#txtacademic').on('change',function () {
        var id_acedemic=$('#txtacademic').val()
        $.ajax({
            'url':'{{ route('selectTypePay') }}',
            'type':'POST',
            'data':{'_token':'{{ @csrf_token() }}','txtterm':$('#txtterm').val(),'id_acedemic':id_acedemic},
            success:function (data) {
                var iteam=''
                $.each(JSON.parse(data),function(index,value) {
                    iteam+=('<option value="' + value.price_service + ','+value.id+'">'+value.pro_service+'</option>');
                });
                appen_select=iteam
            }
        })
    })
    {{--foreach($service as $row)  <option value='{{ $row->price_service }},{{ $row->id }}'> {{ $row->pro_service }} </option>  @endforeach--}}
        {{--}--}}
    $('#btn_add_new').on('click',function () {
          if(appen_select=='')
          {
              Swal.fire({
                  'text':"No product service for pay",
                  'type':'warning'
              })

          }else {
              console.log(appen_select)
              $('#btn_payment').prop('disabled', false)
              if ($('#txtterm').val() == 'other') {
                  var check_vali = $('#txtvali').val()
                  var check_expired_date = $('#txtexpired').val()
                  count = count + 1;
                  var acedemic = $('#txtacademic').val()
                  var term = $('#txtterm').val()
                  var html_code = "<tr style='text-align: center;font-size: 12px;padding: 2px' id='row" + count + "' >";
                  html_code += "<td style='vertical-align: middle;padding: 2px' ><button  class=\"btn btn-danger btn-sm remove \" style='padding: 2px'   data-row=" + count + "><i class='fa fa-trash'></i></button ></td>";
                  html_code += "<td style='vertical-align: middle'><select class='form-control class_pro select_detail'   data-row=" + count + " id='test' > <option selected  disabled>Select Service</option></select></td>";
                  html_code += "<td contenteditable='true'  style=\"text-align: left;vertical-align: middle;padding: 2px\" class='txtdescription' data-row=" + count + " id='select" + count + "'>" + " " + "</td>";
                  html_code += "<td style=\"vertical-align: middle;padding: 2px\" id='qty" + count + "' class='qty'></td>";
                  html_code += "<td   style=\"vertical-align: middle;padding: 2px\" id='udm" + count + "' class='udm'  data-row=" + count + "></td>";
                  // html_code += "<td contenteditable='true'  style=\"vertical-align: middle;padding: 2px\" class='price' id='pri_service"+count+"'  data-row="+count+" onkeypress='return event.charCode >= 8 && event.charCode <= 57'></td>";
                  html_code += "<td  contenteditable='true'  style=\"vertical-align: middle;padding: 2px\"  class='price' id='price" + count + "' data-row=" + count + "></td>";
                  html_code += "<td   style=\"vertical-align: middle;padding: 2px\" class='ammount' id='ammount" + count + "'>0</td>";
                  html_code += "<td   style=\"vertical-align: middle;padding: 2px\" class='discount' id='discount" + count + "' hidden>0</td>";
                  html_code += "<td   style=\"vertical-align: middle;padding: 2px\" class='pro_service_id' id='pro_service_id" + count + "' hidden ></td>";
                  html_code += "<td   style=\"vertical-align: middle;padding: 2px\" hidden><input type='text' class='vali_date' value='" + check_vali + "' /> </td>";
                  html_code += "<td   style=\"vertical-align: middle;padding: 2px\" hidden ><input type='text'  class='expired_date' value='" + check_expired_date + "' /> </td>";
                  html_code += "<td   style=\"vertical-align: middle;padding: 2px\" hidden><input type='text'  class='academic' value='" + acedemic + "' /> </td>";
                  html_code += "<td   style=\"vertical-align: middle;padding: 2px\" hidden><input type='text'  class='termpay' value='" + term + "' /> </td>";
                  html_code += "<td   style=\"vertical-align: middle;padding: 2px\" class='original_price' id='original_price" + count + "' hidden></td>";
                  html_code += "</tr>";
                  $('#table_payment').append(html_code)
                  $('.class_pro').select2({
                      theme: "classic",
                      dropdownCssClass: "myFont"
                  })
              } else {
                  if ($('#txtvali').val() == '') {
                      Swal.fire({
                          'type': 'warning',
                          'text': "Please input Validity Pay"
                      })
                  } else {

                              {{--@foreach($service as $row)  <option value='{{ $row->price_service }},{{ $row->id }}'> {{ $row->pro_service }} </option>  @endforeach--}}

                      var check_vali = $('#txtvali').val()
                      var check_expired_date = $('#txtexpired').val()
                      count = count + 1;
                      var acedemic = $('#txtacademic').val()
                      var term = $('#txtterm').val()
                      var html_code = "<tr style='text-align: center;font-size: 12px;padding: 2px' id='row" + count + "' >";
                      html_code += "<td style='vertical-align: middle;padding: 2px' ><button  class=\"btn btn-danger btn-sm remove \" style='padding: 2px'   data-row=" + count + "><i class='fa fa-trash'></i></button ></td>";
                      html_code += "<td style='vertical-align: middle'><select class='form-control class_pro select_detail'   data-row=" + count + " id='test'> <option selected  disabled>Select Service</option>" + appen_select + " </select></td>";
                      html_code += "<td contenteditable='true'  style=\"text-align: left;vertical-align: middle;padding: 2px\" class='txtdescription' data-row=" + count + " id='select" + count + "'>" + " " + "</td>";
                      html_code += "<td style=\"vertical-align: middle;padding: 2px\" id='qty" + count + "'   class='qty'></td>";
                      html_code += "<td   style=\"vertical-align: middle;padding: 2px\" id='udm" + count + "' class='udm'  data-row=" + count + "></td>";
                      // html_code += "<td contenteditable='true'  style=\"vertical-align: middle;padding: 2px\" class='price' id='pri_service"+count+"'  data-row="+count+" onkeypress='return event.charCode >= 8 && event.charCode <= 57'></td>";
                      html_code += "<td  contenteditable='true'   style=\"vertical-align: middle;padding: 2px\"  class='price' id='price" + count + "' data-row=" + count + "></td>";
                      html_code += "<td   style=\"vertical-align: middle;padding: 2px\" class='ammount' id='ammount" + count + "'>0</td>";
                      html_code += "<td   style=\"vertical-align: middle;padding: 2px\" class='discount' id='discount" + count + "' hidden >0</td>";
                      html_code += "<td   style=\"vertical-align: middle;padding: 2px\" class='pro_service_id' id='pro_service_id" + count + "' hidden ></td>";
                      html_code += "<td   style=\"vertical-align: middle;padding: 2px\" hidden><input type='text' class='vali_date' value='" + check_vali + "' /> </td>";
                      html_code += "<td   style=\"vertical-align: middle;padding: 2px\" hidden><input type='text'  class='expired_date' value='" + check_expired_date + "' /> </td>";
                      html_code += "<td   style=\"vertical-align: middle;padding: 2px\" hidden><input type='text'  class='academic' value='" + acedemic + "' /> </td>";
                      html_code += "<td   style=\"vertical-align: middle;padding: 2px\" hidden><input type='text'  class='termpay' value='" + term + "' /> </td>";
                      html_code += "<td   style=\"vertical-align: middle;padding: 2px\" class='original_price' id='original_price" + count + "' hidden></td>";
                      html_code += "</tr>";
                      $('#table_payment').append(html_code)
                      $('.class_pro').select2({
                          theme: "classic",
                          dropdownCssClass: "myFont"
                      })
                  }
              }
          }
    })
    $('#table_payment').on('change', '.select_detail', function(){

        if($('#txtterm').val()=="other")
        {
                var delete_row = $(this).data("row");
                var selectProSeriveText = $(this).children("option:selected").text();
                var selectPrsoerviceID=$(this).val().split(',')[1]
                var selectProSerivevalue = $(this).children("option:selected").val().split(',')[0];
                var payterm = $('#txtterm').children("option:selected").text();
                var selectdiscountText=$('#txtdiscount').children("option:selected").text()
                var searchTextDisIndes=searchDiscountinDes(","+selectdiscountText+"");
                //Calculate Payment
                var payterm_val=$('#txtterm').val()
                var qty=1
                var total_pay=parseFloat(selectProSerivevalue)
                var total_last=parseFloat(total_pay)*payterm_val;
                var ammount=qty*total_last
                var total_dis=parseFloat(ammount)*parseFloat(searchTextDisIndes)/100;//for find disccount
                ///end
                var year_school=$('#txtacademic').children("option:selected").text();
                var startdate=$('#txtvali').val()
                var expireddate=$('#txtexpired').val()
                var format_unit_price=parseFloat(selectProSerivevalue)
                $('#select'+delete_row).html(selectProSeriveText)
                $('#udm'+delete_row).html(payterm)
                $('#pri_service'+delete_row).html(format_unit_price)
                $('#qty'+delete_row).html(qty)
                $('#pro_service_id'+delete_row).html(selectPrsoerviceID)
                $('#discount'+delete_row).html(total_dis)
                $('#original_price'+delete_row).html(ammount)
                var sum=0;
                var sumDiscount=0;
                $('.ammount').each(function(){
                    if($(this).text()==""){
                        $(this).text("0")
                    }
                    sum += parseFloat($(this).text());
                });
                $('.discount').each(function(){
                    if($(this).text()==""){
                        $(this).text("0")
                    }
                    sumDiscount += parseFloat($(this).text());
                });
                var subtotal=0
                $('.original_price').each(function(){
                    if($(this).text()==""){
                        $(this).text("0")
                    }
                    subtotal += parseFloat($(this).text());
                });

        }else{

                var delete_row = $(this).data("row");
                var selectProSeriveText = $(this).children("option:selected").text();
                var selectPrsoerviceID=$(this).val().split(',')[1]
                var selectProSerivevalue = $(this).children("option:selected").val().split(',')[0];
                var payterm = $('#txtterm').children("option:selected").text();
                var selectdiscountText=$('#txtdiscount').children("option:selected").text()
                var searchTextDisIndes=searchDiscountinDes("::,"+selectdiscountText+"");
                // calculat payment with payterm
                var payterm_val=$('#txtterm').val()
                // selectpricevale * (1-searchTextDisIndes)
                var qty=1
                var total_pay=parseFloat(selectProSerivevalue)
                var total_last=total_pay;
                var ammount=qty*total_last
                var total_dis=parseFloat(ammount)*parseFloat(searchTextDisIndes)/100;//for find disccount
                ///end
                var year_school=$('#txtacademic').children("option:selected").text();
                var startdate=$('#txtvali').val()
                var expireddate=$('#txtexpired').val()
                var format_unit_price=parseFloat(selectProSerivevalue)
                $('#select'+delete_row).html(selectProSeriveText+"::School Year"+year_school+"::Paid for "+payterm+" ("+formatDate(startdate)+"-"+formatDate(expireddate)+"),"+selectdiscountText+"")
                $('#udm'+delete_row).html(payterm)
                $('#pri_service'+delete_row).html(format_unit_price)
                $('#qty'+delete_row).html(qty)
                $('#pro_service_id'+delete_row).html(selectPrsoerviceID)
                $('#discount'+delete_row).html(total_dis)
                //comment for payment with payterm
                $('#ammount'+delete_row).html(numUSD.format(parseFloat(ammount-total_dis)))
                $('#price'+delete_row).html(ammount)
                //end pay
                $('#original_price'+delete_row).html(ammount)
                var sum=0;
                var sumDiscount=0;
                $('.ammount').each(function(){
                    if($(this).text()==""){
                        $(this).text("0")
                    }
                    sum += parseFloat($(this).text());
                });
                $('.discount').each(function(){
                    if($(this).text()==""){
                        $(this).text("0")
                    }
                    sumDiscount += parseFloat($(this).text());
                });
                var subtotal=0
                $('.original_price').each(function(){
                    if($(this).text()==""){
                        $(this).text("0")
                    }
                    subtotal += parseFloat($(this).text());
                });
        }
        $('#value_discount').val(sumDiscount)
        $('#value_subtotal').val(subtotal)
        $('#label_discount').html(numUSD.format(sumDiscount))
        $("#label_subtotal").html(numUSD.format(subtotal))
        $('#label_amount_due').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
        $('#label_total').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
    });
    $('#table_payment').on('click', '.remove', function(){
        var delete_row = $(this).data("row");
        var ammount=$('#value_subtotal').val();
        var label_dis=$('#value_discount').val();
        var delammount=$('#price'+delete_row).text();
        var deldiscount=$('#discount'+delete_row).text();
        var totalammount;
        var disafterdelete;
        var total_pay=0;
        num--;
        if(delammount==""){
            delammount=0
        }
        totalammount=parseFloat(ammount)-parseFloat(delammount)
        disafterdelete=parseFloat(label_dis)-parseFloat(deldiscount);
        total_pay=parseFloat(totalammount)-parseFloat(disafterdelete)
        $('#row' + delete_row).remove();
        $('#value_subtotal').val(totalammount)
        $('#value_discount').val(disafterdelete)
        $('#label_subtotal').text(numUSD.format(totalammount))
        $('#label_discount').text(numUSD.format(disafterdelete))
        $('#label_total').html(numUSD.format(total_pay))
        $('#label_amount_due').text(numUSD.format(total_pay))
    });
    $('#table_payment').on('keyup','.price',function () {
            var num_row=$(this).data("row");
            var id_des=$('#select'+num_row).text()
            var search=searchDiscountinDes(id_des)
            var price=$('#price'+num_row).text()
            if(price==""){
                price=0
            }
            var qty=1
            var ammount=qty*parseFloat(price)
            console.log(ammount)
            var total_dis=parseFloat(ammount)*parseFloat(search)/100;//for find disccount
            $('#ammount'+num_row).html(numUSD.format(parseFloat(ammount-total_dis)))
            // $('#price'+num_row).html(ammount)
            $('#original_price'+num_row).html(ammount)
            $('#discount'+num_row).html(total_dis)
            var sum=0;
            var sumDiscount=0;
            $('.ammount').each(function(){

                if($(this).text()==""){
                    $(this).text("0")
                }
                sum += parseFloat($(this).text());
            });
            var subtotal=0
            $('.original_price').each(function(){

                if($(this).text()==""){
                    $(this).text("0")
                }
                subtotal += parseFloat($(this).text());
            });
            $('.discount').each(function(){
                if($(this).text()==""){
                    $(this).text("0")
                }
                sumDiscount += parseFloat($(this).text());
            });
            $('#value_discount').val(sumDiscount)
            $('#value_subtotal').val(subtotal)
            $('#label_discount').html(numUSD.format(sumDiscount))
            $("#label_subtotal").html(numUSD.format(subtotal))
            $('#label_amount_due').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
            $('#label_total').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
     })
    $('#table_payment').on('keyup','.txtdescription',function () {
        var num_row=$(this).data("row");
        var id_des=$('#select'+num_row).text()
        var search=searchDiscountinDes(id_des)
        var price=$('#price'+num_row).text()
        if(price==""){
            price=0
        }
        // calculat payment with payterm
        var payterm_val=$('#txtterm').val()
        // selectpricevale * (1-searchTextDisIndes)
        // var total_pay=parseFloat(price)/12;
        // var total_last=parseFloat(total_pay)*payterm_val;
        ///end
        var qty=1
        var ammount=qty*price
        var total_dis=parseFloat(ammount)*parseFloat(search)/100;//for find disccount
        $('#ammount'+num_row).html(numUSD.format(parseFloat(ammount-total_dis)))
        $('#price'+num_row).html(ammount)
        $('#original_price'+num_row).html(ammount)
        $('#discount'+num_row).html(total_dis)
        var sum=0;
        var sumDiscount=0;
        var subtotal=0
        $('.original_price').each(function(){
            subtotal += parseFloat($(this).text());
        });
        $('.ammount').each(function(){
            sum += parseFloat($(this).text());
        });
        $('.discount').each(function(){
            sumDiscount += parseFloat($(this).text());
        });
        $('#value_discount').val(sumDiscount)
        $('#value_subtotal').val(subtotal)
        $('#label_discount').html(numUSD.format(sumDiscount))
        $("#label_subtotal").html(numUSD.format(subtotal))
        $('#label_amount_due').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
        $('#label_total').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
    })
    $('#table_payment').on('focusin','.txtdescription',function () {
        var num_row=$(this).data("row");
        var id_des=$('#select'+num_row).text()
        var search=searchDiscountinDes(id_des)
        var price=$('#price'+num_row).text()
        if(price==""){
            price=0
        }
        // calculat payment with payterm
        var payterm_val=$('#txtterm').val()
        // selectpricevale * (1-searchTextDisIndes)
        // var total_pay=parseFloat(price)/12;
        // var total_last=parseFloat(total_pay)*payterm_val;
        ///end
        var qty=1
        var ammount=qty*price
        var total_dis=parseFloat(ammount)*parseFloat(search)/100;//for find disccount
        $('#ammount'+num_row).html(numUSD.format(parseFloat(ammount-total_dis)))
        $('#price'+num_row).html(ammount)
        $('#original_price'+num_row).html(ammount)
        $('#discount'+num_row).html(total_dis)
        var sum=0;
        var sumDiscount=0;
        var subtotal=0
        $('.original_price').each(function(){
            subtotal += parseFloat($(this).text());
        });
        $('.ammount').each(function(){
            sum += parseFloat($(this).text());
        });
        $('.discount').each(function(){
            sumDiscount += parseFloat($(this).text());
        });
        $('#value_discount').val(sumDiscount)
        $('#value_subtotal').val(subtotal)
        $('#label_discount').html(numUSD.format(sumDiscount))
        $("#label_subtotal").html(numUSD.format(subtotal))
        $('#label_amount_due').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
        $('#label_total').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
        console.log(ammount)
    })

    $('#table_payment').on('focusout','.txtdescription',function () {
        var num_row=$(this).data("row");
        var id_des=$('#select'+num_row).text()
        var search=searchDiscountinDes(id_des)
        var price=$('#price'+num_row).text()
        if(price==""){
            price=0
        }
        // calculat payment with payterm
        var payterm_val=$('#txtterm').val()
        // selectpricevale * (1-searchTextDisIndes)
        // var total_pay=parseFloat(price)/12;
        // var total_last=parseFloat(total_pay)*payterm_val;
        ///end
        var qty=1
        var ammount=qty*price
        var total_dis=parseFloat(ammount)*parseFloat(search)/100;//for find disccount
        $('#ammount'+num_row).html(numUSD.format(parseFloat(ammount-total_dis)))
        $('#price'+num_row).html(ammount)
        $('#original_price'+num_row).html(ammount)
        $('#discount'+num_row).html(total_dis)
        var sum=0;
        var sumDiscount=0;
        var subtotal=0
        $('.original_price').each(function(){
            subtotal += parseFloat($(this).text());
        });
        $('.ammount').each(function(){
            sum += parseFloat($(this).text());
        });
        $('.discount').each(function(){
            sumDiscount += parseFloat($(this).text());
        });
        $('#value_discount').val(sumDiscount)
        $('#value_subtotal').val(subtotal)

        $('#label_discount').html(numUSD.format(sumDiscount))
        $("#label_subtotal").html(numUSD.format(subtotal))
        $('#label_amount_due').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
        $('#label_total').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
    })
    $('#table_payment').on('focusin','.price',function () {
        // var num_row=$(this).data("row");
        // var id_des=$('#select'+num_row).text()
        // var search=searchDiscountinDes(id_des)
        // var price=$('#pri_service'+num_row).text()
        // if(price==""){
        //     price=0
        // }
        // // calculat payment with payterm
        // var payterm_val=$('#txtterm').val()
        // // selectpricevale * (1-searchTextDisIndes)
        // var total_pay=parseFloat(price)/12;
        // var total_last=parseFloat(total_pay)*payterm_val;
        // ///end
        // var qty=1
        // var ammount=qty*total_last
        // var total_dis=parseFloat(ammount)*parseFloat(search)/100;//for find disccount
        // var subtotal=0
        // $('.original_price').each(function(){
        //     if($(this).text()==""){
        //         $(this).text("0")
        //     }
        //     subtotal += parseFloat($(this).text());
        // });
        // $('#ammount'+num_row).html(parseFloat(ammount-total_dis))
        // $('#price'+num_row).html(ammount)
        // $('#original_price'+num_row).html(ammount)
        // $('#discount'+num_row).html(total_dis)
        // var sum=0;
        // var sumDiscount=0;
        // $('.ammount').each(function(){
        //     if($(this).text()==""){
        //         $(this).text("0")
        //     }
        //     sum += parseFloat($(this).text());
        // });
        // $('.discount').each(function(){
        //     sumDiscount += parseFloat($(this).text());
        // });
        // $('#value_discount').val(sumDiscount)
        // $('#value_subtotal').val(subtotal)
        //
        // $('#label_discount').html(numUSD.format(sumDiscount))
        // $("#label_subtotal").html(numUSD.format(subtotal))
        // $('#label_amount_due').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
        // $('#label_total').html(numUSD.format(parseFloat(subtotal-sumDiscount)))

    })
    $('#table_payment').on('focusout','.price',function () {
        // var num_row=$(this).data("row");
        // var id_des=$('#select'+num_row).text()
        // var search=searchDiscountinDes(id_des)
        // var price=$('#pri_service'+num_row).text()
        // // calculat payment with payterm
        // var payterm_val=$('#txtterm').val()
        // // selectpricevale * (1-searchTextDisIndes)
        // if(price==""){
        //     price=0
        // }
        // var total_pay=parseFloat(price)/12;
        // var total_last=parseFloat(total_pay)*payterm_val;
        // ///end
        // var qty=1
        // var ammount=qty*total_last
        // var total_dis=parseFloat(ammount)*parseFloat(search)/100;//for find disccount
        // $('#ammount'+num_row).html(parseFloat(ammount-total_dis))
        // $('#price'+num_row).html(ammount)
        // $('#original_price'+num_row).html(ammount)
        // $('#discount'+num_row).html(total_dis)
        // var sum=0;
        // var sumDiscount=0
        // var subtotal=0
        // $('.original_price').each(function(){
        //     if($(this).text()==""){
        //         $(this).text("0")
        //     }
        //     subtotal += parseFloat($(this).text());
        // });
        // $('.ammount').each(function(){
        //     if($(this).text()==""){
        //         $(this).text("0")
        //     }
        //     sum += parseFloat($(this).text());
        // });
        // $('.discount').each(function(){
        //     if($(this).text()==""){
        //         $(this).text("0")
        //     }
        //     sumDiscount += parseFloat($(this).text());
        // });
        // $('#value_discount').val(sumDiscount)
        // $('#value_subtotal').val(subtotal)
        //
        // $('#label_discount').html(numUSD.format(sumDiscount))
        // $("#label_subtotal").html(numUSD.format(subtotal))
        // $('#label_amount_due').html(numUSD.format(parseFloat(subtotal-sumDiscount)))
        // $('#label_total').html(numUSD.format(parseFloat(subtotal-sumDiscount)))

    })
    function formatDateForPint(date) {
        //function formation date
        var date=new Date(date)
        return    ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate()))+'-' +((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '-' + date.getFullYear()
    }
    function searchDiscountinDes(discount='') {

        if(discount.indexOf('%') < 0 ){

               return 0;

        }else{
                var dis_new=discount;
                var dis_last = dis_new.split(',')[1];
                var ampersandPosition = dis_last.indexOf('%');
                if(ampersandPosition != -1) {
                    dis_last = dis_last.substring(0, ampersandPosition);
                }else{
                    dis_last='0'
                }
                if(ampersandPosition==""){
                    dis_last=0
                    console.log(dis_last)
                }else{
                    dis_last = dis_last.substring(0, ampersandPosition);
                }
                return parseFloat(dis_last);
        }

    }
    $('#btn_payment').click(function () {
        var subtotal=$('#label_subtotal').text()
        var dis=$('#label_discount').text()
        var vat=$('#label_amount_due').text()
        var amount=$('#label_amount_due').text()
        var name=$('#txtstudent').children("option:selected").text()
        var due_date=$('#txtduedate').val()
        var invoice=$('#txt_text_invoice').val()
        var date_pay=$('#txtdatepay').val()
        $('#name_custom').html(name)
        $('#due_date_custom').html(formatDateForPint(due_date))
        $('#reciept_custom').html("CIN"+invoice)
        $('#date_pay_custom').html(formatDateForPint(date_pay))
        $('#print_sub').html(subtotal)
        $('#print_dis').html(dis)
        $('#print_vat').html(vat)
        $('#print_amount').html(amount)
        $("#myModal").modal({backdrop: 'static', keyboard: false})
        copyColumns("table_payment", "tbl_print_invoice",2,3,6,6);
        // make a copy of an existing row. We choose the last row of table
    })
    $('#btn_close').click(function () {
        $("#tbl_print_invoice tbody tr").detach();
    })
    function copyColumns(srcTableId, targetTableId) {
        var colNos = [].slice.call(arguments,2),
            $target = $("#" + targetTableId);
        $("#" + srcTableId + " tbody tr").each(function() {
            var $tds = $(this).children(),
                $row = $("<tr style='text-align: center;font-size: 10px'></tr>");
            for (var i = 0; i < colNos.length; i++){
                $row.append($tds.eq(colNos[i]).clone());
            }
            $row.appendTo($target);
        });

    }

    function printDiv(tagid) {
        var hashid = "#"+ tagid;
        var tagname =  $(hashid).prop("tagName").toLowerCase();
        var attributes = "";
        var divToPrint= $(hashid).html() ;
        var head = "<html><head>"+ $("head").html() + "</head>" ;
        var allcontent = head + "<body onload='window.print()' style='font-family: 'Kh Battambang''>"+ "<" + tagname + attributes + ">" +  divToPrint + "</" + tagname + ">" +  " </body></html>" ;
        var allcontent2 = head +"<body onload='window.print()' style='font-family: 'Kh Battambang'>"+ "<" + tagname + attributes + ">" +  divToPrint + "</" + tagname + ">" +  " </body></html>" ;
        var newWin=window.open('','Print-Window');
        newWin.document.open();
        newWin.document.write(allcontent,allcontent2);
        newWin.document.close();
    }
    $("#printer").click(function () {

        printDiv('div_pri')

    });
    $('#btn_print_invoice').click(function () {
        // printDiv('div_pri')
    })
    $('#btn_reciept').click(function () {
        printDiv('div_receipt')
    })
    $('#btn_payment_last').click(function () {
        var descript=[]
        var qty=[]
        var pro_service=[]
        var price=[]
        var discounts=[]
        var vali_date=[]
        var expired_date=[]
        var academic=[]
        var termpay=[]
        var amount=[]
        var number_invoice=$('#txtinvoice').val()
        var date_pay=$('#txtdatepay').val()
        var invoice_type=$('#txtinvoice_type').val()
        var student_id=$('#txtstudent').val()
        // var due_date=$('#txtduedate').val()
        var payment_method=$('#txtpayment_method').val()
        var discount=$('#txtdiscount').val()
        var txtpayterm=$('#txtterm').val()
        var txtremark=$('#txtremark').val()
        var txt_text_invoice=$("#txt_text_invoice").val()
        var txtdeposit=$('#txtdeposit').val()
        var txtacademic=$('#txtacademic').val()
        $('#table_payment .txtdescription').each(function () {
            descript.push($(this).text())
        })
        $('#table_payment .qty').each(function () {
            qty.push(parseFloat($(this).text()).toFixed())
        })
        $('#table_payment .pro_service_id').each(function () {
            pro_service.push($(this).text())
        })
        $('#table_payment .price').each(function () {
            price.push(parseFloat($(this).text()).toFixed())
        })
        $('#table_payment .txtdescription').each(function () {
            discounts.push(searchDiscountinDes($(this).text()))
        })
        // $('#table_payment .discount').each(function () {
        //     discounts.push($(this).text())
        // })
        $('#table_payment .vali_date').each(function () {
            vali_date.push($(this).val())
        })
       $('#table_payment .expired_date').each(function () {
            expired_date.push($(this).val())
        })
        $('#table_payment .academic').each(function () {
            academic.push($(this).val())
        })
        $('#table_payment .termpay').each(function () {
            termpay.push($(this).val())
        })
        $('#table_payment .original_price').each(function () {
            amount.push($(this).text())
        })
        console.log(discounts)
        Swal.fire({
            title:'Payment',
            text: "Are you Sure ? ",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancel',
            confirmButtonText: 'Yes'
            // 'due_date':due_date,
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    'type':'POST',
                    'url':'{{ route('payment.store') }}',
                    data:{'_token':'{{ @csrf_token() }}','student_id':student_id,'payment_date':date_pay,'payment_method':payment_method
                        ,'invoice_des': descript.join(','),'invoice_id':number_invoice,'id_payment':payment_method,
                        'id_invoice_type':invoice_type,'id_pro_service':pro_service,
                        'id_payterm':txtpayterm,'campus_id':'{{ \Illuminate\Support\Facades\Auth::user()->camp_id }}'
                        ,'user_id_pay':'{{ \Illuminate\Support\Facades\Auth::user()->id }}','description':descript,
                        'qty':qty,'ori_price':price,'disccount':discounts,'Volidty_of_payment':vali_date,'expired_date':expired_date,'school_year':academic
                        ,"remark":txtremark,'id_payterm':termpay,"txt_text_invoice":txt_text_invoice,"txtdeposit":txtdeposit,'amount':amount,'txtacademic':txtacademic
                    },
                    success:function (data) {
                           $("#btn_payment_last").prop('disabled', true);
                           printDiv('div_pri')
                           window.location.reload()
                    }
                })
            }else{
                $("#tbl_print_invoice tbody tr").detach();
                $("#myModal").modal('hide');
            }
        })
    })
    $('#txtdeposit').keyup(function () {
        $('#label_deposit').html(numUSD.format($(this).val()))
    })
    $('#tbl_pro_service').on('click','.btn_add_pro_service',function () {
        $('#modal_service').modal({backdrop: 'static', keyboard: false})
    })
    $('#tbl_pro_service').on('click','.btn_edit_pro_service',function () {
        $('#modal_service').modal({backdrop: 'static', keyboard: false})
    })
    $('#btn_save_service').click(function () {
        var service_n
        ame=$('#txtservice_name').val()
        var price_service=$('#txtprice_service').val()
        $.ajax({
            type:'post',
            url:'{{ route('save_prosevice') }}',
            data:{'_token':'{{ @csrf_token() }}','service_name':service_name,'price_service':price_service},
            success:function (data) {
                Swal.fire(
                    'New Product Service',
                    'Successfully',
                    'success'
                )
            }
        })
    })
    $('#btn_save_payment').click(function () {
        var descript=[]
        var qty=[]
        var pro_service=[]
        var price=[]
        var discounts=[]
        var vali_date=[]
        var expired_date=[]
        var academic=[]
        var termpay=[]
        var amount=[]
        var number_invoice=$('#txtinvoice').val()
        var date_pay=$('#txtdatepay').val()
        var invoice_type=$('#txtinvoice_type').val()
        var student_id=$('#txtstudent').val()
        // var due_date=$('#txtduedate').val()
        var payment_method=$('#txtpayment_method').val()
        var discount=$('#txtdiscount').val()
        var txtpayterm=$('#txtterm').val()
        var txtremark=$('#txtremark').val()
        var txt_text_invoice=$("#txt_text_invoice").val()
        var txtdeposit=$('#txtdeposit').val()
        var txtacademic=$('#txtacademic').val()
        $('#table_payment .txtdescription').each(function () {
            descript.push($(this).text())
        })
        $('#table_payment .qty').each(function () {
            qty.push(parseFloat($(this).text()).toFixed())
        })
        $('#table_payment .pro_service_id').each(function () {
            pro_service.push($(this).text())
        })
        $('#table_payment .price').each(function () {
            price.push(parseFloat($(this).text()).toFixed())
        })
        $('#table_payment .txtdescription').each(function () {
            discounts.push(searchDiscountinDes($(this).text()))
        })
        // $('#table_payment .discount').each(function () {
        //     discounts.push($(this).text())
        // })
        $('#table_payment .vali_date').each(function () {
            vali_date.push($(this).val())
        })
        $('#table_payment .expired_date').each(function () {
            expired_date.push($(this).val())
        })
        $('#table_payment .academic').each(function () {
            academic.push($(this).val())
        })
        $('#table_payment .termpay').each(function () {
            termpay.push($(this).val())
        })
        $('#table_payment .original_price').each(function () {
            amount.push($(this).text())
        })
        console.log(discounts)
        Swal.fire({
            title:'Payment',
            text: "You want to save  ? ",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancel',
            confirmButtonText: 'Yes'
            // 'due_date':due_date,
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    'type':'POST',
                    'url':'{{ route('save_payment') }}',
                    data:{'_token':'{{ @csrf_token() }}','student_id':student_id,'payment_date':date_pay,'payment_method':payment_method
                        ,'invoice_des': descript.join(','),'invoice_id':number_invoice,'id_payment':payment_method,
                        'id_invoice_type':invoice_type,'id_pro_service':pro_service,
                        'id_payterm':txtpayterm,'campus_id':'{{ \Illuminate\Support\Facades\Auth::user()->camp_id }}'
                        ,'user_id_pay':'{{ \Illuminate\Support\Facades\Auth::user()->id }}','description':descript,
                        'qty':qty,'ori_price':price,'disccount':discounts,'Volidty_of_payment':vali_date,'expired_date':expired_date,'school_year':academic
                        ,"remark":txtremark,'id_payterm':termpay,"txt_text_invoice":txt_text_invoice,"txtdeposit":txtdeposit,'amount':amount,'txtacademic':txtacademic
                    },
                    success:function (data) {
                        // $("#btn_payment_last").prop('disabled', true);
                        // printDiv('div_pri')
                        window.location.reload()
                    }
                })
            }else{
                $("#tbl_print_invoice tbody tr").detach();
                $("#myModal").modal('hide');
            }
        })
    })
</script>
    <script>
        var a = '';
        var b = '';
        var num = [];
        var ans;
        // All the numbers and operators input will be stored in an array "num" using function "sendNum()"
        function sendNum(digit){
            num.push(digit);
            if(num.length != 1){
                a = '';
                document.getElementById('screen').innerHTML = a;		// clearing the screen.
            }
            for(i=0; i<num.length ; i++){
                a = a + num[i];				// concatenate the elements of the array "num" into a single string, which will be displayed on the screen
            }
            document.getElementById('screen').innerHTML = a;	// displaying the concatenated string
        }
        // when the user presses "=", function "equalTo()" is called
        function equalTo(){
            document.getElementById('screen').innerHTML = '';
            for(i=0; i<num.length ; i++){
                b += num[i];						// concatenating the array "num" into a single string
            }
            ans = eval(b);
            document.getElementById('screen').innerHTML = ans;		// result display
            while(num.length > 0){
                num.pop();				// emptying the array "num"
            }
            num.push(ans.toString());
        }
        // When user presses "AC", function "clearScr()" is called
        function clearScr(){
            document.getElementById('screen').innerHTML = '';
            while(num.length > 0){
                num.pop();				// emptying the array "num"
            }
            a ='';
            b ='';
        }
        // $(document).keypress(function(e){
        //     var code = e.keyCode || e.which;
        //     switch (code) {
        //             case 49 || 97 :
        //               sendNum('1')
        //             break;
        //             case 50 || 98 :
        //                sendNum('2')
        //             break;
        //         case 51 || 99:
        //             sendNum('3')
        //             break;
        //         case 52 || 100 :
        //             sendNum('4')
        //             break;
        //         case 53 || 101 :
        //             sendNum('5')
        //             break;
        //         case 54 || 102 :
        //             sendNum('6')
        //             break;
        //         case 55 || 103 :
        //             sendNum('7')
        //             break;
        //         case 56 || 104 :
        //             sendNum('8')
        //             break;
        //         case 57  || 105 :
        //             sendNum('9')
        //             break;
        //         case 48 || 96 :
        //             sendNum('0')
        //             break;
        //     }
        //     if(e.key=='*'){
        //         sendNum('*')
        //     }else if(e.key=='/')
        //     {
        //         sendNum('/')
        //     }else if(e.key=='-')
        //     {
        //         sendNum('-')
        //     }else if(e.key=='+'){
        //         sendNum('+')
        //     }else if(code==13)
        //     {
        //         equalTo()
        //     }
        // })

    </script>
@endsection


