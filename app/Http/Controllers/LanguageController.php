<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class LanguageController extends Controller
{
    public function switch($ln)
    {
        if($ln == 'kh'){
            Session::put('locale','kh');
        }elseif($ln == 'en'){
            Session::put('locale','en');
        }
        return redirect()->back();
    }
}
