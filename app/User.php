<?php

namespace App;

use App\Campaign;
use App\Company;
use Caffeinated\Shinobi\Concerns\HasRolesAndPermissions;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    // Permitir a laravel autentificar usuarios, atravez de acces tokens, mediante el trait (laravel passport) de HasApiTokens
    use Notifiable, HasApiTokens, HasRolesAndPermissions;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'company_id',
        'user_registry_id',
        'admin_registry_id',
        'name',
        'surnames',
        'email',
        'password',
        'img_profile',
        'last_session',
    ];

    /*  MUTADORES */
    public function setNameAttribute($name) {
        $this->attributes['name'] = strtolower($name);
    }

    public function setEmailAttribute($email) {
        $this->attributes['email'] = strtolower($email);
    }

    public function setSurnamesAttribute($surnames) {
        $this->attributes['surnames'] = strtolower($surnames);
    }

    /* ACCESORES */
    public function getNameAttribute($name) {
        return ucwords($name);
    }

    public function getSurnamesAttribute($surnames) {
        return ucwords($surnames);
    }

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function company() {
        return $this->belongsTo(Company::class);
    }

    public function campaigns_sellers() {
        return $this->hasMany(Campaign::class, 'user_registry_id');
    }

    public function campaigns_customers() {
        return $this->hasMany(Campaign::class, 'customer_campaign_id');
    }

    public function customers() {
        return $this->hasMany(User::class, 'user_registry_id');
    }

    public function users_admin() {
        return $this->hasMany(User::class, 'admin_registry_id');
    }
}
