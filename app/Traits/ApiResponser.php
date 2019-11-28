<?php
namespace App\Traits;

use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Validator;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Collection;

trait ApiResponser
{
	private function successResponse($data, $code)
	{
		return response()->json($data, $code);
	}

	protected function errorResponse($message, $code)
	{
		return response()->json(['error' => $message, 'code' => $code], $code);
	}

	protected function showAll(Collection $collection, $code = 200)
	{	
		// Habilitar si se necesita filtrar los datos, modificar el metodo, para que funcione correctamente
		//$collection = $this->filterData($collection);

		$collection = $this->sortData($collection);
		$collection = $this->paginate($collection);

		// Habilitar para guardar en cache, modificar para que solo guarde lo necesario
		//$collection = $this->cacheResponse($collection);
		return $this->successResponse($collection, $code);
	}

	protected function showOne(Model $instance, $code = 200)
	{
		return $this->successResponse(['data' => $instance], $code);
	}

	protected function filterData(Collection $collection) {
		foreach (request()->query() as $query => $value) {
			$collection = $collection->where($query, $value);
		}
		return $collection;
	}

	protected function sortData(Collection $collection) {
		if (request()->has('sort_by')) {
			$attribute = request('sort_by');
			$collection = $collection->sortBy->{$attribute};
		}
		return $collection;
	}

	protected function paginate(Collection $collection) {
		$rules = [
			'per_page' => 'regex:/^[a-zA-Z0-9]+$/'
		];
		Validator::validate(request()->all(), $rules);

		$page = LengthAwarePaginator::resolveCurrentPage();
		$perPage = 30;
		if (request()->has('per_page')) {
			if (strtolower(request('per_page')) == 'all') {
				$perPage = $collection->count();
			} else {
				if (is_numeric(request('per_page'))) {
					$perPage = (int) request('per_page');
				}
			}
		}

		$results = $collection->slice(($page - 1) * $perPage, $perPage)->values();
		$paginated = new LengthAwarePaginator($results, $collection->count(), $perPage, $page, [
			'path' => LengthAwarePaginator::resolveCurrentPath(),
		]);
		$paginated->appends(request()->all());
		return $paginated;
	}

	protected function message($message, $code)
	{
		return response()->json(['message' => $message, 'code' => $code]);
	}

	// Mantener respuestas en chache
	protected function cacheResponse($data) {
		$url = request()->url();

		$queryParams = request()->query();

		// ordena un array, dependiendo de la clave
		ksort($queryParams);

		$queryString = http_build_query($queryParams);

		$fullUrl = "{$url}?{$queryString}";

		// un identificador de una consulta para el cache, el tiempo que se mantendra en cache (seg)
		return Cache::remember($fullUrl, 60, function() use($data) {
			return $data;
		});
	}
}