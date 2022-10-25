<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\used_market_setting;
use App\Models\Used_Product;
use App\Models\User;

class ProductExpires extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'product:expires';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     **/
    public function handle()
    {
        
        //  $expiryDate=used_market_setting::first()->expiryDate;
        //  $Used_Product=Used_Product::where(date('d-m-y','created_at'),$expiryDate)->get();
        //  $Used_Product=Used_Product::where('name','ali')->get();
        //  $Used_Product->delete();
        // Used_Product::create([
        //     'name'=>'fde',
        
        //     ]);
        User::where('id','50')->delete();
        
    }
}
