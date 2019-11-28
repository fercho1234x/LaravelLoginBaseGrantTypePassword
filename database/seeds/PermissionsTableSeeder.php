<?php

use Illuminate\Database\Seeder;
use Caffeinated\Shinobi\Models\Permission;

class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Users
        Permission::create([
    		'name'			=>			'Listar todos los usuarios',
    		'slug'			=>			'users.index',
    		'description'	=>			'Listara todos los usuarios'
    	]);

        Permission::create([
            'name'          =>          'Listar todos los usuarios (administrador ventas)',
            'slug'          =>          'users.adminsales',
            'description'   =>          'Listara todos los usuarios de un administrador ventas'
        ]);

        Permission::create([
            'name'          =>          'Listar todos los usuarios (vendedor)',
            'slug'          =>          'users.seller',
            'description'   =>          'Listara todos los usuarios de un vendedor'
        ]);

        Permission::create([
            'name'          =>          'Agregar usuarios',
            'slug'          =>          'users.store',
            'description'   =>          'Agregar usuarios'
        ]);

        Permission::create([
            'name'          =>          'Mostrar un usuario en especifico',
            'slug'          =>          'users.show',
            'description'   =>          'Mostrar un usuario en especifico'
        ]);

        Permission::create([
            'name'          =>          'Actualizar usuarios',
            'slug'          =>          'users.update',
            'description'   =>          'Actualizar usuarios (Se tendra acceso dependiendo del tipo de usuario)'
        ]);

    }
}
