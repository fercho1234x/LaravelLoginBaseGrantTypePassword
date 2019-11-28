<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
|  Here is where you can register API routes for your application. These
|  routes are loaded by the RouteServiceProvider within a group which
|  is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::get('', function() {
	return '&copy; PRODOOH - Todos los derechos reservados '.date('Y').'.';
});

/* USERS */
Route::resource('users', 'User\UserController')->except('create', 'edit', 'destroy');
Route::get('users-adminsales', 'User\UserController@usersAdminSales')->name('users.adminsales');
Route::get('users-seller', 'User\UserController@usersSeller')->name('users.seller');
Route::resource('users.campaigns', 'User\UserCampaignController')->only('index');
Route::get('logout', 'User\UserController@logout')->name('user.logout');
/* COMPANIES */
Route::resource('companies', 'Company\CompanyController')->except('create', 'edit', 'destroy');
Route::resource('companies.users', 'Company\CompanyUserController')->only('index');
/* SCREENS */
/*Route::resource('screens', 'Screen\ScreenController')->except('create', 'edit', 'destroy', 'index');
Route::post('screens/filtered', 'Screen\ScreenController@filteredScreens')->name('screens.filtered');*/

/* WALLS */
Route::resource('walls', 'Wall\WallController')->except('create', 'edit', 'destroy', 'index');
Route::post('walls/filtered', 'Wall\WallController@filteredWalls')->name('walls.filtered');
/* CIRCUITS */
Route::resource('circuits', 'Circuit\CircuitController')->except('create', 'edit', 'destroy');
/* CAMPAIGNS */
Route::resource('campaigns', 'Campaign\CampaignController')->except('create', 'edit');
Route::get('campaigns-adminsales', 'Campaign\CampaignController@campaingsAdminSales')->name('campaigns.adminsales');
Route::get('my-campaigns', 'Campaign\CampaignController@myCampaigns')->name('campaigns.me');
Route::resource('campaigns.screens', 'Campaign\CampaignScreenController')->only('index', 'store', 'destroy');
Route::resource('campaigns.polygons', 'Campaign\CampaignPolygonController')->only('store', 'destroy', 'index');
Route::resource('campaigns.pointsofinterest', 'Campaign\CampaignPointOfInterestController')->only('store', 'destroy', 'index');
Route::get('campaigns/{campaign}/duplicate', 'Campaign\CampaignController@duplicate')->name('campaigns.duplicate');
Route::get('campaigns/{campaign}/disable', 'Campaign\CampaignController@disableCampaign')->name('campaigns.disable');
Route::get('campaigns/{campaign}/activate', 'Campaign\CampaignController@activateCampaign')->name('campaigns.activate');
/*TAGS*/
Route::resource('tags', 'Tag\TagController')->except('create', 'edit');
/*COUNTRIES*/
Route::resource('countries', 'Country\CountryController')->except('create', 'edit');
/* LOGIN */
Route::post('oauth/token', '\Laravel\Passport\Http\Controllers\AccessTokenController@issueToken');