<?php

namespace App\Http\Controllers;

use App\Violation;
use Illuminate\Http\Request;

class ViolationController extends Controller
{
    public function addViolin(Request $r)
    {
        Violation::create($r->all());
        return 1;
    }
}
