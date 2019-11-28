<?php

namespace App\Http\Controllers\User;

use Caffeinated\Shinobi\Models\Role;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Company;
use App\User;

class UserController extends ApiController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Listar todos los usuario.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->showAll(User::all());
    }

}
