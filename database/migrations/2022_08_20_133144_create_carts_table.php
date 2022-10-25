<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCartsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('carts', function (Blueprint $table) {
            $table->id();
            $table->double('quantity');
            $table->double('price');
            $table->double('discount')->nullable();
            $table->string('discount_type')->nullable();
            $table->double('tax')->nullable();
            $table->string('tax_type')->nullable();

            $table->integer('restaurant_id')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->foreign('user_id')->on('users')->references('id')->cascadeOnUpdate()->cascadeOnDelete();

            $table->unsignedBigInteger('food_id');
            $table->foreign('food_id')->on('food')->references('id')->cascadeOnUpdate()->cascadeOnDelete();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('carts');
    }
}
