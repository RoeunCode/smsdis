@extends('layout')

@section('header')


@endsection
@section('content')
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-md-12">
            <div class="card">
                <div class="card-header bg-inverse bg-primary">
                    <p>Score For Online Class</p>
                </div>
                <div class="card-block">
                    <h4>Select Grade </h4>
                    <hr>
                    <br>
                    <div class="row">
                        <div class="col-sm-2 col-lg-2 ">
                            <a class="card" href="{{ route('ShowGrade',7) }}" >
                                <div class="card-header bg-primary">

                                </div>
                                <div class="card-block clearfix">

                                    <div class="text-center">
                                        <h4 >ថ្នាក់ទី 7</h4>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-sm-2 col-lg-2 b">
                            <a class="card" href="{{ route('score_online_grade_8.index') }}">
                                <div class="card-header bg-red">

                                </div>
                                <div class="card-block clearfix">

                                    <div class="text-center">
                                        <h4 >ថ្នាក់ទី 8</h4>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="col-sm-2 col-lg-2 b">
                            <a class="card" href="{{ route('score_online_grade_9.index') }}">
                                <div class="card-header bg-green">

                                </div>
                                <div class="card-block clearfix ">

                                    <div class="text-center">
                                        <h4 >ថ្នាក់ទី 9</h4>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="col-sm-2 col-lg-2 b">
                            <a class="card" href="{{ route('score_online_grade_10.index')}}">
                                <div class="card-header bg-cyan">

                                </div>
                                <div class="card-block clearfix">

                                    <div class="text-center">
                                        <h4 >ថ្នាក់ទី 10</h4>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="col-sm-2 col-lg-2 b">
                            <a class="card" href="{{ route('score_online_grade_11.index') }}">
                                <div class="card-header bg-teal">

                                </div>
                                <div class="card-block clearfix ">
                                    <div class="text-center">
                                        <h4 >ថ្នាក់ទី 11</h4>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="col-sm-2 col-lg-2 b">
                            <a class="card" href="{{ route('score_online_grade_12.index') }}">
                                <div class="card-header bg-app-tertiary">

                                </div>
                                <div class="card-block clearfix ">

                                    <div class="text-center">
                                        <h4 >ថ្នាក់ទី 12</h4>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('footer')


@endsection
