<?php

declare(strict_types=1);

namespace App\Http\Controllers;

class HomeController extends BaseController
{
    public function view()
    {
        return view('pages.home');
    }
}
