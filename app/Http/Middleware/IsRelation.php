<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class IsRelation
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
//        if(Auth::user()->role==5){
//            return redirect()->route('payment');
//        }
        if(Auth::user()->role == 5 || Auth::user()->role == 3 || Auth::user()->role == 2 || Auth::user()->role == 1){
            return $next($request);
        }else{
            return redirect()->route('noperm');
        }
    }
}
