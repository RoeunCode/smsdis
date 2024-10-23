<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class NUserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function changepw(Request $r)
    {
        $old = $r->old;
        $og = User::findorfail(Auth::id());
        $chk = Hash::check($old, $og->password);
        if ($chk) {
            User::updateOrCreate(['id' => Auth::id()], ['password' => Hash::make($r->new)]);
            return '1';
        } else {
            return '0';
        }
    }
}
